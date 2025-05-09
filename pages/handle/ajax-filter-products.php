<?php
// Kết nối database và các file cần thiết
session_start();
include('../../admin/config/config.php');
include('../../admin/format/format.php');

// Xác định base URL
$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
$base_url = $protocol . $_SERVER['HTTP_HOST'] . '/h_shop';

// Khởi tạo mảng kết quả JSON
$result = [
    'products' => '',
    'pagination' => '',
    'tags' => ''
];

// Lấy tham số từ request
$page = isset($_GET['pagenumber']) ? intval($_GET['pagenumber']) : 1;
$price_from = isset($_GET['pricefrom']) ? floatval($_GET['pricefrom']) : 0;
$price_to = isset($_GET['priceto']) ? floatval($_GET['priceto']) : 50000000;

// Tính toán offset cho phân trang
if ($page <= 1) {
    $begin = 0;
} else {
    $begin = ($page * 9) - 9;
}

// Xử lý tham số sắp xếp
$sortby = '';
$url_sort = '';

if (isset($_GET['pricesort']) && $_GET['pricesort'] == 'asc') {
    $url_sort = "&pricesort=asc";
    $sortby = "ORDER BY product_price ASC";
} elseif (isset($_GET['pricesort']) && $_GET['pricesort'] == 'desc') {
    $url_sort = "&pricesort=desc";
    $sortby = "ORDER BY product_price DESC";
}

// Xây dựng các URL tham số cho phân trang và tags
$url_category = '';
$url_brand = '';
$url_price = '';

if (isset($_GET['pricefrom']) && isset($_GET['priceto'])) {
    $url_price = "&pricefrom=" . $price_from . "&priceto=" . $price_to;
}

// Xây dựng điều kiện WHERE cho SQL
$where_conditions = "product_status = 1 AND product_quantity > 0";

// Thêm điều kiện giá nếu có
if (isset($_GET['pricefrom']) && isset($_GET['priceto'])) {
    $where_conditions .= " AND product_price > $price_from AND product_price < $price_to";
}

// Xử lý URL tham số và bảo mật dữ liệu đầu vào
if (isset($_GET['category_id'])) {
    $category_id = intval($_GET['category_id']);
    $url_category = '&category_id=' . $category_id;
    $where_conditions .= " AND product.product_category = '" . $category_id . "'";
}

// Thêm điều kiện thương hiệu nếu có
if (isset($_GET['brand_id'])) {
    $brand_id = intval($_GET['brand_id']);
    $url_brand = '&brand_id=' . $brand_id;
    $where_conditions .= " AND product.product_brand = '" . $brand_id . "'";
}

// Thực hiện truy vấn với JOIN phù hợp
$joins = "";
if (isset($_GET['category_id'])) {
    $joins .= " JOIN category ON product.product_category = category.category_id";
}
if (isset($_GET['brand_id'])) {
    $joins .= " JOIN brand ON product.product_brand = brand.brand_id";
}

// Truy vấn lấy sản phẩm
$sql_product_list = "SELECT * FROM product $joins WHERE $where_conditions $sortby LIMIT $begin,9";
$query_product_list = mysqli_query($mysqli, $sql_product_list);

// Xây dựng HTML cho danh sách sản phẩm
ob_start();

while ($row = mysqli_fetch_array($query_product_list)) {
?>
    <div class="col" style="--w: 9; --w-md: 4">
        <div class="product__card d-flex flex-column">
            <div class="product__image p-relative">
                <a href="<?php echo $base_url; ?>/index.php?page=product_detail&product_id=<?php echo $row['product_id'] ?>">
                    <img class="w-100 h-100 object-fit-cover" src="<?php echo $base_url; ?>/admin/modules/product/uploads/<?php echo $row['product_image'] ?>" alt="product image" />
                </a>
                <?php
                if ($row['product_sale'] > 0) {
                ?>
                    <span class="product__sale h6 p-absolute"> - <?php echo $row['product_sale'] ?>%</span>
                <?php
                }
                ?>
            </div>
            <div class="product__info">
                <a href="<?php echo $base_url; ?>/index.php?page=product_detail&product_id=<?php echo $row['product_id'] ?>">
                    <h3 class="product__name h5"><?php echo $row['product_name'] ?></h3>
                </a>
                <span class="review-star-list d-flex">
                    <?php
                    $query_evaluate_rating = mysqli_query($mysqli, "SELECT * FROM evaluate WHERE product_id='" . $row['product_id'] . "' AND evaluate_status = 1");

                    $rate1 = 0;
                    $rate2 = 0;
                    $rate3 = 0;
                    $rate4 = 0;
                    $rate5 = 0;

                    while ($evaluate_rating = mysqli_fetch_array($query_evaluate_rating)) {
                        $rate = $evaluate_rating['evaluate_rate'];

                        if ($rate == 1) {
                            $rate1++;
                        } elseif ($rate == 2) {
                            $rate2++;
                        } elseif ($rate == 3) {
                            $rate3++;
                        } elseif ($rate == 4) {
                            $rate4++;
                        } elseif ($rate == 5) {
                            $rate5++;
                        }
                    }

                    $total_rate = $rate1 + $rate2 + $rate3 + $rate4 + $rate5;
                    if ($total_rate != 0) {
                        $rate_avg =  ($rate1 * 1 + $rate2 * 2 + $rate3 * 3 + $rate4 * 4 + $rate5 * 5) / $total_rate;
                        $rate_avg = round($rate_avg, 1);
                    } else {
                        $rate_avg = 0;
                    }

                    for ($i = 0; $i < 5; $i++) {
                        if ($i < $rate_avg) {
                    ?>
                            <div class="rating-star"></div>
                        <?php
                        } else {
                        ?>
                            <div class="rating-star rating-off"></div>
                    <?php
                        }
                    }
                    ?>
                    <span>(<?php echo $total_rate ?>)</span>
                </span>
                <a href="<?php echo $base_url; ?>/index.php?page=product_detail&product_id=<?php echo $row['product_id'] ?>">
                    <div class="product__price align-center">
                        <?php
                        if ($row['product_sale'] > 0) {
                        ?>
                            <del class="product__price--old h5"><?php echo number_format($row['product_price']) . ' ₫' ?></del>

                        <?php
                        }
                        ?>
                        <span class="product__price--new h4"><?php echo (number_format($row['product_price'] - ($row['product_price'] / 100 * $row['product_sale']))) . ' vnđ' ?></span>
                    </div>
                </a>
            </div>
        </div>
    </div>
<?php
}

$result['products'] = ob_get_clean();

// Xây dựng HTML cho phân trang
ob_start();

// Xây dựng điều kiện và JOIN cho đếm tổng số sản phẩm
$count_where = str_replace(
    ["product_status = 1 AND product_quantity > 0", " product.product_category", " product.product_brand"],
    ["product_status = 1", " product_category", " product_brand"],
    $where_conditions
);
$count_joins = $joins;

$sql_product_count = "SELECT COUNT(*) as total FROM product $count_joins WHERE $count_where";
$query_product_count = mysqli_query($mysqli, $sql_product_count);
$row_count_data = mysqli_fetch_assoc($query_product_count);
$row_count = $row_count_data['total'];

$totalpage = ceil($row_count / 9);
$currentLink = $base_url . "/index.php?page=products" . $url_category . $url_brand . $url_price . $url_sort;

if ($row_count > 9) {
?>
    <ul class="pagination__items d-flex align-center justify-center">
        <?php if ($page != 1) { ?>
            <li class="pagination__item">
                <a class="d-flex align-center pagi-link" href="<?php echo $currentLink ?>&pagenumber=<?php echo $page - 1 ?>">
                    <img src="<?php echo $base_url; ?>/assets/images/icon/arrow-left.svg" alt="">
                </a>
            </li>
        <?php } ?>

        <?php for ($i = 1; $i <= $totalpage; $i++) { ?>
            <li class="pagination__item">
                <a class="pagination__anchor pagi-link <?php echo ($page == $i) ? "active" : "" ?>" href="<?php echo $currentLink ?>&pagenumber=<?php echo $i ?>"><?php echo $i ?></a>
            </li>
        <?php } ?>

        <?php if ($page != $totalpage) { ?>
            <li class="pagination__item">
                <a class="d-flex align-center pagi-link" href="<?php echo $currentLink ?>&pagenumber=<?php echo $page + 1 ?>">
                    <img src="<?php echo $base_url; ?>/assets/images/icon/icon-nextlink.svg" alt="">
                </a>
            </li>
        <?php } ?>
    </ul>
<?php
}

$result['pagination'] = ob_get_clean();

// Xây dựng HTML cho các tag lọc
ob_start();

if ($url_price != '') {
?>
    <a class="tag__item" href="<?php echo $base_url; ?>/index.php?page=products<?php echo $url_category . $url_brand . $url_sort; ?>">
        <div class="d-flex align-center">
            <div class="btn__tag d-flex align-center"><img class="icon-close" src="<?php echo $base_url; ?>/assets/images/icon/icon-close.png" alt=""></div>
            <div class="tag__content d-flex align-center">
                <span class="tag__name h5">Giá <?php echo number_format($price_from) ?>đ - <?php echo number_format($price_to) ?>đ</span>
            </div>
        </div>
    </a>
<?php
}

if ($url_category != '') {
    // Lấy tên danh mục
    $sql_category_name = "SELECT category_name FROM category WHERE category_id = $category_id";
    $query_category_name = mysqli_query($mysqli, $sql_category_name);
    $category_data = mysqli_fetch_array($query_category_name);
    $category_name = isset($category_data['category_name']) ? $category_data['category_name'] : 'Danh mục';
?>
    <a class="tag__item" href="<?php echo $base_url; ?>/index.php?page=products<?php echo $url_brand . $url_price . $url_sort; ?>">
        <div class="d-flex align-center">
            <div class="btn__tag d-flex align-center"><img class="icon-close" src="<?php echo $base_url; ?>/assets/images/icon/icon-close.png" alt=""></div>
            <div class="tag__content d-flex align-center">
                <span class="tag__name h5">Danh mục: <?php echo $category_name; ?></span>
            </div>
        </div>
    </a>
<?php
}

if ($url_brand != '') {
    // Lấy tên thương hiệu
    $sql_brand_name = "SELECT brand_name FROM brand WHERE brand_id = $brand_id";
    $query_brand_name = mysqli_query($mysqli, $sql_brand_name);
    $brand_data = mysqli_fetch_array($query_brand_name);
    $brand_name = isset($brand_data['brand_name']) ? $brand_data['brand_name'] : 'Thương hiệu';
?>
    <a class="tag__item" href="<?php echo $base_url; ?>/index.php?page=products<?php echo $url_category . $url_price . $url_sort; ?>">
        <div class="d-flex align-center">
            <div class="btn__tag d-flex align-center"><img class="icon-close" src="<?php echo $base_url; ?>/assets/images/icon/icon-close.png" alt=""></div>
            <div class="tag__content d-flex align-center">
                <span class="tag__name h5">Thương hiệu: <?php echo $brand_name; ?></span>
            </div>
        </div>
    </a>
<?php
}

$result['tags'] = ob_get_clean();

// Trả về kết quả dưới dạng JSON
header('Content-Type: application/json');
echo json_encode($result);
exit();
