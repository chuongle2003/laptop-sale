<?php
$inventory_code = $_GET['inventory_code'];
$sql_inventory_info = "SELECT * FROM inventory WHERE inventory_code = $inventory_code LIMIT 1";
$query_inventory_info = mysqli_query($mysqli, $sql_inventory_info);

$sql_inventory_detail = "SELECT * FROM product pd join inventory_detail iv ON pd.product_id = iv.product_id WHERE iv.inventory_code = $inventory_code";
$query_inventory_detail = mysqli_query($mysqli, $sql_inventory_detail);
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
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <div class="card-content">
                    <div class="receipt">
                        <?php
                        while ($inventory = mysqli_fetch_array($query_inventory_info)) {
                            $total_amount = $inventory['total_amount'];
                        ?>
                            <div class="receipt__header text-center">
                                <h3 class="receipt__title">Phiếu Nhập Kho</h3>
                                <p>Mã phiếu : <?php echo $inventory['inventory_code'] ?></p>
                                <p class="receipt__date">Ngày nhập: <?php echo $inventory['inventory_date'] ?></p>
                            </div>
                            <div class="receipt__info">
                                <table>
                                    <tr>
                                        <td>
                                            <p class="receipt__info--name">Người nhập kho: <input class="receipt__info--input" name="staf_name" value="<?php echo $inventory['staf_name'] ?>" type="text" placeholder="tên người nhập" required></p>
                                        </td>
                                        <td>
                                            <p class="receipt__info--company">Tên đơn vị cung cấp: <input class="receipt__info--input" name="supplier_name" value="<?php echo $inventory['supplier_name'] ?>" type="text" placeholder="tên đơn vị cung cấp" required></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="receipt__info--note">Ghi chú: <input class="receipt__info--input" name="inventory_note" value="<?php echo $inventory['inventory_note'] ?>" type="text" placeholder="Lý do nhập kho" required></p>
                                        </td>
                                        <td>
                                            <p class="receipt__info--company">Số điện thoại: <input class="receipt__info--input" name="inventory_phone" value="<?php echo $inventory['supplier_phone'] ?>" type="text"></p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        <?php
                        }
                        ?>
                        <div class="table-responsive receipt__table" style="margin-top: 20px;">
                            <table class="table table-hover table-action">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tên sản phẩm</th>
                                        <th class="text-center">Số lượng</th>
                                        <th class="text-right">Đơn giá</th>
                                        <th class="text-right">Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 0;
                                    $total_amount = 0;
                                    while ($row = mysqli_fetch_array($query_inventory_detail)) {
                                        $i++;
                                        $subtotal = $row['product_quantity'] * $row['product_price_import'];
                                        $total_amount += $subtotal;
                                    ?>
                                        <tr>
                                            <td><?php echo $i ?></td>
                                            <td><?php echo $row['product_name'] ?></td>
                                            <td class="text-center"><?php echo number_format($row['product_quantity']) ?></td>
                                            <td class="text-right"><?php echo number_format($row['product_price_import']) ?>₫</td>
                                            <td class="text-right"><?php echo number_format($subtotal) ?>₫</td>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                    <tr>
                                        <td colspan="4" class="text-right"><strong>Tổng tiền:</strong></td>
                                        <td class="text-right"><strong><?php echo number_format($total_amount) ?>₫</strong></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row mt-4">
    <div class="col-12 text-right">
        <a href="modules/inventory/inphieunk.php?inventory_code=<?php echo $inventory_code ?>" target="_blank" class="btn btn-primary">
            <i class="mdi mdi-printer"></i> In phiếu nhập
        </a>
    </div>
</div>

<script>
    function showSuccessToast() {
        toast({
            title: "Success",
            message: "Cập nhật thành công",
            type: "success",
            duration: 0,
        });
    }
</script>

<?php
if (isset($_GET['message']) && $_GET['message'] == 'success') {
    echo '<script>';
    echo 'showSuccessToast();';
    echo '</script>';
}
?>