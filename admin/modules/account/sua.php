<?php
$sql_account_edit = "SELECT * FROM account LEFT JOIN customer ON account.account_id = customer.account_id WHERE account.account_id = '$_GET[account_id]' LIMIT 1";
$query_account_edit = mysqli_query($mysqli, $sql_account_edit);
?>
<div class="row" style="margin-bottom: 10px;">
    <div class="col d-flex" style="justify-content: space-between; align-items: flex-end;">
        <h3 class="card-title">
            Sửa đổi thông tin tài khoản
        </h3>
        <a href="index.php?action=account&query=account_list" class="btn btn-outline-dark btn-fw">
            <i class="mdi mdi-reply"></i>
            Quay lại
        </a>
    </div>
</div>
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <div class="card-content">
                    <form method="POST" action="modules/account/xuly.php?account_id=<?php echo $_GET['account_id'] ?>" id="editForm">
                        <?php
                        while ($item = mysqli_fetch_array($query_account_edit)) {
                        ?>
                            <div class="input-item form-group">
                                <label for="account_name" class="d-block">Tên tài khoản <span class="text-danger">*</span></label>
                                <input type="text" name="account_name" id="account_name" class="form-control" value="<?php echo $item['account_name'] ?>" required>
                            </div>
                            <div class="input-item form-group">
                                <label for="email" class="d-block">Email</label>
                                <input type="email" name="account_email" id="email" class="form-control" value="<?php echo $item['account_email'] ?>" readonly>
                            </div>
                            <div class="input-item form-group">
                                <label for="phone" class="d-block">Số điện thoại</label>
                                <input type="tel" name="account_phone" id="phone" class="form-control" value="<?php echo $item['account_phone'] ?>" pattern="[0-9]{10}" title="Số điện thoại phải có 10 chữ số">
                            </div>
                            <?php if (isset($item['customer_address'])) { ?>
                                <div class="input-item form-group">
                                    <label for="address" class="d-block">Địa chỉ</label>
                                    <textarea name="account_address" id="address" class="form-control"><?php echo $item['customer_address'] ?></textarea>
                                </div>
                            <?php } ?>
                            <div class="input-item form-group">
                                <label for="account_type" class="d-block">Quyền hạn <span class="text-danger">*</span></label>
                                <select name="account_type" id="account_type" class="form-control" required>
                                    <option value="0" <?php if ($item['account_type'] == 0) echo "selected"; ?>>Khách hàng</option>
                                    <option value="1" <?php if ($item['account_type'] == 1) echo "selected"; ?>>Nhân viên</option>
                                    <?php if ($_SESSION['account_type'] == 2) { ?>
                                        <option value="2" <?php if ($item['account_type'] == 2) echo "selected"; ?>>Quản trị viên</option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="input-item form-group">
                                <label for="account_status" class="d-block">Tình trạng <span class="text-danger">*</span></label>
                                <select name="account_status" id="account_status" class="form-control" required>
                                    <option value="0" <?php if ($item['account_status'] == 0) echo "selected"; ?>>Đang hoạt động</option>
                                    <option value="-1" <?php if ($item['account_status'] == -1) echo "selected"; ?>>Tạm khóa</option>
                                </select>
                            </div>
                            <button type="submit" name="account_change" class="btn btn-primary btn-icon-text">
                                <i class="ti-file btn-icon-prepend"></i>
                                Lưu thay đổi
                            </button>
                        <?php
                        }
                        ?>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('editForm').onsubmit = function(e) {
        var phone = document.getElementById('phone').value;
        if (phone && !phone.match(/^[0-9]{10}$/)) {
            alert('Số điện thoại phải có 10 chữ số');
            e.preventDefault();
            return false;
        }
        return true;
    }
</script>

<?php
if (isset($_GET['message']) && $_GET['message'] == 'success') {
    $message = $_GET['message'];
    echo '<script>';
    echo '   showErrorToast();';
    echo 'window.history.pushState(null, "", "index.php?action=account&query=my_account");';
    echo '</script>';
}
?>