<?php
//  unset($_SESSION['inventory']);
// Tạo mã phiếu nhập ngẫu nhiên và kiểm tra trùng
do {
    $inventory_code = rand(1000, 9999);
    $check_code = mysqli_query($mysqli, "SELECT inventory_code FROM inventory WHERE inventory_code = $inventory_code");
} while (mysqli_num_rows($check_code) > 0);
?>
<div class="row" style="margin-bottom: 10px;">
    <div class="col d-flex" style="justify-content: space-between; align-items: flex-end;">
        <h3 class="card-title">
            Thông tin nhập kho
        </h3>
        <a href="index.php?action=inventory&query=inventory_list" class="btn btn-outline-dark btn-fw">
            <i class="mdi mdi-reply"></i>
            Quay lại
        </a>
    </div>
</div>
<div class="row">
    <div class="col-lg-8 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <div class="card-content">
                    <form action="modules/inventory/xuly.php" method="POST" id="inventoryForm">
                        <div class="receipt">
                            <div class="receipt__header text-center">
                                <h3 class="receipt__title">Phiếu Nhập Kho</h3>
                                <p>Mã phiếu : <?php echo $inventory_code ?></p>
                                <p class="receipt__date">Ngày nhập: <?php echo date("d-m-Y"); ?></p>
                            </div>
                            <div class="receipt__info">
                                <table>
                                    <tr>
                                        <td>
                                            <p class="receipt__info--name">Người nhập kho: <input class="receipt__info--input" id="stafName" name="staf_name" type="text" placeholder="tên người nhập" required></p>
                                        </td>
                                        <td>
                                            <p class="receipt__info--company">Tên đơn vị cung cấp: <input class="receipt__info--input" id="supplierName" name="supplier_name" type="text" placeholder="tên đơn vị cung cấp" required></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="receipt__info--note">Ghi chú: <input class="receipt__info--input" id="inventoryNote" name="inventory_note" type="text" placeholder="Lý do nhập kho"></p>
                                        </td>
                                        <td>
                                            <p class="receipt__info--company">Số điện thoại: <input class="receipt__info--input" id="supplierPhone" name="inventory_phone" type="text" placeholder="nhập vào số điện thoại" required></p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="table-responsive receipt__table" style="margin-top: 20px;">
                                <table class="table table-hover table-action">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>
                                                #
                                            </th>
                                            <th>Tên sản phẩm</th>
                                            <th class="text-center">Số lượng</th>
                                            <th class="text-right">Đơn giá</th>
                                            <th class="text-right">Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $total = 0;
                                        if (isset($_SESSION['inventory'])) {
                                            $i = 0;
                                            foreach ($_SESSION['inventory'] as $inventory_item) {
                                                $i++;
                                                // Chuyển đổi chuỗi thành số trước khi tính toán
                                                $price = (float)str_replace(['.', ',', 'đ', ' '], '', $inventory_item['product_price_import']);
                                                $quantity = (int)$inventory_item['product_quantity'];
                                                $subtotal = $price * $quantity;
                                                $total += $subtotal;
                                        ?>
                                                <tr>
                                                    <td>
                                                        <a href="modules/inventory/xuly.php?delete=<?php echo $inventory_item['product_id'] ?>">
                                                            <div class="icon-edit">
                                                                <img class="w-100 h-100" src="images/icon-delete.png" alt="">
                                                            </div>
                                                        </a>
                                                    </td>
                                                    <td><?php echo $i ?></td>
                                                    <td><?php echo $inventory_item['product_name'] ?></td>
                                                    <td class="text-center"><?php echo number_format($quantity) ?></td>
                                                    <td class="text-right"><?php echo number_format($price, 0, ',', '.') ?>₫</td>
                                                    <td class="text-right"><?php echo number_format($subtotal, 0, ',', '.') ?>₫</td>
                                                </tr>
                                            <?php
                                            }
                                        } else {
                                            ?>
                                            <tr>
                                                <td colspan="5" class="text-center">
                                                    <p>Hiện không có sản phẩm nào</p>
                                                </td>
                                            </tr>
                                        <?php
                                        }
                                        ?>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="5" class="text-right"><strong>Tổng cộng:</strong></td>
                                            <td class="text-right"><strong><?php echo number_format($total, 0, ',', '.') ?>₫</strong></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="w-100" style="text-align: right;">
                                <a href="modules/inventory/xuly.php?deleteall=1" class="btn btn-danger btn-icon-text" style="margin-right: 10px;">
                                    <i class="ti-trash btn-icon-prepend"></i>
                                    Xóa tất cả
                                </a>
                                <button type="submit" name="inventory_add" class="btn btn-primary btn-icon-text">
                                    <i class="ti-file btn-icon-prepend"></i>
                                    Lưu
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <div class="card-content">
                    <form action="modules/inventory/xuly.php" method="POST" id="addProductForm">
                        <div class="main-pane-top">
                            <h4 class="card-title">Sản phẩm nhập</h4>
                        </div>
                        <div class="input-item form-group">
                            <label for="productid" class="d-block">Sản phẩm <span class="text-danger">*</span></label>
                            <select name="product_id" id="productid" class="form-control select_product" required>
                                <option value="">-- Chọn sản phẩm --</option>
                                <?php
                                $sql_product_list = "SELECT * FROM product ORDER BY product_name ASC";
                                $query_product_list = mysqli_query($mysqli, $sql_product_list);
                                while ($row_product = mysqli_fetch_array($query_product_list)) {
                                ?>
                                    <option value="<?php echo $row_product['product_id'] ?>"
                                        data-price="<?php echo $row_product['product_price_import'] ?>">
                                        <?php echo $row_product['product_name'] ?>
                                    </option>
                                <?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="input-item form-group">
                            <label for="quantity" class="d-block">Số lượng nhập <span class="text-danger">*</span></label>
                            <input class="d-block form-control"
                                id="quantity"
                                name="product_quantity"
                                type="number"
                                min="1"
                                value="1"
                                placeholder="Nhập vào số lượng"
                                required>
                        </div>
                        <div class="input-item form-group">
                            <label for="price" class="d-block">Giá nhập <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <input class="form-control"
                                    id="price"
                                    name="product_price_import"
                                    type="text"
                                    placeholder="Nhập vào giá sản phẩm"
                                    required>
                                <div class="input-group-append">
                                    <span class="input-group-text">₫</span>
                                </div>
                            </div>
                        </div>
                        <div class="w-100 d-flex justify-content-between align-items-center">
                            <button type="submit" name="addtoinventory" class="btn btn-primary btn-icon-text">
                                <i class="ti-plus btn-icon-prepend"></i>
                                Thêm vào phiếu
                            </button>
                            <button type="button" onclick="resetForm()" class="btn btn-light">
                                <i class="ti-reload"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Khởi tạo select2 cho dropdown sản phẩm
    $('.select_product').chosen({
        width: '100%',
        search_contains: true,
        no_results_text: 'Không tìm thấy sản phẩm'
    });

    // Format số tiền khi nhập
    $('#price').on('input', function() {
        // Xóa tất cả ký tự không phải số
        let value = this.value.replace(/[^\d]/g, '');
        // Format số với dấu chấm phân cách hàng nghìn
        this.value = new Intl.NumberFormat('vi-VN', {
            style: 'decimal',
            maximumFractionDigits: 0
        }).format(value);
    });

    // Tự động điền giá nhập khi chọn sản phẩm
    $('#productid').on('change', function() {
        let selectedOption = $(this).find('option:selected');
        let price = selectedOption.data('price');
        if (price) {
            $('#price').val(new Intl.NumberFormat('vi-VN', {
                style: 'decimal',
                maximumFractionDigits: 0
            }).format(price));
        }
    });

    // Reset form
    function resetForm() {
        document.getElementById('addProductForm').reset();
        $('.select_product').val('').trigger('chosen:updated');
    }

    // Validate form trước khi submit
    document.getElementById('addProductForm').onsubmit = function(e) {
        let quantity = parseInt(document.getElementById('quantity').value) || 0;
        let price = parseInt(document.getElementById('price').value.replace(/[^\d]/g, '')) || 0;
        let product = document.getElementById('productid').value;

        if (!product) {
            e.preventDefault();
            showErrorToast('Vui lòng chọn sản phẩm');
            return false;
        }

        if (quantity <= 0) {
            e.preventDefault();
            showErrorToast('Số lượng phải lớn hơn 0');
            return false;
        }

        if (price <= 0) {
            e.preventDefault();
            showErrorToast('Giá nhập phải lớn hơn 0');
            return false;
        }

        return true;
    };

    // Validate form nhập kho
    document.getElementById('inventoryForm').onsubmit = function(e) {
        let stafName = document.getElementById('stafName').value.trim();
        let supplierName = document.getElementById('supplierName').value.trim();
        let supplierPhone = document.getElementById('supplierPhone').value.trim();

        if (!stafName) {
            e.preventDefault();
            showErrorToast('Vui lòng nhập tên nhân viên');
            return false;
        }

        if (!supplierName) {
            e.preventDefault();
            showErrorToast('Vui lòng nhập tên nhà cung cấp');
            return false;
        }

        if (!supplierPhone) {
            e.preventDefault();
            showErrorToast('Vui lòng nhập số điện thoại nhà cung cấp');
            return false;
        }

        // Validate số điện thoại
        if (!/^[0-9]{10}$/.test(supplierPhone)) {
            e.preventDefault();
            showErrorToast('Số điện thoại không hợp lệ');
            return false;
        }

        // Kiểm tra có sản phẩm nào trong phiếu chưa
        let tableBody = document.querySelector('.table-action tbody');
        let rows = tableBody.getElementsByTagName('tr');
        if (rows.length === 0 || (rows.length === 1 && rows[0].cells.length === 1)) {
            e.preventDefault();
            showErrorToast('Vui lòng thêm ít nhất một sản phẩm');
            return false;
        }

        return true;
    };

    // Hàm hiển thị toast message
    function showToast(title, message, type = 'success') {
        toast({
            title: title,
            message: message,
            type: type,
            duration: 3000
        });
    }

    function showSuccessToast(message = 'Thêm sản phẩm vào phiếu nhập thành công') {
        showToast('Thành công', message);
    }

    function showErrorToast(message = 'Có lỗi xảy ra') {
        showToast('Lỗi', message, 'error');
    }
</script>

<?php
if (isset($_GET['message'])) {
    echo '<script>';

    if ($_GET['message'] == 'success') {
        echo 'showSuccessToast();';
    } else if ($_GET['message'] == 'error') {
        $error_type = isset($_GET['error']) ? $_GET['error'] : '';
        $error_message = '';
        switch ($error_type) {
            case 'quantity':
                $error_message = 'Số lượng không hợp lệ';
                break;
            case 'price':
                $error_message = 'Giá nhập không hợp lệ';
                break;
            case 'product':
                $error_message = 'Sản phẩm không tồn tại';
                break;
            case 'empty':
                $error_message = 'Vui lòng thêm ít nhất một sản phẩm';
                break;
            case 'missing':
                $error_message = 'Vui lòng điền đầy đủ thông tin';
                break;
            case 'phone':
                $error_message = 'Số điện thoại không hợp lệ';
                break;
            default:
                $error_message = 'Có lỗi xảy ra';
        }
        echo "showErrorToast('$error_message');";
    }

    echo "setTimeout(function() {
        window.history.pushState({}, '', 'index.php?action=inventory&query=inventory_add');
    }, 0);";

    echo '</script>';
}
?>