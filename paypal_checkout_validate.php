<?php
session_start();
require_once './admin/config/config.php';
include_once './config-paypal.php';
require_once 'PaypalCheckout.class.php';
$paypal = new PaypalCheckout;

if (isset($_POST['paypal_order_check']) && isset($_POST['order_id'])) {
    try {
        $order = $paypal->validate($_POST['order_id']); // thành công trả về data , lỗi trả về false
        // paypal thanh toán thành công
        if (!empty($order["id"]) && $order['status'] == 'COMPLETED') {
            // lưu bảng order
            $order_code = rand(0, 9999);
            $order_date = date('Y-m-d H:i:s');
            $account_id = $_SESSION['account_id'];
            $delivery_id = $_POST["delivery_id"];
            $total_amount = $_SESSION["total_item"];
            $order_type = 6; // 6 - paypal
            $order_status_orders = 1; // ? 0 - đang xử lý (đơn hàng đã thanh toán tiền)
            $insert_order1 = "INSERT INTO orders (order_code, order_date, account_id, delivery_id, total_amount, order_type, order_status) VALUES (?, ?, ?, ?, ?, ?, ?)";

            $stmt_order = $mysqli->prepare($insert_order1);
            $stmt_order->bind_param("issiiii", $order_code, $order_date, $account_id, $delivery_id, $total_amount, $order_type, $order_status_orders);
            $query_orders = $stmt_order->execute();

            // lưu thông tin vận chuyển vào bảng delivery
            $delivery_name = $_POST["delivery_name"];
            $delivery_address = $_POST["delivery_address"];
            $delivery_phone = $_POST["delivery_phone"];
            $delivery_note = $_POST["delivery_note"];
            $insert_delivery = "INSERT INTO delivery (delivery_id, account_id, delivery_name, delivery_phone, delivery_address, delivery_note) VALUES (?, ?, ?, ?, ?, ?)";

            $stmt_delivery = $mysqli->prepare($insert_delivery);
            $stmt_delivery->bind_param("ississ", $delivery_id, $account_id, $delivery_name, $delivery_phone, $delivery_address, $delivery_note);
            $query_delivery = $stmt_delivery->execute();

            // ...
            //them orders_detail
            if ($query_orders) {
                foreach ($_SESSION['cart'] as $cart_item) {
                    $product_id = $cart_item['product_id'];
                    $query_get_product = mysqli_query($mysqli, "SELECT * FROM product WHERE product_id = $product_id");
                    $product = mysqli_fetch_array($query_get_product);
                    if ($product['product_quantity'] >= $cart_item['product_quantity']) {
                        $product_quantity = $cart_item['product_quantity'];
                        $quantity = $product['product_quantity'] - $product_quantity;
                        $quantity_sales = $product['quantity_sales'] + $product_quantity;
                        $product_price = $cart_item['product_price'];
                        $product_sale = $cart_item['product_sale'];
                        $insert_order_detail = "INSERT INTO order_detail(order_code, product_id, product_quantity, product_price, product_sale) VALUE ('" . $order_code . "', '" . $product_id . "', '" . $product_quantity . "', '" . $product_price . "', '" . $product_sale . "')";
                        mysqli_query($mysqli, $insert_order_detail);
                        mysqli_query($mysqli, "UPDATE product SET product_quantity = $quantity, quantity_sales = $quantity_sales WHERE product_id = $product_id");
                    }
                }
                $update_total_amount = "UPDATE orders SET total_amount = $total_amount WHERE order_code = $order_code";
                $query_total_amount = mysqli_query($mysqli, $update_total_amount);
                // lưu thành công, trả về JSON

                $response = array('status' => 1, 'msg' => 'Thanh toán thành công.');
                http_response_code(200);
                header('Content-Type: application/json');
                echo json_encode($response, JSON_PRETTY_PRINT);
                unset($_SESSION["cart"]);
                unset($_SESSION["total_item"]);
                exit;
            } else {
                throw new Exception('Đơn hàng thanh toán không thành công!');
            }
        }else{
            http_response_code(500); // Bad Request
            $response = array('status' => 0, 'msg' => 'Có lỗi xảy ra. Thanh toán không thành công');
            header('Content-Type: application/json');
            echo json_encode($response, JSON_PRETTY_PRINT);
        }
    } catch (Exception $e) {
        http_response_code(500);
        $response = array('status' => 0, 'msg' => $e->getMessage());
        header('Content-Type: application/json');
        echo json_encode($response, JSON_PRETTY_PRINT);
    }
} else {
    http_response_code(400); // Bad Request
    $response = array('status' => 0, 'msg' => 'Dữ liệu không hợp lệ.');
    header('Content-Type: application/json');
    echo json_encode($response, JSON_PRETTY_PRINT);
}
