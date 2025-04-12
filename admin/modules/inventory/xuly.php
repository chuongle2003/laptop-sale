/**
* Xử lý các thao tác liên quan đến phiếu nhập kho:
* - Thêm sản phẩm vào phiếu
* - Lưu phiếu nhập
* - Xóa sản phẩm khỏi phiếu
* - Xóa toàn bộ phiếu
*/

session_start();
include('../../config/config.php');
require '../../../carbon/autoload.php';

use Carbon\Carbon;
use Carbon\CarbonInterval;

/**
* Xử lý xóa nhiều phiếu nhập
*/
if (isset($_GET['data'])) {
$data = $_GET['data'];
$inventory_ids = json_decode($data);

// Bắt đầu transaction
mysqli_begin_transaction($mysqli);

try {
foreach ($inventory_ids as $id) {
// Lấy thông tin phiếu nhập
$sql_get_inventory = "SELECT * FROM inventory WHERE inventory_id = $id";
$query_get_inventory = mysqli_query($mysqli, $sql_get_inventory);
$inventory = mysqli_fetch_array($query_get_inventory);

// Lấy chi tiết phiếu nhập
$sql_get_details = "SELECT * FROM inventory_detail WHERE inventory_code = '" . $inventory['inventory_code'] . "'";
$query_get_details = mysqli_query($mysqli, $sql_get_details);

// Cập nhật lại số lượng tồn kho
while ($detail = mysqli_fetch_array($query_get_details)) {
$sql_update_quantity = "UPDATE product SET product_quantity = product_quantity - " . $detail['product_quantity'] . "
WHERE product_id = " . $detail['product_id'];
mysqli_query($mysqli, $sql_update_quantity);
}

// Xóa chi tiết phiếu
$sql_delete_details = "DELETE FROM inventory_detail WHERE inventory_code = '" . $inventory['inventory_code'] . "'";
mysqli_query($mysqli, $sql_delete_details);

// Xóa phiếu nhập
$sql_delete = "DELETE FROM inventory WHERE inventory_id = $id";
mysqli_query($mysqli, $sql_delete);
}

// Commit transaction
mysqli_commit($mysqli);
header('Location:../../index.php?action=inventory&query=inventory_list&message=success');
} catch (Exception $e) {
// Rollback nếu có lỗi
mysqli_rollback($mysqli);
error_log("Lỗi khi xóa phiếu nhập: " . $e->getMessage());
header('Location:../../index.php?action=inventory&query=inventory_list&message=error');
}
}

/**
* Xử lý thêm sản phẩm vào phiếu nhập
*/
if (isset($_POST['addtoinventory'])) {
$product_id = mysqli_real_escape_string($mysqli, $_POST['product_id']);
$product_quantity = (int)$_POST['product_quantity'];
$product_price_import = str_replace(['.', ',', 'đ', ' '], '', $_POST['product_price_import']);
$product_price_import = (float)$product_price_import;

// Kiểm tra sản phẩm tồn tại
$sql = "SELECT * FROM product WHERE product_id = ? LIMIT 1";
$stmt = mysqli_prepare($mysqli, $sql);
mysqli_stmt_bind_param($stmt, "s", $product_id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$row = mysqli_fetch_array($result);

if (!$row) {
header('Location: ' . $_SERVER['HTTP_REFERER'] . '&message=error&error=product');
exit();
}

// Kiểm tra số lượng hợp lệ
if ($product_quantity <= 0) {
    header('Location: ' . $_SERVER[' HTTP_REFERER'] . '&message=error&error=quantity' );
    exit();
    }

    // Kiểm tra giá nhập hợp lệ
    if ($product_price_import <=0) {
    header('Location: ' . $_SERVER[' HTTP_REFERER'] . '&message=error&error=price' );
    exit();
    }

    $new_product=array( 'product_id'=> $product_id,
    'product_name' => $row['product_name'],
    'product_quantity' => $product_quantity,
    'product_price_import' => $product_price_import
    );

    if (isset($_SESSION['inventory'])) {
    $found = false;
    $product = array();
    foreach ($_SESSION['inventory'] as $inventory_item) {
    if ($inventory_item['product_id'] == $product_id) {
    $product[] = array(
    'product_id' => $inventory_item['product_id'],
    'product_name' => $inventory_item['product_name'],
    'product_quantity' => $inventory_item['product_quantity'] + $product_quantity,
    'product_price_import' => $product_price_import
    );
    $found = true;
    } else {
    $product[] = array(
    'product_id' => $inventory_item['product_id'],
    'product_name' => $inventory_item['product_name'],
    'product_quantity' => $inventory_item['product_quantity'],
    'product_price_import' => $inventory_item['product_price_import']
    );
    }
    }

    if (!$found) {
    $_SESSION['inventory'] = array_merge($product, array($new_product));
    } else {
    $_SESSION['inventory'] = $product;
    }
    } else {
    $_SESSION['inventory'] = array($new_product);
    }

    header('Location: ' . $_SERVER['HTTP_REFERER'] . '&message=success');
    }

    /**
    * Xử lý lưu phiếu nhập
    */
    if (isset($_POST['inventory_add'])) {
    // Validate dữ liệu đầu vào
    if (!isset($_SESSION['inventory']) || empty($_SESSION['inventory'])) {
    header('Location:../../index.php?action=inventory&query=inventory_add&message=error&error=empty');
    exit();
    }

    $staf_name = mysqli_real_escape_string($mysqli, $_POST['staf_name']);
    $supplier_name = mysqli_real_escape_string($mysqli, $_POST['supplier_name']);
    $inventory_note = mysqli_real_escape_string($mysqli, isset($_POST['inventory_note']) ? $_POST['inventory_note'] : '');
    $inventory_phone = mysqli_real_escape_string($mysqli, $_POST['inventory_phone']);

    if (empty($staf_name) || empty($supplier_name) || empty($inventory_phone)) {
    header('Location:../../index.php?action=inventory&query=inventory_add&message=error&error=missing');
    exit();
    }

    // Validate số điện thoại
    if (!preg_match('/^[0-9]{10}$/', $inventory_phone)) {
    header('Location:../../index.php?action=inventory&query=inventory_add&message=error&error=phone');
    exit();
    }

    // Tạo mã phiếu nhập ngẫu nhiên và kiểm tra trùng
    do {
    $inventory_code = rand(1000, 9999);
    $check_code = mysqli_query($mysqli, "SELECT inventory_code FROM inventory WHERE inventory_code = $inventory_code");
    } while (mysqli_num_rows($check_code) > 0);

    // Bắt đầu transaction
    mysqli_begin_transaction($mysqli);

    try {
    $inventory_date = Carbon::now('Asia/Ho_Chi_Minh')->toDateString();
    $total_amount = 0;

    // Lưu thông tin phiếu
    $sql_insert_inventory = "INSERT INTO inventory(account_id, staf_name, supplier_name, supplier_phone, inventory_note, inventory_code, inventory_date, total_amount, inventory_status)
    VALUE (?, ?, ?, ?, ?, ?, ?, 0, 1)";

    $stmt = mysqli_prepare($mysqli, $sql_insert_inventory);
    if (!$stmt) {
    throw new Exception("Lỗi prepare statement: " . mysqli_error($mysqli));
    }

    mysqli_stmt_bind_param(
    $stmt,
    "sssssss",
    $_SESSION['account_id'],
    $staf_name,
    $supplier_name,
    $inventory_phone,
    $inventory_note,
    $inventory_code,
    $inventory_date
    );

    if (!mysqli_stmt_execute($stmt)) {
    throw new Exception("Lỗi khi lưu phiếu nhập: " . mysqli_stmt_error($stmt));
    }

    // Lưu chi tiết sản phẩm và cập nhật tồn kho
    foreach ($_SESSION['inventory'] as $inventory_item) {
    $product_id = $inventory_item['product_id'];
    $product_quantity = $inventory_item['product_quantity'];
    $product_price_import = $inventory_item['product_price_import'];

    // Cập nhật số lượng tồn kho
    $sql_update_product = "UPDATE product SET
    product_quantity = product_quantity + ?,
    product_price_import = ?,
    product_status = 1
    WHERE product_id = ?";

    $stmt = mysqli_prepare($mysqli, $sql_update_product);
    if (!$stmt) {
    throw new Exception("Lỗi prepare statement: " . mysqli_error($mysqli));
    }

    mysqli_stmt_bind_param(
    $stmt,
    "ids",
    $product_quantity,
    $product_price_import,
    $product_id
    );

    if (!mysqli_stmt_execute($stmt)) {
    throw new Exception("Lỗi khi cập nhật sản phẩm: " . mysqli_stmt_error($stmt));
    }

    // Lưu chi tiết phiếu
    $sql_insert_detail = "INSERT INTO inventory_detail(inventory_code, product_id, product_quantity, product_price_import)
    VALUE (?, ?, ?, ?)";

    $stmt = mysqli_prepare($mysqli, $sql_insert_detail);
    if (!$stmt) {
    throw new Exception("Lỗi prepare statement: " . mysqli_error($mysqli));
    }

    mysqli_stmt_bind_param(
    $stmt,
    "siid",
    $inventory_code,
    $product_id,
    $product_quantity,
    $product_price_import
    );

    if (!mysqli_stmt_execute($stmt)) {
    throw new Exception("Lỗi khi lưu chi tiết phiếu: " . mysqli_stmt_error($stmt));
    }

    // Tính tổng tiền
    $total_amount += $product_price_import * $product_quantity;
    }

    // Cập nhật tổng tiền phiếu
    $sql_update_total = "UPDATE inventory SET total_amount = ? WHERE inventory_code = ?";
    $stmt = mysqli_prepare($mysqli, $sql_update_total);
    if (!$stmt) {
    throw new Exception("Lỗi prepare statement: " . mysqli_error($mysqli));
    }

    mysqli_stmt_bind_param($stmt, "di", $total_amount, $inventory_code);

    if (!mysqli_stmt_execute($stmt)) {
    throw new Exception("Lỗi khi cập nhật tổng tiền: " . mysqli_stmt_error($stmt));
    }

    // Commit transaction
    mysqli_commit($mysqli);
    unset($_SESSION['inventory']);
    header('Location:../../index.php?action=inventory&query=inventory_detail&inventory_code=' . $inventory_code . '&message=success');
    } catch (Exception $e) {
    // Rollback nếu có lỗi
    mysqli_rollback($mysqli);
    error_log("Lỗi khi lưu phiếu nhập: " . $e->getMessage());
    header('Location:../../index.php?action=inventory&query=inventory_add&message=error');
    }
    }

    /**
    * Xử lý xóa sản phẩm khỏi phiếu nhập
    */
    if (isset($_SESSION['inventory']) && isset($_GET['delete'])) {
    $product_id = $_GET['delete'];
    $product = array();

    foreach ($_SESSION['inventory'] as $inventory_item) {
    if ($inventory_item['product_id'] != $product_id) {
    $product[] = array(
    'product_id' => $inventory_item['product_id'],
    'product_name' => $inventory_item['product_name'],
    'product_quantity' => $inventory_item['product_quantity'],
    'product_price_import' => $inventory_item['product_price_import']
    );
    }
    }

    if (empty($product)) {
    unset($_SESSION['inventory']);
    } else {
    $_SESSION['inventory'] = $product;
    }

    header('Location:../../index.php?action=inventory&query=inventory_add&message=success');
    exit();
    }

    /**
    * Xử lý xóa toàn bộ sản phẩm trong phiếu
    */
    if (isset($_GET['deleteall']) && $_GET['deleteall'] == 1) {
    unset($_SESSION['inventory']);
    header('Location:../../index.php?action=inventory&query=inventory_add&message=success');
    exit();
    }