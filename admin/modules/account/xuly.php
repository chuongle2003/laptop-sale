<?php
session_start();
include('../../config/config.php');
// if (isset($_GET['data'])) {
//     $data = $_GET['data'];
//     $account_ids = json_decode($data);
// }

// Xử lý xóa tài khoản
if (isset($_GET['action']) && $_GET['action'] == 'delete' && isset($_GET['data'])) {
    if ($_SESSION['account_type'] == 2) { // Chỉ admin mới có quyền xóa
        $data = $_GET['data'];
        $account_ids = json_decode($data);

        foreach ($account_ids as $account_id) {
            // Kiểm tra không cho phép xóa tài khoản đang đăng nhập
            if ($account_id != $_SESSION['account_id_admin']) {
                // Xóa các bản ghi liên quan trong bảng customer
                $sql_delete_customer = "DELETE FROM customer WHERE account_id = '$account_id'";
                mysqli_query($mysqli, $sql_delete_customer);

                // Xóa tài khoản
                $sql_delete_account = "DELETE FROM account WHERE account_id = '$account_id'";
                mysqli_query($mysqli, $sql_delete_account);
            }
        }
        header('Location:../../index.php?action=account&query=account_list&message=delete_success');
    } else {
        header('Location:../../index.php?action=account&query=account_list&message=error');
    }
}

$account_id = isset($_GET['account_id']) ? $_GET['account_id'] : '';
if (isset($_POST['account_edit'])) {
    $account_name = $_POST['account_name'];
    $account_phone = $_POST['account_phone'];
    $account_address = $_POST['account_address'];
    $customer_gender = $_POST['customer_gender'];

    $sql_update_account = "UPDATE account SET account_name = '$account_name', account_phone = '$account_phone' WHERE account_id = $account_id";
    $query_update_account = mysqli_query($mysqli, $sql_update_account);

    $sql_update_customer = "UPDATE customer SET customer_name = '$account_name', customer_phone = '$account_phone', customer_gender = '$customer_gender', customer_address = '$account_address' WHERE account_id = $account_id";
    $query_update_customer = mysqli_query($mysqli, $sql_update_customer);

    header('Location:../../index.php?action=account&query=my_account&message=success');
}

if (isset($_POST['account_change'])) {
    if ($_SESSION['account_type'] == 2 && $_SESSION['account_id_admin'] != $account_id) {
        $account_type = $_POST['account_type'];
        $account_status = $_POST['account_status'];
        $sql_update_account = "UPDATE account SET account_type = $account_type, account_status = $account_status WHERE account_id = $account_id";
        $query_update_account = mysqli_query($mysqli, $sql_update_account);

        header('Location:../../index.php?action=account&query=account_list&message=success');
    } else {
        header('Location:../../index.php?action=account&query=account_list&message=error');
    }
}

// Xử lý sửa tài khoản
if (isset($_POST['account_change'])) {
    $account_id = $_GET['account_id'];

    // Kiểm tra quyền: chỉ admin mới có thể sửa tài khoản khác
    if ($_SESSION['account_type'] == 2 && $_SESSION['account_id_admin'] != $account_id) {
        // Validation dữ liệu
        $account_name = mysqli_real_escape_string($mysqli, $_POST['account_name']);
        $account_phone = mysqli_real_escape_string($mysqli, $_POST['account_phone']);
        $account_type = (int)$_POST['account_type'];
        $account_status = (int)$_POST['account_status'];

        // Validate phone number
        if ($account_phone && !preg_match("/^[0-9]{10}$/", $account_phone)) {
            header('Location:../../index.php?action=account&query=account_list&message=error');
            exit();
        }

        // Validate account type
        if ($account_type < 0 || $account_type > 2) {
            header('Location:../../index.php?action=account&query=account_list&message=error');
            exit();
        }

        // Cập nhật thông tin tài khoản
        $sql_update = "UPDATE account SET 
            account_name = '$account_name',
            account_phone = '$account_phone',
            account_type = $account_type,
            account_status = $account_status
            WHERE account_id = $account_id";

        if (mysqli_query($mysqli, $sql_update)) {
            // Nếu là khách hàng, cập nhật thêm thông tin trong bảng customer
            if (isset($_POST['account_address'])) {
                $account_address = mysqli_real_escape_string($mysqli, $_POST['account_address']);
                $sql_update_customer = "UPDATE customer SET 
                    customer_name = '$account_name',
                    customer_phone = '$account_phone',
                    customer_address = '$account_address'
                    WHERE account_id = $account_id";
                mysqli_query($mysqli, $sql_update_customer);
            }
            header('Location:../../index.php?action=account&query=account_list&message=success');
        } else {
            header('Location:../../index.php?action=account&query=account_list&message=error');
        }
    } else {
        header('Location:../../index.php?action=account&query=account_list&message=error');
    }
}

// Xử lý sửa thông tin cá nhân
if (isset($_POST['account_edit'])) {
    $account_id = $_GET['account_id'];

    // Validation dữ liệu
    $account_name = mysqli_real_escape_string($mysqli, $_POST['account_name']);
    $account_phone = mysqli_real_escape_string($mysqli, $_POST['account_phone']);
    $account_address = mysqli_real_escape_string($mysqli, $_POST['account_address']);
    $customer_gender = (int)$_POST['customer_gender'];

    // Validate phone number
    if ($account_phone && !preg_match("/^[0-9]{10}$/", $account_phone)) {
        header('Location:../../index.php?action=account&query=my_account&message=error');
        exit();
    }

    // Cập nhật thông tin tài khoản
    $sql_update_account = "UPDATE account SET 
        account_name = '$account_name',
        account_phone = '$account_phone'
        WHERE account_id = $account_id";

    if (mysqli_query($mysqli, $sql_update_account)) {
        // Cập nhật thông tin khách hàng
        $sql_update_customer = "UPDATE customer SET 
            customer_name = '$account_name',
            customer_phone = '$account_phone',
            customer_gender = $customer_gender,
            customer_address = '$account_address'
            WHERE account_id = $account_id";
        mysqli_query($mysqli, $sql_update_customer);

        header('Location:../../index.php?action=account&query=my_account&message=success');
    } else {
        header('Location:../../index.php?action=account&query=my_account&message=error');
    }
}
