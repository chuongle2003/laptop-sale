-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 23, 2025 at 04:46 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `h_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` int NOT NULL,
  `account_status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `account_name`, `account_password`, `account_email`, `account_phone`, `account_type`, `account_status`) VALUES
(1, 'Admin', 'a66abb5684c45962d887564f08346e8d', 'admin@gmail.com', '0987654321', 2, 0),
(23, 'Nguyễn Văn A', 'a66abb5684c45962d887564f08346e8d', 'nguyenvana@gmail.com', '', 0, 0),
(24, 'Nguyễn Văn A', '25d55ad283aa400af464c76d713c07ad', 'nguyenthanhtrung@gmail.com', '', 0, 0),
(25, 'Nguyễn Văn A', '25d55ad283aa400af464c76d713c07ad', 'nguyenvanchung@gmail.com', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int NOT NULL,
  `article_author` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_date` date NOT NULL,
  `article_status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `article_author`, `article_title`, `article_summary`, `article_content`, `article_image`, `article_date`, `article_status`) VALUES
(1, 'Admin', 'SUS giới thiệu Gaming Vivobook (K3605) – Laptop gaming mỏng nhẹ, bền bỉ cho học sinh - sinh viên', '<p><strong>Ng&agrave;y 2/8, ASUS vừa ra mắt loạt&nbsp;<a href=\"https://cellphones.com.vn/laptop/gaming.html\" target=\"_blank\">laptop Gaming</a>&nbsp;<a href=\"https://cellphones.com.vn/laptop/asus/vivobook.html\" target=\"_blank\">Vivobook</a>&nbsp;(K3605) tại thị trường Việt Nam. D&ograve;ng sản phẩm n&agrave;y bao gồm những mẫu&nbsp;<a href=\"https://cellphones.com.vn/laptop.html\" target=\"_blank\">laptop</a>&nbsp;gaming mỏng nhẹ nhưng mạnh mẽ d&agrave;nh cho học sinh - sinh vi&ecirc;n, sản phẩm được trang bị l&ecirc;n đến GPU NVIDIA GeForce RTX&nbsp;4050, MUX Switch, đi k&egrave;m với bộ xử l&yacute; Intel Core i5-12500H thế hệ thứ 12 v&agrave; RAM 16GB.&nbsp;<a href=\"https://cellphones.com.vn/laptop/asus/gaming.html\" target=\"_blank\">ASUS Gaming</a>&nbsp;Vivobook (K3605) mang lại hiệu năng vượt trội với mức gi&aacute; hấp dẫn.</strong></p>\r\n', '<p>ASUS Gaming Vivobook sở hữu&nbsp;<a href=\"https://cellphones.com.vn/man-hinh.html\" target=\"_blank\">m&agrave;n h&igrave;nh</a>&nbsp;16 inch Full-HD+ tỷ lệ 16:10, tần số qu&eacute;t 144Hz. Hệ thống &acirc;m thanh được hiệu chỉnh bởi Dirac đảm bảo giải tr&iacute; sống động. Pin dung lượng lớn đến 70Wh v&agrave; hỗ trợ sạc nhanh gi&uacute;p người d&ugrave;ng tận dụng tối đa t&iacute;nh di động của sản phẩm. Chưa hết, đ&acirc;y l&agrave; laptop gaming bền bỉ nhất khi vượt qua 26 b&agrave;i kiểm tra theo ti&ecirc;u chuẩn MIL-STD-810H của qu&acirc;n đội Mỹ. ASUS Gaming Vivobook c&ograve;n được phủ lớp kh&aacute;ng khuẩn ASUS Antimicrobial Guard gi&uacute;p giảm thiểu sự l&acirc;y lan của vi khuẩn c&oacute; hại qua tiếp x&uacute;c. Tất cả trang bị tuyệt vời n&agrave;y đều được g&oacute;i gọn trong th&acirc;n h&igrave;nh laptop 16-inch với trọng lượng chỉ 1.8 kg v&agrave; mỏng 18.9 mm.</p>\r\n\r\n<p><img alt=\"ASUS giới thiệu Gaming Vivobook (K3605) tại Việt Nam\" src=\"https://cdn-media.sforum.vn/storage/app/media/trannghia/ASUS-Gaming-Vivobook-1.jpg\" style=\"height:675px; width:1200px\" /></p>\r\n\r\n<p>ASUS giới thiệu Gaming Vivobook (K3605) tại Việt Nam</p>\r\n\r\n<p>Mục lụcẨn</p>\r\n\r\n<p><a href=\"https://cellphones.com.vn/sforum/asus-gioi-thieu-gaming-vivobook-k3605#laptop-gaming-16-inch-mong-nhe-ben-bi-vuot-troi\">1.&nbsp;Laptop gaming 16-inch mỏng nhẹ, bền bỉ vượt trội</a><a href=\"https://cellphones.com.vn/sforum/asus-gioi-thieu-gaming-vivobook-k3605#laptop-gaming-manh-me-cho-hoc-sinh-sinh-vien\">2.&nbsp;Laptop gaming mạnh mẽ cho học sinh, sinh vi&ecirc;n</a><a href=\"https://cellphones.com.vn/sforum/asus-gioi-thieu-gaming-vivobook-k3605#man-hinh-rong-hon-trai-nghiem-hinh-anh-tot-hon\">3.&nbsp;M&agrave;n h&igrave;nh rộng hơn, trải nghiệm h&igrave;nh ảnh tốt hơn</a><a href=\"https://cellphones.com.vn/sforum/asus-gioi-thieu-gaming-vivobook-k3605#tien-loi-cho-su-dung-hang-ngay\">4.&nbsp;Tiện lợi cho sử dụng hằng ng&agrave;y</a><a href=\"https://cellphones.com.vn/sforum/asus-gioi-thieu-gaming-vivobook-k3605#gia-ban-va-ngay-len-ke\">5.&nbsp;Gi&aacute; b&aacute;n v&agrave; ng&agrave;y l&ecirc;n kệ</a></p>\r\n\r\n<h2><strong>Laptop gaming 16-inch mỏng nhẹ, bền bỉ vượt trội</strong></h2>\r\n\r\n<p>ASUS Gaming Vivobook (K3605) l&agrave; laptop gaming bền bỉ nhất từng được ASUS chế tạo khi vượt qua 26 b&agrave;i kiểm tra nghiệm ngặt thuộc 12 hạng mục trong ti&ecirc;u chuẩn độ bền qu&acirc;n đội Mỹ MIL-STD 810H. Ngo&agrave;i độ bền vật l&yacute;, m&aacute;y c&ograve;n th&acirc;n thiện với sức khỏe người d&ugrave;ng với lớp phủ kh&aacute;ng khuẩn ASUS Antimicrobial Guard tr&ecirc;n mặt C. Trang bị n&agrave;y gi&uacute;p ức chế sự ph&aacute;t triển của vi khuẩn tr&ecirc;n 99% trong 24 giờ, gi&uacute;p giữ cho bề mặt laptop sạch sẽ v&agrave; vệ sinh, bảo vệ sức khoẻ người d&ugrave;ng.</p>\r\n\r\n<p><img alt=\"Mẫu laptop gaming mới của ASUS có thiết kế mỏng nhẹ ấn tượng\" src=\"https://cdn-media.sforum.vn/storage/app/media/trannghia/SUS-Gaming-Vivobook-3.jpg\" style=\"height:675px; width:1200px\" /></p>\r\n\r\n<p>Mẫu laptop gaming mới của ASUS c&oacute; thiết kế mỏng nhẹ ấn tượng</p>\r\n\r\n<p>B&ecirc;n cạnh yếu tố bền bỉ h&agrave;ng đầu, ASUS Gaming Vivobook c&agrave;ng th&ecirc;m ấn tượng với trọng lượng chỉ 1.8 kg v&agrave; mỏng 18.9 mm. Cả hai con số tr&ecirc;n đều hấp dẫn khi so s&aacute;nh với c&aacute;c laptop gaming 16 inch kh&aacute;c tr&ecirc;n thị trường. T&iacute;nh di động v&agrave; bền bỉ được đảm bảo gi&uacute;p m&aacute;y lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh c&ugrave;ng c&aacute;c bạn học sinh - sinh vi&ecirc;n tr&ecirc;n mọi nẻo đường.</p>\r\n\r\n<p>Vẻ ngo&agrave;i trẻ trung của ASUS Gaming Vivobook với thiết kế logo c&ugrave;ng ph&iacute;m Enter được c&aacute;ch điệu, mang lại một diện mạo độc đ&aacute;o. Gam m&agrave;u Indie Black mạnh mẽ lu&ocirc;n đem đến vẻ tươi mới v&agrave; phong c&aacute;ch theo thời gian.</p>\r\n\r\n<h2><strong>Laptop gaming mạnh mẽ cho học sinh, sinh vi&ecirc;n</strong></h2>\r\n\r\n<p>Với nhiều trang bị phần cứng nổi bật, ASUS Gaming Vivobook (K3605) mang lại hiệu năng mạnh mẽ cho đa dạng t&aacute;c vụ học tập v&agrave; giải tr&iacute;. Sản phẩm được trang bị GPU l&ecirc;n đến NVIDIA GeForce RTX 4050 &mdash; cung cấp c&aacute;c t&iacute;nh năng ti&ecirc;n tiến như Ray Tracing, bộ tăng tốc xử l&yacute; AI v&agrave; bộ nhớ GDDR6 tốc độ cao, l&yacute; tưởng cho game hiện đại. C&ocirc;ng suất thiết kế nhiệt tối đa (TGP) l&ecirc;n đến 55W, ph&aacute;t huy tốt hơn sức mạnh của GPU NVIDIA khi chơi game, học tập v&agrave; t&aacute;c vụ s&aacute;ng tạo nội dung. Ngo&agrave;i ra, m&aacute;y c&ograve;n trang bị MUX Switch cho ph&eacute;p người d&ugrave;ng lựa chọn giữa hiệu suất đồ họa tối đa hoặc tối ưu thời gian sử dụng pin một c&aacute;ch dễ d&agrave;ng.</p>\r\n\r\n<p><img alt=\"Gaming Vivobook (K3605) có hiệu năng siêu mạnh\" src=\"https://cdn-media.sforum.vn/storage/app/media/trannghia/SUS-Gaming-Vivobook-2.jpg\" style=\"height:800px; width:1200px\" /></p>\r\n\r\n<p>Gaming Vivobook (K3605) c&oacute; hiệu năng si&ecirc;u mạnh</p>\r\n\r\n<p>Gi&uacute;p cho laptop lu&ocirc;n m&aacute;t mẻ, m&aacute;y được t&iacute;ch hợp&nbsp;<a href=\"https://cellphones.com.vn/sforum\" target=\"_blank\">c&ocirc;ng nghệ</a>&nbsp;tản nhiệt ASUS IceCool hiệu quả với 3 ống đồng dẫn nhiệt, 2 lỗ tho&aacute;t gi&oacute; v&agrave; quạt IceBlade 87 c&aacute;nh gi&uacute;p đảm bảo hiệu quả tản nhiệt, duy tr&igrave; hiệu năng ổn định.</p>\r\n\r\n<h2><strong>M&agrave;n h&igrave;nh rộng hơn, trải nghiệm h&igrave;nh ảnh tốt hơn</strong></h2>\r\n\r\n<p><a href=\"https://cellphones.com.vn/laptop/asus.html\" target=\"_blank\">Laptop ASUS</a>&nbsp;Gaming Vivobook (K3605) mới cung cấp trải nghiệm h&igrave;nh ảnh sống động với m&agrave;n h&igrave;nh 16 inch Full-HD+ tỷ lệ 16:10, tần số qu&eacute;t 144 Hz cho ph&eacute;p t&aacute;i hiện mọi chuyển động mượt m&agrave; trong game. M&agrave;n h&igrave;nh n&agrave;y được chứng nhận T&Uuml;V Rheinland về giảm ph&aacute;t thải &aacute;nh s&aacute;ng xanh v&agrave; kh&ocirc;ng nhấp nh&aacute;y để đ&ocirc;i mắt thoải m&aacute;i khi sử dụng thời gian d&agrave;i.</p>\r\n\r\n<p><img alt=\"Laptop này có màn hình lớn cho trải nghiệm xem ấn tượng\" src=\"https://cdn-media.sforum.vn/storage/app/media/trannghia/SUS-Gaming-Vivobook-4.jpg\" style=\"height:777px; width:1200px\" /></p>\r\n\r\n<p>Laptop n&agrave;y c&oacute; m&agrave;n h&igrave;nh lớn cho trải nghiệm xem ấn tượng</p>\r\n\r\n<p>Để mang đến trải nghiệm giải tr&iacute; sống động, laptop gaming 16-inch mới của ASUS trang bị hệ thống &acirc;m thanh ASUS SonicMaster mạnh mẽ, được c&acirc;n chỉnh bởi c&aacute;c chuy&ecirc;n gia &acirc;m thanh từ Dirac, mang đến những thanh &acirc;m nhiều chi tiết, r&otilde; r&agrave;ng v&agrave; đạt được sư c&acirc;n bằng giữa c&aacute;c dải &acirc;m. Ngo&agrave;i ra, c&ocirc;ng nghệ ASUS Audio Booster sử dụng thuật to&aacute;n &acirc;m thanh độc đ&aacute;o để tăng &acirc;m lượng l&ecirc;n đến 1.5 lần, gi&uacute;p lấp đầy kh&ocirc;ng gian lớn hơn khi giải tr&iacute;.</p>\r\n\r\n<h2><strong>Tiện lợi cho sử dụng hằng ng&agrave;y</strong></h2>\r\n\r\n<p>ASUS Gaming Vivobook (K3605) đi ki&egrave;m vi&ecirc;n pin dung lượng lớn l&ecirc;n đến 70 Wh, c&ocirc;ng nghệ sạc nhanh 50% pin trong 30 ph&uacute;t. Sản phẩm hỗ trợ kh&ocirc;ng chỉ sạc Power Delivery 100W qua cổng USB-C m&agrave; c&ograve;n c&oacute; th&ecirc;m c&ocirc;ng nghệ USB-C Easy Charge cho ph&eacute;p sạc pin với mức hiệu điện thế từ 5V thường thấy tr&ecirc;n pin dự ph&ograve;ng hoặc cổng sạc tr&ecirc;n &ocirc; t&ocirc;, gi&uacute;p c&aacute;c bạn học sinh, sinh vi&ecirc;n c&oacute; thể dễ d&agrave;ng sạc cho laptop của m&igrave;nh ở bất kỳ đ&acirc;u.</p>\r\n\r\n<p><img alt=\"Laptop gaming mới của ASUS có cổng kết nối đa dạng\" src=\"https://cdn-media.sforum.vn/storage/app/media/trannghia/SUS-Gaming-Vivobook-5.jpg\" style=\"height:675px; width:1200px\" /></p>\r\n\r\n<p>Laptop gaming mới của ASUS c&oacute; cổng kết nối đa dạng</p>\r\n\r\n<p>Sản phẩm đảm bảo khả năng kết nối dễ d&agrave;ng với c&aacute;c thiết bị ngoại vi th&ocirc;ng qua số lượng cổng đa dạng, bao gồm cổng USB-C/Thunderbolt 4 với hỗ trợ truyền dữ liệu 40Gbps, Power Deliver v&agrave; DisplayPort, hai cổng USB 3.2 Gen 1 Type-A, một cổng HDMI 2.1 v&agrave; đầu đọc thẻ SD ti&ecirc;u chuẩn. Kết nối kh&ocirc;ng d&acirc;y chuẩn WiFi 6E tốc độ cao, được tăng cường với c&ocirc;ng nghệ ASUS WiFi Master, mang đến kết nối internet nhanh v&agrave; ổn định.</p>\r\n', '1722747312_SUS-Gaming-Vivobook-3.jpg', '2025-08-04', 0),
(2, 'Admin', 'Đánh giá Lenovo Yoga Slim 7x (Gen 9): Laptop chạy chip Snapdragon X Elite thời lượng pin \"trâu\" nhất', '<p>Thiết kế thanh lịch, m&agrave;n h&igrave;nh OLED sắc n&eacute;t, hiệu năng tốt v&agrave; thời lượng pin ấn tượng - tất cả g&oacute;i gọn trong Yoga Slim 7x, một chiếc laptop vừa đẹp mắt lại vừa mạnh mẽ. Lenovo Yoga Slim 7x (Gen 9</p>\r\n', '<h2><strong>Thiết kế mỏng nhẹ ấn tượng</strong></h2>\r\n\r\n<p>Trong số c&aacute;c laptop Lenovo m&agrave; m&igrave;nh đ&atilde; từng trải nghiệm, Yoga Slim 7x (Gen 9) thực sự g&acirc;y ấn tượng với thiết kế si&ecirc;u mỏng nhẹ với 12.9mm v&agrave; 1.28kg. Lenovo đ&atilde; tạo ra một bước đột ph&aacute; về độ mỏng trong d&ograve;ng Yoga, khiến sản phẩm trở n&ecirc;n kh&aacute;c biệt so với thế hệ trước.&nbsp;</p>\r\n\r\n<p><img alt=\"Đánh giá Lenovo Yoga Slim 7x Gen 9\" src=\"https://cdn-media.sforum.vn/storage/app/media/thanhhoang/lenovo-yoga-slim-7x-gen-9/danh-gia-lenovo-yoga-slim-7x-gen-9-08.jpg\" style=\"height:800px; width:1200px\" /></p>\r\n\r\n<p>So s&aacute;nh với &quot;người anh em&quot; Yoga Slim 7i (Gen 9) sử dụng chip Intel, Slim 7x c&ograve;n mỏng hơn 2mm v&agrave; nhẹ hơn 150g nhưng lại sở hữu vi&ecirc;n pin dung lượng lớn hơn.</p>\r\n\r\n<p>Khi gập lại, Lenovo Yoga Slim 7x mỏng gần như bằng một chiếc&nbsp;<a href=\"https://cellphones.com.vn/mobile.html\" target=\"_blank\">điện thoại</a>&nbsp;d&ugrave; n&oacute; vẫn l&agrave; một laptop kiểu vỏ s&ograve; b&igrave;nh thường. Điều n&agrave;y l&agrave; nhờ c&aacute;c SoC Snapdragon X của Qualcomm kh&ocirc;ng y&ecirc;u cầu kh&ocirc;ng gian nhiệt lớn như CPU của Intel hoặc AMD.</p>\r\n\r\n<p><img alt=\"Đánh giá Lenovo Yoga Slim 7x Gen 9\" src=\"https://cdn-media.sforum.vn/storage/app/media/thanhhoang/lenovo-yoga-slim-7x-gen-9/danh-gia-lenovo-yoga-slim-7x-gen-9-19.jpg\" style=\"height:800px; width:1200px\" /></p>\r\n\r\n<p>Kh&ocirc;ng chỉ mỏng, Slim 7x c&ograve;n được ho&agrave;n thiện từ chất liệu nh&ocirc;m v&agrave; k&iacute;nh cao cấp, c&ugrave;ng m&agrave;n h&igrave;nh cảm ứng đa điểm v&agrave; độ bền đạt ti&ecirc;u chuẩn qu&acirc;n sự MIL-STD-810H. Tuy kh&ocirc;ng c&oacute; nhiều lựa chọn m&agrave;u sắc, nhưng m&agrave;u Cosmic Blue cũng rất ấn tượng v&agrave; tạo n&ecirc;n sự cao cấp cho m&aacute;y d&ugrave; m&agrave;u n&agrave;y dễ b&aacute;m dấu v&acirc;n tay v&agrave; vết bẩn.</p>\r\n\r\n<p><img alt=\"Đánh giá Lenovo Yoga Slim 7x Gen 9\" src=\"https://cdn-media.sforum.vn/storage/app/media/thanhhoang/lenovo-yoga-slim-7x-gen-9/danh-gia-lenovo-yoga-slim-7x-gen-9-12.jpg\" style=\"height:800px; width:1200px\" /></p>\r\n\r\n<p>Điều l&agrave;m m&igrave;nh ấn tượng nhất l&agrave; độ bền của m&aacute;y. D&ugrave; rất mỏng nhẹ, Yoga Slim 7x vẫn cho cảm gi&aacute;c chắc chắn v&agrave; ổn định. M&igrave;nh đ&atilde; sử dụng m&aacute;y ở nhiều tư thế kh&aacute;c nhau nhưng kh&ocirc;ng cảm thấy kh&oacute; chịu.</p>\r\n\r\n<p><img alt=\"Đánh giá Lenovo Yoga Slim 7x Gen 9\" src=\"https://cdn-media.sforum.vn/storage/app/media/thanhhoang/lenovo-yoga-slim-7x-gen-9/danh-gia-lenovo-yoga-slim-7x-gen-9-03.jpg\" style=\"height:800px; width:1200px\" /></p>\r\n\r\n<p>Tuy nhi&ecirc;n, khi đ&oacute;ng mở laptop, m&igrave;nh lại nghe thấy c&oacute; tiếng k&ecirc;u nhỏ. Mặc d&ugrave; bản lề cho m&igrave;nh cảm gi&aacute;c rất chắc chắn, mượt m&agrave; v&agrave; được gia c&ocirc;ng rất tinh tế.</p>\r\n\r\n<p><img alt=\"Đánh giá Lenovo Yoga Slim 7x Gen 9\" src=\"https://cdn-media.sforum.vn/storage/app/media/thanhhoang/lenovo-yoga-slim-7x-gen-9/danh-gia-lenovo-yoga-slim-7x-gen-9-20.jpg\" style=\"height:800px; width:1200px\" /></p>\r\n\r\n<h2><strong>M&agrave;n h&igrave;nh &quot;đỉnh n&oacute;c kịch trần&quot;</strong></h2>\r\n\r\n<p>Để c&oacute; thiết kế đẹp v&agrave; cấu h&igrave;nh cao, c&aacute;c nh&agrave; sản xuất thường chọn m&agrave;n h&igrave;nh l&agrave; điểm cắt giảm để tiết kiệm chi ph&iacute;. Tuy nhi&ecirc;n, Lenovo vẫn cho người d&ugrave;ng một m&agrave;n h&igrave;nh rất chất lượng.&nbsp;</p>\r\n\r\n<p>Lenovo Yoga Slim 7x được trang bị m&agrave;n h&igrave;nh 14.5 inch với tỷ lệ khung h&igrave;nh 16:10 rộng r&atilde;i, độ ph&acirc;n giải 3K sắc n&eacute;t v&agrave; tần số qu&eacute;t 90Hz. Tần số qu&eacute;t 90Hz với m&igrave;nh l&agrave; một sự lựa chọn th&ocirc;ng minh, vừa đảm bảo h&igrave;nh ảnh chuyển động mượt m&agrave;, vừa gi&uacute;p tiết kiệm năng lượng hiệu quả.</p>\r\n\r\n<p><img alt=\"Đánh giá Lenovo Yoga Slim 7x Gen 9\" src=\"https://cdn-media.sforum.vn/storage/app/media/thanhhoang/lenovo-yoga-slim-7x-gen-9/danh-gia-lenovo-yoga-slim-7x-gen-9-14.jpg\" style=\"height:800px; width:1200px\" /></p>\r\n\r\n<p>Kh&ocirc;ng dừng lại ở đ&oacute;, h&atilde;ng vẫn sử dụng m&agrave;n h&igrave;nh OLED thay v&igrave; IPS LCD rẻ hơn, mang lại độ tương phản cao v&agrave; m&agrave;u sắc sống động. Lenovo cam kết độ ch&iacute;nh x&aacute;c m&agrave;u 100% DCI-P3 v&agrave; đ&atilde; chứng minh qua b&agrave;i test m&agrave;n h&igrave;nh.</p>\r\n\r\n<p>Với độ s&aacute;ng đỉnh điểm l&ecirc;n đến 1000 nits, Lenovo Yoga Slim 7x mang đến trải nghiệm h&igrave;nh ảnh HDR rất tốt. Đặc biệt khi xem phim hoặc chỉnh sửa ảnh với Dolby Vision. Mặc d&ugrave; độ s&aacute;ng tối đa kh&ocirc;ng duy tr&igrave; li&ecirc;n tục, nhưng độ s&aacute;ng trung b&igrave;nh vẫn rất cao với gần 500 nits ở mức s&aacute;ng 100%, gi&uacute;p bạn sử dụng m&aacute;y thoải m&aacute;i trong mọi điều kiện &aacute;nh s&aacute;ng.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/thanhhoang/lenovo-yoga-slim-7x-gen-9/danh-gia-lenovo-yoga-slim-7x-gen-9-02.jpg\" /></p>\r\n\r\n<p>Nh&igrave;n chung, m&agrave;n h&igrave;nh của Slim 7x cho h&igrave;nh ảnh hiển thị sắc n&eacute;t, m&agrave;u sắc rực rỡ, m&agrave;u đen s&acirc;u v&agrave; độ tương phản cao. Mặc d&ugrave; c&acirc;n bằng trắng hơi ấm ở độ s&aacute;ng 0%, nhưng đ&acirc;y kh&ocirc;ng phải l&agrave; một vấn đề qu&aacute; lớn v&igrave; l&agrave; vấn đề chung của tấm nền OLED.</p>\r\n\r\n<h2><strong>Cấu h&igrave;nh vượt ngo&agrave;i mong đợi</strong></h2>\r\n\r\n<p>N&oacute;i kh&ocirc;ng ngoa, Lenovo Yoga Slim 7x (Gen 9) c&oacute; sức mạnh ngang ngửa, thậm ch&iacute; l&agrave; hơn so với c&aacute;c thiết bị Intel Core Ultra. Chiếc laptop n&agrave;y hoạt động nhanh nhạy v&agrave; hiệu quả như mọi laptop Intel Evo kh&aacute;c, d&ugrave; m&igrave;nh c&oacute; chuyển đổi qua lại giữa h&agrave;ng t&aacute; tab tr&igrave;nh duyệt v&agrave; c&aacute;c ứng dụng kh&aacute;c nhau, xem nội dung đa phương tiện hoặc chuẩn bị cho một ng&agrave;y l&agrave;m việc.</p>\r\n\r\n<p><img alt=\"Đánh giá Lenovo Yoga Slim 7x Gen 9\" src=\"https://cdn-media.sforum.vn/storage/app/media/thanhhoang/lenovo-yoga-slim-7x-gen-9/danh-gia-lenovo-yoga-slim-7x-gen-9-07.jpg\" style=\"height:800px; width:1200px\" /></p>\r\n\r\n<p>Sơ bộ về cấu h&igrave;nh, Slim 7x sử dụng CPU Qualcomm Snapdragon X Elite, 32 GB LPDDR5X v&agrave; SSD 1TB PCIe Gen 4. Trong c&aacute;c b&agrave;i kiểm tra hiệu năng đồ họa v&agrave; CPU đ&ograve;i hỏi cao như Cinebench 2024, Lenovo Yoga Slim 7x đ&atilde; thể hiện một sức mạnh vượt trội so với c&aacute;c đối thủ cạnh tranh c&ugrave;ng ph&acirc;n kh&uacute;c, kể cả những chiếc laptop được trang bị cấu h&igrave;nh mạnh mẽ hơn tr&ecirc;n l&yacute; thuyết.</p>\r\n\r\n<p>Với Cinebench 2024, Yoga Slim 7x đ&atilde; đ&aacute;nh bại c&aacute;c thiết bị như Surface Laptop 7 (tr&ecirc;n l&yacute; thuyết l&agrave; mạnh hơn một ch&uacute;t so với 7x) với điểm đa l&otilde;i 1,009 so với 961 của Laptop 7.&nbsp;</p>\r\n', '1722747399_danh-gia-lenovo-yoga-slim-7x-gen-9-cover-0-0-0-0-1722392018.jpg', '2025-08-04', 0),
(3, 'Admin', 'Trên tay ASUS Vivobook S 15 AI 2024: Snapdragon X Elite với những trải nghiệm AI chưa từng có, giá 34.9 triệu', '<p><strong>Qu&aacute; nhiều điều mới lạ,&nbsp;&nbsp;<a href=\"https://cellphones.com.vn/laptop/asus/vivobook.html\" target=\"_blank\">ASUS Vivobook</a>&nbsp;S 15 OLED AI 2024 l&agrave; chiếc&nbsp;<a href=\"https://cellphones.com.vn/laptop.html\" target=\"_blank\">laptop</a>&nbsp;chuẩn Copilot+PCs với CPU Snapdragon X Elite đầu ti&ecirc;n đ&atilde; c&oacute; mặt tại Việt Nam.</strong></p>\r\n', '<p>4 năm trước, ASUS đ&atilde; từng cho ra mắt phi&ecirc;n bản ASUS Vivobook d&ograve;ng S c&oacute; c&ugrave;ng t&ecirc;n l&agrave; S 15, S16 v&agrave; được kh&aacute; &iacute;t người biết đến xuy&ecirc;n suốt c&aacute;c phi&ecirc;n bản cấu h&igrave;nh từ 2020 cho đến hiện tại. Phi&ecirc;n bản năm 2024, vẫn c&oacute; c&ugrave;ng một c&aacute;i t&ecirc;n, nhưng đ&acirc;y kh&ocirc;ng c&ograve;n l&agrave; &ldquo;ASUS Vivobook S 15 của ng&agrave;y h&ocirc;m qua&rdquo; nữa.</p>\r\n\r\n<p>Nhưng trước hết, mời bạn đọc h&atilde;y c&ugrave;ng m&igrave;nh tr&ecirc;n tay, v&agrave; c&ugrave;ng trải nghiệm những &ldquo;gi&acirc;y ph&uacute;t ban đầu&rdquo; c&ugrave;ng ASUS Vivobook S 15 AI 2024.</p>\r\n\r\n<p><strong>Xem th&ecirc;m:&nbsp;<a href=\"https://cellphones.com.vn/sforum/asus-vivobook-s-15-gia-bao-nhieu\">ASUS Vivobook S 15 - Laptop AI Copilot+ PC đầu ti&ecirc;n về Việt Nam cấu h&igrave;nh thế n&agrave;o, gi&aacute; b&aacute;n bao nhi&ecirc;u?</a></strong></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Tr%C3%AAn%20tay%20S%2015%20Vivobook%202024/tren-tay-asus-vivobook-s15-1.jpg\" /></p>\r\n\r\n<p>Mục lụcẨn</p>\r\n\r\n<p><a href=\"https://cellphones.com.vn/sforum/tren-tay-asus-vivobook-s15-ai-2024#snapdragon-x-elite-co-the-lam-duoc-gi\">1.&nbsp;Snapdragon X Elite c&oacute; thể l&agrave;m được g&igrave;</a><a href=\"https://cellphones.com.vn/sforum/tren-tay-asus-vivobook-s15-ai-2024#dep-va-chuyen-nghiep-xung-tam-gia\">2.&nbsp;Đẹp v&agrave; chuy&ecirc;n nghiệp xứng tầm gi&aacute;</a><a href=\"https://cellphones.com.vn/sforum/tren-tay-asus-vivobook-s15-ai-2024#man-hinh-lumina-oled-cung-tinh-nang-sleep-doc-dao\">3.&nbsp;M&agrave;n h&igrave;nh Lumina OLED c&ugrave;ng t&iacute;nh năng sleep độc đ&aacute;o</a><a href=\"https://cellphones.com.vn/sforum/tren-tay-asus-vivobook-s15-ai-2024#hieu-nang-bam-sat-apple-macbook-pro-m3\">4.&nbsp;Hiệu năng b&aacute;m s&aacute;t Apple MacBook Pro M3</a><a href=\"https://cellphones.com.vn/sforum/tren-tay-asus-vivobook-s15-ai-2024#su-dung-duoc-hau-het-cac-tinh-nang-ai-cua-windows-11-24h2-moi-nhat\">5.&nbsp;Sử dụng được &ldquo;hầu hết&rdquo; c&aacute;c t&iacute;nh năng AI của Windows 11 24H2 mới nhất</a><a href=\"https://cellphones.com.vn/sforum/tren-tay-asus-vivobook-s15-ai-2024#thoi-luong-pin-su-dung-lien-tuc-12-tieng\">6.&nbsp;Thời lượng pin sử dụng li&ecirc;n tục 12 tiếng</a><a href=\"https://cellphones.com.vn/sforum/tren-tay-asus-vivobook-s15-ai-2024#dau-tu-de-duoc-dung-som-tinh-nang-ai-moi-nhat\">7.&nbsp;Đầu tư để được d&ugrave;ng sớm t&iacute;nh năng AI mới nhất</a></p>\r\n\r\n<h2><strong>Snapdragon X Elite c&oacute; thể l&agrave;m được g&igrave;</strong></h2>\r\n\r\n<p>ASUS Vivobook S 15 AI 2024 v&agrave; c&aacute;c m&aacute;y Copilot+ PC t&iacute;ch hợp Microsoft Prism gi&uacute;p tương th&iacute;ch với nhiều phần mềm v&agrave; game x86/x64, tương tự như Rosetta 2 của&nbsp;<a href=\"https://cellphones.com.vn/apple\" target=\"_blank\">Apple</a>&nbsp;Silicon. Tuy nhi&ecirc;n, vẫn c&oacute; ưu v&agrave; nhược điểm t&ugrave;y theo nhu cầu sử dụng.</p>\r\n\r\n<p>C&aacute;c tr&igrave;nh duyệt phổ biến (Mozilla, Chrome, Edge) v&agrave; Office 365 đều đ&atilde; tối ưu cho ARM, hoạt động tốt. C&aacute;c phần mềm hội họp như Meet, Zoom, Skype cũng chạy ổn định. Telegram v&agrave;&nbsp;<a href=\"https://cellphones.com.vn/sforum/tag/thu-thuat-zalo\" target=\"_blank\">Zalo</a>&nbsp;vẫn dựa tr&ecirc;n x86/x64, cần khoảng 1-2 giờ sử dụng để giảm t&igrave;nh trạng lag.</p>\r\n\r\n<p>Những phần mềm Việt Nam như Unikey, VietKey, Zalo, v&agrave; khai b&aacute;o thuế vẫn chạy x86/64, c&oacute; đ&ocirc;i ch&uacute;t lag nhưng vẫn d&ugrave;ng được. Tuy nhi&ecirc;n, phần mềm đặc th&ugrave; như L&aacute;i xe B2 th&igrave; kh&ocirc;ng chạy được, cần th&ecirc;m thời gian để c&aacute;c nh&agrave; ph&aacute;t triển tối ưu h&oacute;a.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/haitran/Draft/tren-tay-asus-vivobook-s15-27.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/haitran/Draft/tren-tay-asus-vivobook-s15-28.jpg\" /></p>\r\n\r\n<p>C&aacute;c phần mềm đ&aacute;p ứng tốt cho c&aacute;c trải nghiệm sử dụng m&aacute;y t&iacute;nh v&agrave; đời sống x&atilde; hội. Vậy c&ograve;n c&ocirc;ng việc th&igrave; sao? C&aacute;c ứng dụng như Adobe v&agrave; Office đ&atilde; được thiết kế cho kiến tr&uacute;c ARM từ l&acirc;u, n&ecirc;n khi c&agrave;i đặt v&agrave; sử dụng tr&ecirc;n ASUS Vivobook S 15 AI 2024, ch&uacute;ng chạy mượt m&agrave; v&agrave; kh&ocirc;ng gặp lỗi.</p>\r\n\r\n<p>C&aacute;c phần mềm chỉnh sửa ảnh phổ biến như Adobe Photoshop, Adobe Lightroom v&agrave; Blender đ&atilde; được tối ưu h&oacute;a cho ARM, hoạt động mượt m&agrave; tr&ecirc;n Windows 11 của ASUS Vivobook S 15 AI 2024. Tuy nhi&ecirc;n, ứng dụng Capcut gặp t&igrave;nh trạng kh&ocirc;ng thể c&agrave;i đặt hoặc khởi chạy kh&ocirc;ng ổn định, thường xuy&ecirc;n bị tho&aacute;t đột ngột, khiến n&oacute; gần như kh&ocirc;ng thể sử dụng tr&ecirc;n Windows 11 ARM.</p>\r\n\r\n<p>Với h&agrave;ng loạt phần mềm đồ sộ n&agrave;y, m&igrave;nh sẽ d&agrave;nh ri&ecirc;ng một b&agrave;i test chi tiết hơn để đ&aacute;nh gi&aacute; từng phần mềm, nhằm cung cấp cho c&aacute;c bạn th&ocirc;ng tin cụ thể hơn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Tr%C3%AAn%20tay%20S%2015%20Vivobook%202024/tren-tay-asus-vivobook-s15-3.jpg\" /></p>\r\n\r\n<p>Về mặt gaming, ASUS Vivobook S 15 AI 2024 chắc chắn kh&ocirc;ng phải l&agrave; sự lựa chọn l&yacute; tưởng cho c&aacute;c game thủ. Nguy&ecirc;n nh&acirc;n l&agrave; do thời gian đầu, nhiều nh&agrave; ph&aacute;t triển v&agrave; cả Microsoft chưa kịp tối ưu c&aacute;c tựa game tr&ecirc;n nền tảng ho&agrave;n to&agrave;n mới n&agrave;y. Hầu hết c&aacute;c tựa game eSports phổ biến nhất tại Việt Nam hiện nay như&nbsp;<a href=\"https://cellphones.com.vn/sforum/tag/lien-minh-huyen-thoai\" target=\"_blank\">Li&ecirc;n Minh Huyền Thoại</a>, Valorant, hay c&aacute;c tựa game mới nổi như Zenless Zone Zero v&agrave; cả tựa game huyền thoại Red Alert đều kh&ocirc;ng thể chạy được.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Tr%C3%AAn%20tay%20S%2015%20Vivobook%202024/tren-tay-asus-vivobook-s15-30.jpg\" /></p>\r\n\r\n<p>C&aacute;c tựa game c&ograve;n lại m&igrave;nh đ&atilde; thử nghiệm nhanh như CS:GO 2 v&agrave; Subnautica đều c&oacute; thể chạy được tr&ecirc;n ASUS Vivobook S 15 AI 2024. Tuy nhi&ecirc;n, độ ổn định của FPS vẫn chưa đạt y&ecirc;u cầu v&agrave; cần th&ecirc;m thời gian để c&aacute;c bản cập nhật hỗ trợ tốt hơn. M&igrave;nh sẽ hẹn c&aacute;c bạn trong một b&agrave;i đ&aacute;nh gi&aacute; chi tiết ri&ecirc;ng về khả năng gaming, đặc biệt l&agrave; về t&iacute;nh năng Auto SR &quot;buff&quot; hiệu năng v&agrave; chất lượng nh&eacute;.</p>\r\n\r\n<h2><strong>Đẹp v&agrave; chuy&ecirc;n nghiệp xứng tầm gi&aacute;</strong></h2>\r\n\r\n<p>Kh&ocirc;ng c&ograve;n tồn tại chất liệu nhựa n&agrave;o tr&ecirc;n d&ograve;ng sản phẩm ASUS Vivobook S 15 2024 cả, ngoại trừ n&uacute;t&nbsp;<a href=\"https://cellphones.com.vn/phu-kien/chuot-ban-phim-may-tinh.html\" target=\"_blank\">b&agrave;n ph&iacute;m</a>. Tất cả đều l&agrave; nh&ocirc;m, nh&ocirc;m v&agrave; nh&ocirc;m, một ưu điểm r&otilde; r&agrave;ng đầu ti&ecirc;n đập ngay v&agrave;o mắt m&igrave;nh v&agrave; chạm tới mọi gi&aacute;c quan với cảm gi&aacute;c m&aacute;t lạnh, khi lần đầu nh&igrave;n ngắm v&agrave; sờ chạm chiếc laptop ho&agrave;n to&agrave;n mới của ASUS.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Tr%C3%AAn%20tay%20S%2015%20Vivobook%202024/tren-tay-asus-vivobook-s15-5.jpg\" /></p>\r\n\r\n<p>M&aacute;y được phủ l&ecirc;n một lớp m&agrave;u Bạc Platinum s&aacute;ng b&oacute;ng, khiến cho trải nghiệm thị gi&aacute;c c&agrave;ng xứng đ&aacute;ng hơn nữa. Với độ mỏng chỉ l&agrave; 1.47cm, trọng lượng vỏn vẹn 1.4kg, ASUS Vivobook S 15 AI 2024 ch&iacute;nh l&agrave; một thiết bị chuy&ecirc;n nghiệp d&agrave;nh cho những người đam m&ecirc; v&agrave; theo đuổi sự ho&agrave;n hảo.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Tr%C3%AAn%20tay%20S%2015%20Vivobook%202024/tren-tay-asus-vivobook-s15-26.jpg\" /></p>\r\n\r\n<p>Mở nắp m&aacute;y, ASUS Vivobook S 15 AI 2024 c&oacute; một bộ m&agrave;n h&igrave;nh hiển thị cực đẹp, với phần viền hai b&ecirc;n cực kỳ mỏng, viền tr&ecirc;n dưới d&agrave;y hơn nhưng lại rất c&acirc;n đối về tổng thể. Nằm ngay b&ecirc;n dưới l&agrave; cụm b&agrave;n ph&iacute;m được l&agrave;m tr&ocirc;ng rất tối giản với c&aacute;c ph&iacute;m h&igrave;nh vu&ocirc;ng, cụm Numpad được r&uacute;t gọn nhưng vẫn đủ phục vụ cho việc nhập liệu tốt.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Tr%C3%AAn%20tay%20S%2015%20Vivobook%202024/tren-tay-asus-vivobook-s15-8.jpg\" /></p>\r\n\r\n<p>Trackpad vẫn được đặt lệch về một b&ecirc;n, một sự sắp xếp rất truyền thống tr&ecirc;n những chiếc laptop 15.6 inch xưa nay. Nhưng diện t&iacute;ch của trackpad lại rất rộng r&atilde;i, thoải m&aacute;i để sử dụng m&agrave; c&oacute; thể kh&ocirc;ng cần tới chuột.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Tr%C3%AAn%20tay%20S%2015%20Vivobook%202024/tren-tay-asus-vivobook-s15-32.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hầu hết cổng kết nối của m&aacute;y đều nằm ở sườn m&aacute;y b&ecirc;n tr&aacute;i, gồm 2x tổng Type-C 4.0 chuẩn Displayport v&agrave; Power Delivery, 1x cổng HDMI, 1x khe đọc thẻ nhớ Micro SD v&agrave; cổng &acirc;m thanh AUX 3.5mm. B&ecirc;n sườn tr&aacute;i sẽ c&oacute; th&ecirc;m 2x cổng USB-A 3.2 gen 1 để mở rộng kết nối với c&aacute;c phụ kiện cơ bản kh&aacute;c.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Tr%C3%AAn%20tay%20S%2015%20Vivobook%202024/tren-tay-asus-vivobook-s15-25.jpg\" /></p>\r\n', '1722747470_tren-tay-asus-vivobook-s15-cover.jpg', '2025-08-04', 0),
(4, 'Admin', 'Thử chơi game trên chip Snapdragon X Elite: Auto SR đầy hứa hẹn, cần hỗ trợ nhiều tựa game hơn', '<p><strong>Snapdragon X Elite đ&atilde; ra mắt tr&ecirc;n những&nbsp;<a href=\"https://cellphones.com.vn/laptop.html\" target=\"_blank\">laptop</a>&nbsp;mới, hứa hẹn về khả năng l&agrave;m việc mạnh mẽ v&agrave; thời lượng pin ấn tượng. Tuy nhi&ecirc;n, khi chơi game, mẫu CPU n&agrave;y lại kh&aacute; &quot;k&eacute;n c&aacute; chọn game&quot;. D&ugrave; t&iacute;ch hợp t&iacute;nh năng upscale Auto SR, nhưng điều đ&oacute; vẫn chưa đủ.</strong></p>\r\n', '<p>Copilot+ PC đương nhi&ecirc;n kh&ocirc;ng d&agrave;nh cho việc chơi game, mục đ&iacute;ch gốc của n&oacute; ch&iacute;nh l&agrave; để phổ cập&nbsp;<a href=\"https://cellphones.com.vn/sforum\" target=\"_blank\">c&ocirc;ng nghệ</a>&nbsp;v&agrave; t&iacute;nh thực dụng của AI v&agrave;o luồng c&ocirc;ng việc h&agrave;ng ng&agrave;y. Tuy nhi&ecirc;n, với số tiền hơn 30 triệu bỏ ra để sở hữu một chiếc&nbsp;<a href=\"https://cellphones.com.vn/laptop/asus.html?laptop_cpu=qualcomm-snapdragon,intel-core-u5,intel-core-u7,intel-core-u9\">laptop ASUS AI</a>, nhu cầu chơi game nhẹ nh&agrave;ng xả stress, giải tr&iacute; vui vẻ l&agrave; kh&ocirc;ng thể thiếu.&nbsp;</p>\r\n\r\n<p>L&agrave; chiếc&nbsp;<a href=\"https://cellphones.com.vn/laptop/ai.html\">laptop AI</a>&nbsp;sở hữu Snapdragon X Elite được b&aacute;n ch&iacute;nh h&atilde;ng đầu ti&ecirc;n ở Việt Nam tại CellphoneS, mời bạn đọc h&atilde;y c&ugrave;ng m&igrave;nh tận hưởng những ph&uacute;t gi&acirc;y gaming v&ocirc; c&ugrave;ng mới mẻ tr&ecirc;n ASUS Vivobook S 15 OLED AI 2024.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/haitran/tren-tay-asus-vivobook-s15-29.jpg\" style=\"height:800px; width:1200px\" /></p>\r\n\r\n<p>Mục lụcẨn</p>\r\n\r\n<p><a href=\"https://cellphones.com.vn/sforum/danh-gia-choi-game-laptop-chay-chip-snapdragon-x-elite#chi-tiet-cau-hinh-va-cong-nghe-di-kem\">1.&nbsp;Chi tiết cấu h&igrave;nh v&agrave; c&ocirc;ng nghệ đi k&egrave;m</a><a href=\"https://cellphones.com.vn/sforum/danh-gia-choi-game-laptop-chay-chip-snapdragon-x-elite#test-game-voi-snapdragon-x-elite\">2.&nbsp;Test game với Snapdragon X Elite</a><a href=\"https://cellphones.com.vn/sforum/danh-gia-choi-game-laptop-chay-chip-snapdragon-x-elite#god-of-war-2018-41-fps-low-setting-720p-co-auto-sr\">2.1.&nbsp;God of War (2018): 41 FPS, Low setting, 720p (c&oacute; Auto SR)</a><a href=\"https://cellphones.com.vn/sforum/danh-gia-choi-game-laptop-chay-chip-snapdragon-x-elite#counter-strike-2-56-fps-low-setting-720p-khong-auto-sr\">2.2.&nbsp;Counter Strike 2: 56 FPS, Low setting, 720p (kh&ocirc;ng Auto SR)</a><a href=\"https://cellphones.com.vn/sforum/danh-gia-choi-game-laptop-chay-chip-snapdragon-x-elite#borderlands-3-35-fps-low-setting-720p-co-auto-sr\">2.3.&nbsp;Borderlands 3: 35 FPS, Low setting, 720p (c&oacute; Auto SR)</a><a href=\"https://cellphones.com.vn/sforum/danh-gia-choi-game-laptop-chay-chip-snapdragon-x-elite#subnautica-58-fps-medium-setting-720p-co-auto-sr\">2.4.&nbsp;Subnautica: 58 FPS, Medium setting, 720p (c&oacute; Auto SR)</a><a href=\"https://cellphones.com.vn/sforum/danh-gia-choi-game-laptop-chay-chip-snapdragon-x-elite#shadow-of-the-tomb-raider-42-fps-low-setting-720p-co-auto-sr\">2.5.&nbsp;Shadow of the Tomb Raider: 42 FPS. Low setting, 720p (c&oacute; Auto SR)</a><a href=\"https://cellphones.com.vn/sforum/danh-gia-choi-game-laptop-chay-chip-snapdragon-x-elite#gta-v-65-fps-high-setting-1080p-khong-auto-sr\">2.6.&nbsp;GTA V: 65 FPS, High setting, 1080p (kh&ocirc;ng Auto SR)</a><a href=\"https://cellphones.com.vn/sforum/danh-gia-choi-game-laptop-chay-chip-snapdragon-x-elite#nhung-luu-y-sau-khi-choi-game-tren-snapdragon-x-elite\">3.&nbsp;Những lưu &yacute; sau khi chơi game tr&ecirc;n Snapdragon X Elite</a></p>\r\n\r\n<p>Xem th&ecirc;m</p>\r\n\r\n<h2><strong>Chi tiết cấu h&igrave;nh v&agrave; c&ocirc;ng nghệ đi k&egrave;m</strong></h2>\r\n\r\n<p>Chiếc&nbsp;<a href=\"https://cellphones.com.vn/laptop/asus/vivobook.html\" target=\"_blank\">laptop ASUS Vivobook</a>&nbsp;S 15 OLED AI 2024 m&agrave; m&igrave;nh đang c&oacute; sẽ c&oacute; cấu h&igrave;nh sử dụng Snapdragon X Elite m&atilde; X1E-78-100, phi&ecirc;n bản X Elite cơ bản nhất trong d&agrave;n line-up c&oacute; đến 4 m&atilde; kh&aacute;c nhau. V&agrave; ASUS đ&atilde; cho chiếc Ultrabook n&agrave;y c&oacute; mức ti&ecirc;u thụ điện năng (TDP) l&ecirc;n đến 45W, mạnh nhất trong số những d&ograve;ng Copilot+ PC sắp v&agrave; đ&atilde; ra mắt tr&ecirc;n to&agrave;n cầu.&nbsp;</p>\r\n\r\n<p>Phi&ecirc;n bản mặc định b&aacute;n tại thị trường Việt Nam sẽ c&oacute; 32GB RAM. Kết hợp với iGPU Qualcomm Adreno tr&ecirc;n CPU v&agrave; c&ocirc;ng nghệ Auto SR (Super Resolution) c&oacute; tr&ecirc;n phi&ecirc;n bản Windows 24H2 mới nhất, những tựa game m&igrave;nh chơi thử b&ecirc;n dưới đ&acirc;y sẽ đem lại một trải nghiệm mượt m&agrave; v&agrave; ho&agrave;n to&agrave;n mới mẻ.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/tren-tay-asus-vivobook-s15-oled-2024-2211.jpg\" /></p>\r\n\r\n<p>C&ocirc;ng nghệ Auto SR được Microsoft c&ocirc;ng bố sẽ support mặc định cho loạt game sau, đ&oacute; l&agrave;: BeamNG.drive, Borderlands 3, Control (dx11), Dark Souls III, God of War, Kingdom Come: Deliverance, Resident Evil 2, Resident Evil 3, Sekiro Shadows Die Twice, Sniper Ghost Warrior Contracts 2 v&agrave; cuối c&ugrave;ng l&agrave; The Witcher 3.</p>\r\n\r\n<p>Kể sơ qua một v&agrave;i tựa game m&igrave;nh sẽ test, đ&oacute; sẽ l&agrave; God of War, Counter Strike 2, Borderlands 3, Sub Nautica, Shadow of The Tomb Raider, v&agrave; đặc biệt l&agrave; GTA V. Chi tiết thế n&agrave;o? Mời bạn theo d&otilde;i tiếp b&ecirc;n dưới đ&acirc;y.</p>\r\n\r\n<h2><strong>Test game với Snapdragon X Elite</strong></h2>\r\n\r\n<h3><strong>God of War (2018): 41 FPS, Low setting, 720p (c&oacute; Auto SR)</strong></h3>\r\n\r\n<p>Với tựa game n&agrave;y, m&igrave;nh sẽ để c&agrave;i đặt l&agrave; Low Setting v&igrave; n&oacute; tương đối nặng, để Low cho an to&agrave;n, v&agrave; độ ph&acirc;n giải l&agrave; HD. Chơi ở chế độ cửa sổ window thay v&igrave; full&nbsp;<a href=\"https://cellphones.com.vn/man-hinh.html\" target=\"_blank\">m&agrave;n h&igrave;nh</a>.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-21.jpg\" /></p>\r\n\r\n<p>L&yacute; do v&igrave; sao m&igrave;nh sẽ giải th&iacute;ch ngay, v&igrave; c&ocirc;ng nghệ Auto SR chỉ hoạt động khi chơi game ở độ ph&acirc;n giải n&agrave;y v&agrave; chế độ cửa sổ. Th&igrave; NPU l&uacute;c n&agrave;y mới bắt đầu hoạt động, tinh chỉnh, n&acirc;ng cấp chi tiết h&igrave;nh ảnh. FPS c&oacute; thể gọi l&agrave; tạm được, 35 - 48, nhưng h&igrave;nh ảnh th&igrave; m&igrave;nh thấy bị răng cưa kh&aacute; nhiều, nh&igrave;n kh&ocirc;ng được tự nhi&ecirc;n.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-04.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-23.jpg\" /></p>\r\n\r\n<p>Chuyển qua chơi full m&agrave;n h&igrave;nh, l&uacute;c n&agrave;y m&igrave;nh c&oacute; thể chỉnh độ ph&acirc;n giải l&ecirc;n cao nhất l&ecirc;n đến 2.8K, chất lượng h&igrave;nh ảnh m&igrave;nh vẫn để Low. V&agrave; FPS cũng bắt đầu tuột đ&aacute;ng kể, chỉ c&ograve;n dao động trong khoảng từ 26 - 31. Nhưng b&ugrave; lại, h&igrave;nh ảnh đẹp hơn, chi tiết v&agrave; m&agrave;u sắc tự nhi&ecirc;n, dễ nh&igrave;n hơn. Tuy nhi&ecirc;n, ở mức FPS n&agrave;y chỉ gọi l&agrave; đủ chơi chữa ch&aacute;y chứ kh&ocirc;ng gọi l&agrave; mượt.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-25.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-26.jpg\" /></p>\r\n\r\n<p>So s&aacute;nh h&igrave;nh ảnh khi c&oacute; Auto SR v&agrave; kh&ocirc;ng c&oacute; Auto SR:</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-22.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-29.jpg\" /></p>\r\n\r\n<h3><strong>Counter Strike 2: 56 FPS, Low setting, 720p (kh&ocirc;ng Auto SR)</strong></h3>\r\n\r\n<p>CS2 kh&ocirc;ng thuộc danh s&aacute;ch được c&ocirc;ng nghệ Auto SR hỗ trợ tăng cường chi tiết h&igrave;nh ảnh. V&igrave; vậy, m&igrave;nh chỉ c&oacute; thể c&agrave;i đặt đồ họa ở mức Low, độ ph&acirc;n giải thấp nhất l&agrave; HD. C&oacute; thể gọi l&agrave; chữa ch&aacute;y cho những xạ thủ ham vui.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-15.jpg\" /></p>\r\n\r\n<p>Tất nhi&ecirc;n, nghe tới setting l&agrave; biết ngay FPS sẽ ở mức gọi l&agrave; tạm được, với 56 FPS l&agrave; đỉnh điểm nhất. Nhưng trong qu&aacute; tr&igrave;nh di chuyển nh&acirc;n vật, dừng v&agrave; ngắm bắn, li&ecirc;n tục xảy ra hiện tượng bị giật khung h&igrave;nh. Y hệt như l&uacute;c mạng bị chậm vậy, cử chỉ v&agrave; h&agrave;nh động bị nhảy kh&aacute; nhiều. Chơi kh&ocirc;ng được thoải m&aacute;i cho lắm d&ugrave; FPS gần 60 cũng kh&ocirc;ng phải l&agrave; qu&aacute; tệ.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-17.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-16.jpg\" /></p>\r\n\r\n<h3><strong>Borderlands 3: 35 FPS, Low setting, 720p (c&oacute; Auto SR)</strong></h3>\r\n\r\n<p>Borderlands 3 thuộc danh s&aacute;ch được hỗ trợ Auto SR, v&agrave; ở tựa game n&agrave;y, m&igrave;nh c&oacute; thể nhận thấy hiệu quả thực sự của khả năng n&acirc;ng cấp chi tiết h&igrave;nh ảnh của AI. Như c&aacute;c bạn đ&atilde; biết th&igrave; đ&acirc;y l&agrave; một tựa game c&oacute; đồ họa phong c&aacute;ch animated (hoạt họa), cấu tr&uacute;c vật thể trong game kh&aacute; đơn giản. N&ecirc;n khi được n&acirc;ng cấp tự động, h&igrave;nh ảnh trở n&ecirc;n chi tiết hơn rất nhiều.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-07.jpg\" /></p>\r\n\r\n<p>Font chữ trong game l&agrave; đặc điểm dễ nhận thấy nhất, khi Auto SR n&acirc;ng cấp chi tiết th&igrave; bắt đầu thấy c&aacute;c n&eacute;t chữ bị biến đổi. Kh&ocirc;ng được liền lạc cho lắm, nhưng vẫn c&oacute; thể đọc được, v&agrave; c&aacute;c đường n&eacute;t của từ k&yacute; tự cũng kh&aacute; r&otilde; r&agrave;ng.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-11.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-09.jpg\" /></p>\r\n\r\n<p>Sau đ&oacute; l&agrave; đến nh&acirc;n vật trong game, vũ kh&iacute; đ&atilde; được AI tinh chỉnh để c&oacute; chi tiết cao hơn, m&agrave;u sắc thể hiện r&otilde; rệt hơn, kh&ocirc;ng c&ograve;n bị hiện tượng răng cưa, bề mặt vật thể trở n&ecirc;n phẳng v&agrave; mịn hơn. Kh&ocirc;ng bị mờ nh&ograve;e, nh&igrave;n kh&aacute; mượt v&agrave; chi tiết tốt gần tương tự như độ ph&acirc;n giải Full HD.&nbsp;</p>\r\n\r\n<p>Chuyển qua chơi chế độ Full m&agrave;n h&igrave;nh, vẫn độ ph&acirc;n giải cũ v&agrave; Low setting, ngay lập tức sẽ thấy c&aacute;c đường n&eacute;t vật thể v&agrave; khung cảnh trong game c&oacute; răng cưa, mờ nh&ograve;e r&otilde; rệt. T&iacute;nh ra, Auto SR dường như sẽ ph&ugrave; hợp nhất với những tựa game c&oacute; đồ họa phong c&aacute;ch anime, họa h&igrave;nh hơn l&agrave; đồ họa ch&acirc;n thật.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-14.jpg\" /></p>\r\n\r\n<p>So s&aacute;nh h&igrave;nh ảnh khi c&oacute; Auto SR v&agrave; kh&ocirc;ng c&oacute; Auto SR bạn đọc c&oacute; thể&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-10.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-13.jpg\" /></p>\r\n\r\n<h3><strong>Subnautica: 58 FPS, Medium setting, 720p (c&oacute; Auto SR)</strong></h3>\r\n\r\n<p>D&ugrave; kh&ocirc;ng thuộc danh s&aacute;ch hỗ trợ Auto SR, nhưng tựa game lặn biển Subnautica huyền thoại vẫn được ứng dụng c&ocirc;ng nghệ upscale h&igrave;nh ảnh từ AI. Khi chơi ở chế độ xem cửa sổ với c&agrave;i đặt Medium setting, mức FPS kh&oacute;a chặt ở 60, mượt m&agrave; dễ chơi. Chi tiết vật thể tốt, m&agrave;u sắc h&agrave;i h&ograve;a, trải nghiệm ổn &aacute;p ở độ ph&acirc;n giải 720p hơn c&aacute;c tựa game kh&aacute;c.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-48.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-47.jpg\" /></p>\r\n\r\n<p>FPS sẽ bị tuột xuống c&ograve;n 48 ngay khi chuyển qua chơi full cửa sổ. C&oacute; thể thấy so s&aacute;nh sự kh&aacute;c biệt r&otilde; rệt về chi tiết h&igrave;nh ảnh trong 2 h&igrave;nh b&ecirc;n dưới đ&acirc;y khi để chế độ cửa sổ v&agrave; full m&agrave;n h&igrave;nh:</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-46.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-43.jpg\" /></p>\r\n\r\n<h3><strong>Shadow of the Tomb Raider: 42 FPS. Low setting, 720p (c&oacute; Auto SR)</strong></h3>\r\n\r\n<p>Shadow of The Tomb Raider khi được Auto SR n&acirc;ng cấp chi tiết h&igrave;nh ảnh, nhưng hiệu quả đem lại kh&ocirc;ng đ&aacute;ng kể d&ugrave; được hỗ trợ ngay từ đầu. Đ&acirc;y l&agrave; một tựa game c&oacute; cấu tr&uacute;c đồ họa qu&aacute; phức tạp, với m&ocirc;i trường c&acirc;y cối nhiều, &aacute;nh s&aacute;ng thấp, n&ecirc;n việc Auto SR chưa thể t&aacute;ch bạch được c&aacute;c chi tiết với nhau l&agrave; chuyện đương nhi&ecirc;n.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-37.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-40.jpg\" /></p>\r\n\r\n<p>Vẫn l&agrave; ở c&agrave;i đặt Low v&agrave; độ ph&acirc;n giải HD, m&igrave;nh c&oacute; một trải nghiệm chơi kh&aacute; l&agrave; mỏi mắt với tựa game n&agrave;y. H&igrave;nh ảnh tổng thể kh&aacute; mờ nh&ograve;e, FPS cũng kh&ocirc;ng cao, chỉ dao động tr&ecirc;n dưới 30. M&igrave;nh c&oacute; chơi ở cả 2 chế độ cửa sổ v&agrave; full m&agrave;n h&igrave;nh, nhưng sự kh&aacute;c biệt l&agrave; kh&ocirc;ng thể nhận ra. Vẫn tương tự nhau m&agrave; th&ocirc;i, chưa được mượt m&agrave; v&agrave; sắc n&eacute;t.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-39.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-42.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-38.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-36.jpg\" /></p>\r\n\r\n<h3><strong>GTA V: 65 FPS, High setting, 1080p (kh&ocirc;ng Auto SR)</strong></h3>\r\n\r\n<p>Tuổi thơ hầu hết anh em ch&uacute;ng ta đều gắn liền với tựa game n&agrave;y. D&ugrave; kh&ocirc;ng hỗ trợ Auto SR, nhưng tựa game n&agrave;y lại đạt đỉnh điểm của sự ho&agrave;n hảo khi chơi game tr&ecirc;n một con chip thuần ARM như Snapdragon X Elite. Với mức c&agrave;i đặt High, độ ph&acirc;n giải Full HD, dễ d&agrave;ng đạt được 65 FPS v&agrave; duy tr&igrave; ổn định từ 65 - 80 trong suốt qu&aacute; tr&igrave;nh chơi.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-32.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-31.jpg\" /></p>\r\n\r\n<p>Những ph&acirc;n cảnh nhiệm vụ bắn nhau với nhiều cảnh s&aacute;t, nhiều phương tiện xe cộ, hiệu ứng ch&aacute;y nổ, vẫn rất mượt m&agrave;, FPS kh&ocirc;ng bị tuột qu&aacute; nhiều. Chỉ hơn k&eacute;m v&agrave;i FPS kh&ocirc;ng đ&aacute;ng kể. Điều n&agrave;y cho thấy, chỉ &aacute;p dụng phần cứng thuần GPU Adreno vượt trội hơn Intel Arc Graphics rất nhiều.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-35.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-34.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Ch%C6%A1i%20game%20-%20Vivobook%20AI/choi-game-vivobook-s15-x-elite-33.jpg\" /></p>\r\n\r\n<h2><strong>Những lưu &yacute; sau khi chơi game tr&ecirc;n Snapdragon X Elite</strong></h2>\r\n\r\n<p>Đầu ti&ecirc;n l&agrave; về vấn đề nhiệt độ, một trong những lợi thế to lớn của Snapdragon X Elite. C&aacute;c mẫu Ultrabook th&ocirc;ng thường sẽ nhanh ch&oacute;ng n&oacute;ng l&ecirc;n khoảng gần 100 độ khi chơi game. Với ASUS Vivobook S 15 OLED AI 2024, m&aacute;y đem lại sự m&aacute;t mẻ to&agrave;n diện, xuy&ecirc;n suốt qu&aacute; tr&igrave;nh chơi, v&agrave; tiếng ồn của quạt tản nhiệt l&agrave; kh&ocirc;ng đ&aacute;ng kể.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn-media.sforum.vn/storage/app/media/nhatquang519/Tr%C3%AAn%20tay%20S%2015%20Vivobook%202024/tren-tay-asus-vivobook-s15-30.jpg\" /></p>\r\n\r\n<p>Kể cả khi m&igrave;nh r&uacute;t sạc, chơi game tr&ecirc;n dung lượng pin mặc định, th&igrave; mức FPS vẫn giữ nguy&ecirc;n dao động trong từng tựa game. Kh&ocirc;ng hề bị sụt giảm ch&uacute;t n&agrave;o, chứng tỏ được khả năng tối ưu sức mạnh trong khi vẫn c&oacute; thể tiết kiệm năng lượng của Snapdragon X Elite l&agrave; cực kỳ tốt.&nbsp;</p>\r\n\r\n<p>Chi tiết hơn về c&ocirc;ng nghệ Auto SR, n&oacute; chỉ gi&uacute;p upscale ảnh độ ph&acirc;n giải thấp l&ecirc;n cao nhất, &aacute;p dụng c&aacute;c thuật to&aacute;n AI t&aacute;c động chỉnh sửa ảnh như: upsale, sharpen, denoise, v.v&hellip; chứ kh&ocirc;ng gi&uacute;p cho FPS tăng l&ecirc;n ch&uacute;t n&agrave;o cả. V&agrave; ch&uacute; &yacute; th&ecirc;m, l&agrave; phải mở chế độ cửa sổ, kh&ocirc;ng phải to&agrave;n m&agrave;n h&igrave;nh th&igrave; Auto SR mới hoạt động.&nbsp;</p>\r\n', '1722766284_choi-game-x-elite.jpg', '2025-08-04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int NOT NULL,
  `brand_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`) VALUES
(1, 'ASUS'),
(2, 'HP'),
(3, 'MACBOOK'),
(4, 'DELL'),
(5, 'Lenovo');

-- --------------------------------------------------------

--
-- Table structure for table `capacity`
--

CREATE TABLE `capacity` (
  `capacity_id` int NOT NULL,
  `capacity_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `capacity`
--

INSERT INTO `capacity` (`capacity_id`, `capacity_name`) VALUES
(1, '10ml');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_description`, `category_image`) VALUES
(1, 'Laptop HP', 'aaaaaaaaaaa', '1742746284_hp.png'),
(2, 'Laptop ASUS', 'a', '1742746175_asus5.png'),
(3, 'Laptop Dell', 'aaaaaa', '1742746342_dell.png'),
(4, 'Laptop Macbook', 'aaaa', '1742746336_mac.png'),
(5, 'Laptop Lenovo', 'aaaa', '1742746237_lenovo.png');

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `collection_id` int NOT NULL,
  `collection_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_keyword` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_order` int NOT NULL,
  `collection_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int NOT NULL,
  `article_id` int NOT NULL,
  `comment_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_date` date NOT NULL,
  `comment_status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `account_id` int NOT NULL,
  `customer_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_gender` int NOT NULL,
  `customer_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL,
  `account_id` int NOT NULL,
  `delivery_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_note` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `account_id`, `delivery_name`, `delivery_phone`, `delivery_address`, `delivery_note`) VALUES
(637, 23, 'Nguyễn Văn A', '0123456789', 'Hồ Chi Minh', 'Giao  nhanh'),
(4995, 23, 'Nguyen Van A', '0123456789', 'Hà Nội', 'Giao  Nhanh');

-- --------------------------------------------------------

--
-- Table structure for table `evaluate`
--

CREATE TABLE `evaluate` (
  `evaluate_id` int NOT NULL,
  `account_id` int NOT NULL,
  `product_id` int NOT NULL,
  `account_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evaluate_rate` int NOT NULL,
  `evaluate_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `evaluate_date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evaluate_status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int NOT NULL,
  `account_id` int NOT NULL,
  `staf_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory_note` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory_date` date NOT NULL,
  `total_amount` float NOT NULL,
  `inventory_status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `account_id`, `staf_name`, `supplier_name`, `supplier_phone`, `inventory_note`, `inventory_code`, `inventory_date`, `total_amount`, `inventory_status`) VALUES
(1, 23, 'aa', 'aa', '0123456789', 'aa', '1322', '2025-03-23', 2000000000, 0),
(2, 23, 'Admin', 'FPT', '0123456789', 'Nhập hàng', '400', '2025-03-23', 10000000000, 0),
(3, 23, 'Quản t rị viên', 'FPT shop', '0123456789', 'Nhập hàng', '6433', '2025-03-23', 50000000000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_detail`
--

CREATE TABLE `inventory_detail` (
  `inventory_detail_id` int NOT NULL,
  `inventory_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL,
  `product_quantity` int NOT NULL,
  `product_price_import` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_detail`
--

INSERT INTO `inventory_detail` (`inventory_detail_id`, `inventory_code`, `product_id`, `product_quantity`, `product_price_import`) VALUES
(1, '1322', 4, 200, 10000000),
(2, '400', 1, 1000, 10000000),
(3, '6433', 4, 2000, 10000000),
(4, '6433', 3, 1000, 10000000),
(5, '6433', 2, 1000, 10000000),
(6, '6433', 1, 1000, 10000000);

-- --------------------------------------------------------

--
-- Table structure for table `metrics`
--

CREATE TABLE `metrics` (
  `metric_id` int NOT NULL,
  `metric_date` date NOT NULL,
  `metric_order` int NOT NULL,
  `metric_sales` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metric_quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metrics`
--

INSERT INTO `metrics` (`metric_id`, `metric_date`, `metric_order`, `metric_sales`, `metric_quantity`) VALUES
(1, '2025-03-23', 2, '55970000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `momo`
--

CREATE TABLE `momo` (
  `momo_id` int NOT NULL,
  `partner_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_code` int NOT NULL,
  `momo_amount` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_info` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trans_id` int NOT NULL,
  `payment_date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_code` int NOT NULL,
  `order_date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` int NOT NULL,
  `delivery_id` int NOT NULL,
  `total_amount` int NOT NULL,
  `order_type` int NOT NULL,
  `order_status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_code`, `order_date`, `account_id`, `delivery_id`, `total_amount`, `order_type`, `order_status`) VALUES
(1, 2476, '2025-03-23 23:21:44', 23, 637, 17990000, 1, 3),
(2, 9585, '2025-03-23 23:35:46', 23, 4995, 37980000, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int NOT NULL,
  `order_code` int NOT NULL,
  `product_id` int NOT NULL,
  `product_quantity` int NOT NULL,
  `product_price` int NOT NULL,
  `product_sale` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_code`, `product_id`, `product_quantity`, `product_price`, `product_sale`) VALUES
(1, 2476, 1, 1, 17990000, 0),
(2, 9585, 2, 1, 18990000, 0),
(3, 9585, 4, 1, 18990000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_category` int DEFAULT NULL,
  `product_brand` int DEFAULT '2',
  `capacity_id` int DEFAULT '5',
  `product_quantity` int DEFAULT NULL,
  `quantity_sales` int DEFAULT NULL,
  `product_price_import` int DEFAULT NULL,
  `product_price` int DEFAULT NULL,
  `product_sale` int DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_category`, `product_brand`, `capacity_id`, `product_quantity`, `quantity_sales`, `product_price_import`, `product_price`, `product_sale`, `product_description`, `product_image`, `product_status`) VALUES
(1, 'Laptop Asus Vivobook 15 X1504ZA i5 1235U/16GB/1TB/Win11 (NJ1528W)', 0, 1, 5, 1999, 1, 10000000, 17990000, 0, '<h3>Đừng chần chừ m&agrave; h&atilde;y sở hữu ngay mẫu laptop kiểu d&aacute;ng sang trọng, cấu h&igrave;nh ổn định c&ugrave;ng đa dạng c&aacute;c t&iacute;nh năng t&acirc;n tiến kh&aacute;c tại Thế Giới Di Động.&nbsp;<a href=\"https://www.thegioididong.com/laptop/asus-vivobook-15-x1504za-i5-nj1528w\" target=\"_blank\">Laptop Asus Vivobook 15 X1504ZA i5 1235U (NJ1528W)</a>&nbsp;hứa hẹn sẽ l&agrave; người đồng h&agrave;nh đ&aacute;ng tin cậy cho mọi người d&ugrave;ng trong c&ocirc;ng việc v&agrave; học tập.</h3>\r\n\r\n<p>&bull;&nbsp;<a href=\"https://www.thegioididong.com/laptop-asus\" target=\"_blank\">Laptop Asus</a>&nbsp;sở hữu kiểu d&aacute;ng bắt mắt, vẻ ngo&agrave;i thanh mảnh c&ugrave;ng t&ocirc;ng m&agrave;u&nbsp;<strong>xanh&nbsp;</strong>v&ocirc; c&ugrave;ng &quot;hợp thời&quot; khiến thiết bị như sở hữu n&eacute;t thẩm mỹ, c&oacute; thể ph&ugrave; hợp với bất cứ ho&agrave;n cảnh hay m&ocirc;i trường n&agrave;o. Mảnh mai nhưng v&ocirc; c&ugrave;ng chắc chắn với lớp&nbsp;<strong>vỏ nhựa</strong>&nbsp;cao cấp c&ugrave;ng ti&ecirc;u chuẩn độ bền qu&acirc;n đội&nbsp;<strong>MIL STD 810H</strong>, chỉ cần sắm th&ecirc;m một t&uacute;i chống sốc l&agrave; bạn ho&agrave;n to&agrave;n c&oacute; thể tự tin mang m&aacute;y đến bất cứ đ&acirc;u.</p>\r\n\r\n<p>&bull; Chức năng&nbsp;<strong>bảo mật v&acirc;n tay</strong>&nbsp;được t&iacute;ch hợp trực tiếp ngay tr&ecirc;n phần TouchPad hỗ trợ bạn truy cập thiết bị vừa an to&agrave;n lại kh&ocirc;ng mất c&ocirc;ng nhập từng ph&iacute;m mỗi khi mở l&ecirc;n.</p>\r\n\r\n<p>&bull; Dọc hai b&ecirc;n th&acirc;n laptop l&agrave; đa dạng c&aacute;c cổng giao tiếp như USB Type-C, USB 2.0, Jack tai nghe 3.5 mm, USB 3.2 v&agrave; HDMI để thuận tiện kết nối khi cần thiết.</p>\r\n\r\n<p>&bull; Sở hữu CPU&nbsp;<strong>Intel Core i5 1235U</strong>&nbsp;thế hệ 12 hiện đại, hiệu năng dư sức c&acirc;n c&aacute;c tệp Word d&agrave;i v&agrave;i chục trang hoặc file Excel nặng, đồng thời d&ograve;ng CPU hậu tố U n&agrave;y cũng l&agrave;m giảm lượng điện ti&ecirc;u thụ cho thiết bị đi đ&aacute;ng kể, k&eacute;o d&agrave;i thời lượng v&agrave; hiệu suất sử dụng&nbsp;<a href=\"https://www.thegioididong.com/laptop\" target=\"_blank\">laptop</a>.</p>\r\n\r\n<p>&bull; GPU t&iacute;ch hợp&nbsp;<strong>Intel Iris Xe Graphics</strong>&nbsp;mang đến khả năng dựng xuất h&igrave;nh ảnh v&ocirc; c&ugrave;ng tốt, người d&ugrave;ng c&oacute; thể tự tin l&agrave;m việc đồ hoạ th&ocirc;ng dụng tr&ecirc;n Photoshop, AI, Figma,... dựng c&aacute;c video ngắn v&agrave; c&ugrave;ng với đ&oacute; l&agrave; chiến thoải m&aacute;i c&aacute;c tựa game đang thịnh h&agrave;nh với mức đồ hoạ tinh chỉnh.</p>\r\n\r\n<p>&bull; Đa nhiệm tuyệt vời nhờ mức&nbsp;<strong>RAM 16 GB</strong>&nbsp;thừa sức cho c&aacute;c bạn vừa xem phim giải tr&iacute; vừa học online tr&ecirc;n Microsoft Teams, một l&uacute;c chạy nhiều t&aacute;c vụ như tr&igrave;nh duyệt, c&aacute;c ứng dụng học tập,... Ổ cứng<strong>&nbsp;SSD 1 TB</strong>&nbsp;cung cấp kh&ocirc;ng gian lưu trữ c&aacute; nh&acirc;n kh&aacute; rộng r&atilde;i, lưu trữ hiệu quả c&aacute;c t&agrave;i liệu, video,...</p>\r\n', '1742746131_asus4.png', 1),
(2, 'Laptop Asus Vivobook 16 X1605VA i5 1335U/16GB/512GB/Win11 (MB360W)', 0, 1, 5, 999, 1, 10000000, 18990000, 0, '<ul>\r\n	<li>\r\n	<p>CPU:</p>\r\n\r\n	<p>i51335U1.3GHz</p>\r\n	</li>\r\n	<li>\r\n	<p>RAM:</p>\r\n\r\n	<p>16 GBDDR4 2 khe (8 GB onboard + 1 khe 8 GB)3200 MHz</p>\r\n	</li>\r\n	<li>\r\n	<p>Ổ cứng:</p>\r\n\r\n	<p>512 GB SSD NVMe PCIe</p>\r\n	</li>\r\n	<li>\r\n	<p>M&agrave;n h&igrave;nh:</p>\r\n\r\n	<p>16&quot;WUXGA (1920 x 1200)</p>\r\n	</li>\r\n	<li>\r\n	<p>Card m&agrave;n h&igrave;nh:</p>\r\n\r\n	<p>Card t&iacute;ch hợpIntel Iris Xe</p>\r\n	</li>\r\n	<li>\r\n	<p>Cổng kết nối:</p>\r\n\r\n	<p>Jack tai nghe 3.5 mmHDMI2 x USB 3.21 x USB Type-C (chỉ hỗ trợ Power Delivery)1 x USB 2.0</p>\r\n	</li>\r\n	<li>\r\n	<p>Hệ điều h&agrave;nh:</p>\r\n\r\n	<p>Windows 11 Home SL</p>\r\n	</li>\r\n	<li>\r\n	<p>Thiết kế:</p>\r\n\r\n	<p>Vỏ nhựa</p>\r\n	</li>\r\n	<li>\r\n	<p>K&iacute;ch thước, khối lượng:</p>\r\n\r\n	<p>D&agrave;i 358.7 mm - Rộng 249.5 mm - D&agrave;y 19.9 mm</p>\r\n	</li>\r\n	<li>\r\n	<p>Thời điểm ra mắt:</p>\r\n\r\n	<p>2023</p>\r\n	</li>\r\n</ul>\r\n', '1742746123_asus3.png', 1),
(3, 'Laptop Asus Vivobook 15 OLED A1505ZA i5 12500H/16GB/512GB/120Hz/Win11 (MA415W)', 0, 1, 5, 1000, NULL, 10000000, 19890000, 0, '<p>Cấu h&igrave;nh Laptop Asus Vivobook 15 OLED A1505ZA i5 12500H/16GB/512GB/120Hz/Win11 (MA415W)</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>CPU:</p>\r\n\r\n	<p>i512500H2.5GHz</p>\r\n	</li>\r\n	<li>\r\n	<p>RAM:</p>\r\n\r\n	<p>16 GBDDR4 2 khe (8 GB onboard + 1 khe 8 GB)3200 MHz</p>\r\n	</li>\r\n	<li>\r\n	<p>Ổ cứng:</p>\r\n\r\n	<p>512 GB SSD NVMe PCIe</p>\r\n	</li>\r\n	<li>\r\n	<p>M&agrave;n h&igrave;nh:</p>\r\n\r\n	<p>15.6&quot;2.8K (2880 x 1620) - OLED120Hz</p>\r\n	</li>\r\n	<li>\r\n	<p>Card m&agrave;n h&igrave;nh:</p>\r\n\r\n	<p>Card t&iacute;ch hợpIntel Iris Xe</p>\r\n	</li>\r\n	<li>\r\n	<p>Cổng kết nối:</p>\r\n\r\n	<p>USB Type-CJack tai nghe 3.5 mmHDMI2 x USB 3.21 x USB 2.0</p>\r\n	</li>\r\n	<li>\r\n	<p>Hệ điều h&agrave;nh:</p>\r\n\r\n	<p>Windows 11 Home SL</p>\r\n	</li>\r\n	<li>\r\n	<p>Thiết kế:</p>\r\n\r\n	<p>Vỏ nhựa</p>\r\n	</li>\r\n	<li>\r\n	<p>K&iacute;ch thước, khối lượng:</p>\r\n\r\n	<p>D&agrave;i 356.8 mm - Rộng 227.6 mm - D&agrave;y 19.9 mm</p>\r\n	</li>\r\n	<li>\r\n	<p>Thời điểm ra mắt:</p>\r\n\r\n	<p>2024</p>\r\n	</li>\r\n</ul>\r\n', '1742746056_asus2.png', 1),
(4, 'Laptop Asus TUF Gaming A15 FA506NC R5 7535HS/16GB/512GB/4GB RTX3050/144Hz/Win11 (HN017W) ', 0, 1, 5, 2199, 1, 10000000, 18990000, 0, '<h3>Th&ocirc;ng tin sản phẩm</h3>\r\n\r\n<h3><a href=\"https://www.thegioididong.com/laptop/asus-tuf-gaming-a15-fa506nc-r5-hn017w\" target=\"_blank\">Laptop Asus TUF Gaming A15 FA506NC R5 7535HS (HN017W)</a>&nbsp;với sự trang bị hiệu năng mạnh mẽ từ card RTX 30 series, khung h&igrave;nh mượt m&agrave; với tần số qu&eacute;t 144 Hz. Chiếc&nbsp;<a href=\"https://www.thegioididong.com/laptop?g=laptop-gaming\" target=\"_blank\">laptop gaming</a>&nbsp;n&agrave;y chắc chắn sẽ gi&uacute;p bạn&nbsp;tận hưởng những gi&acirc;y ph&uacute;t đỉnh cao trong chiến trường ảo.</h3>\r\n\r\n<p>&bull;&nbsp;<a href=\"https://www.thegioididong.com/laptop\" target=\"_blank\">Laptop</a>&nbsp;được trang bị con chip&nbsp;<strong>AMD Ryzen 5 7535HS</strong>&nbsp;d&ograve;ng HS mạnh mẽ c&oacute; tốc độ &eacute;p xung tối đa l&ecirc;n đến&nbsp;<strong>4.55 GHz</strong>&nbsp;cho ph&eacute;p người d&ugrave;ng xử l&yacute; mượt m&agrave; mọi t&aacute;c vụ c&ocirc;ng việc hằng ng&agrave;y, chiến game thả ga với c&aacute;c tựa game hot như CS:GO, FC Online, LOL,...</p>\r\n\r\n<p>&bull; Ngo&agrave;i ra, card rời&nbsp;<strong>NVIDIA GeForce RTX 3050 4 GB</strong>&nbsp;c&ugrave;ng t&iacute;nh năng chuyển đổi card linh hoạt&nbsp;<strong>NVIDIA Optimus&nbsp;</strong>c&ograve;n đem đến khả năng xử l&yacute; đồ họa n&acirc;ng cao, hỗ trợ người d&ugrave;ng vận h&agrave;nh hiệu quả c&aacute;c ứng dụng s&aacute;ng tạo hay chiến game với cấu h&igrave;nh cao c&ugrave;ng khung h&igrave;nh ổn định, mượt m&agrave; ngay cả trong pha combat đỉnh cao nhất.</p>\r\n\r\n<p>&bull;&nbsp;<a href=\"https://www.thegioididong.com/laptop-asus-tuf-gaming\" target=\"_blank\">Laptop Asus TUF Gaming</a>&nbsp;c&oacute; đi k&egrave;m bộ nhớ<strong>&nbsp;RAM 16 GB</strong>&nbsp;hỗ trợ đa nhiệm hiệu quả, nhanh ch&oacute;ng v&agrave; trơn tru khi thao t&aacute;c giữa nhiều tab. B&ecirc;n cạnh đ&oacute;, bạn cũng c&oacute; thể n&acirc;ng cấp RAM l&ecirc;n tối đa<strong>&nbsp;32 GB&nbsp;</strong>để trải nghiệm được c&aacute;c tựa game nặng hay ứng dụng đ&ograve;i hỏi nhiều t&agrave;i nguy&ecirc;n hơn.</p>\r\n\r\n<p>&bull; Kh&ocirc;ng chần chừ khi lưu trữ v&agrave; tải về những tựa game y&ecirc;u th&iacute;ch của bạn với ổ cứng&nbsp;<strong>SSD&nbsp;</strong>dung lượng&nbsp;<strong>512 GB</strong>. Ngo&agrave;i ra, bạn c&oacute; thể lựa chọn th&aacute;o lắp v&agrave; mở rộng kh&ocirc;ng gian lưu trữ đến<strong>&nbsp;1 TB</strong>&nbsp;nếu th&iacute;ch.</p>\r\n\r\n<p>&bull; M&agrave;n h&igrave;nh&nbsp;<strong>15.6 inch&nbsp;</strong>sử dụng tấm nền<strong>&nbsp;IPS&nbsp;</strong>v&agrave; c&oacute; độ ph&acirc;n giải&nbsp;<strong>Full HD (1920 x 1080)</strong>&nbsp;mang đến kh&ocirc;ng gian trải nghiệm nội dung bao qu&aacute;t c&ugrave;ng t&iacute;nh sắc n&eacute;t cho h&igrave;nh ảnh khi bạn xem phim hay chơi game. Hơn nữa, c&ocirc;ng nghệ chống ch&oacute;i&nbsp;<strong>Anti Glare</strong>&nbsp;hạn chế được t&igrave;nh trạng b&oacute;ng gương m&agrave;n h&igrave;nh, khi bạn d&ugrave;ng m&aacute;y ở ngo&agrave;i trời hay nơi c&oacute; độ s&aacute;ng cao.</p>\r\n\r\n<p>&bull; Tần số qu&eacute;t&nbsp;<strong>144 Hz</strong>&nbsp;giữ khung h&igrave;nh ổn định, mượt m&agrave; v&agrave; ch&iacute;nh x&aacute;c nhất, hạn chế tối đa hiện tượng x&eacute; h&igrave;nh, trễ ảnh khi bạn chơi những tựa game c&oacute; tốc độ chuyển cảnh nhanh như bắn s&uacute;ng, đua xe,...</p>\r\n\r\n<p>&bull; Bung nhiệt hơn ở c&aacute;c tựa game h&agrave;nh động, nhập vai, bắn s&uacute;ng với hệ thống loa chuẩn&nbsp;<strong>Hi-Res</strong>&nbsp;t&iacute;ch hợp c&ugrave;ng c&ocirc;ng nghệ &acirc;m thanh v&ograve;m&nbsp;<strong>DTS Audio</strong>, chất &acirc;m đa chiều khiến bạn kh&ocirc;ng thể bỏ qua bất cứ khoảnh khắc hấp dẫn n&agrave;o.</p>\r\n\r\n<p>&bull; M&aacute;y được ho&agrave;n thiện đẹp mắt với lớp<strong>&nbsp;vỏ nhựa&nbsp;</strong>cứng c&aacute;p, bộ khung lớn c&ugrave;ng logo d&ograve;ng đặc trưng, mang đến những n&eacute;t c&aacute; t&iacute;nh, ri&ecirc;ng biệt điển h&igrave;nh của d&ograve;ng gaming, chắc chắn sẽ thu h&uacute;t bất cứ game thủ n&agrave;o ngay từ lần gặp đầu ti&ecirc;n.</p>\r\n\r\n<p>&bull;&nbsp;<a href=\"https://www.thegioididong.com/laptop-asus\" target=\"_blank\">Laptop Asus</a>&nbsp;c&oacute; khối lượng tổng thể<strong>&nbsp;2.3 kg</strong>&nbsp;vẫn kh&ocirc;ng qu&aacute; kh&oacute; chịu khi bạn mang m&aacute;y theo b&ecirc;n m&igrave;nh suốt ng&agrave;y d&agrave;i. B&agrave;n ph&iacute;m c&oacute; đ&egrave;n chuyển m&agrave;u&nbsp;<strong>RGB - 1 v&ugrave;ng</strong>&nbsp;hỗ trợ c&aacute;c thao t&aacute;c g&otilde; thuận tiện ngay cả trong m&ocirc;i trường thiếu s&aacute;ng, khơi dậy được nhiều cảm hứng hơn tr&ecirc;n chiến trường.</p>\r\n\r\n<p>&bull; Thiết bị c&oacute; đầy đủ c&aacute;c cổng giao tiếp như: USB Type-C, Jack tai nghe 3.5 mm, USB 3.2, HDMI v&agrave; LAN để thuận tiện kết nối khi cần thiết.</p>\r\n', '1742746148_asus5.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vnpay`
--

CREATE TABLE `vnpay` (
  `vnp_id` int NOT NULL,
  `vnp_amount` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vnp_bankcode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vnp_banktranno` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vnp_cardtype` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vnp_orderinfo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vnp_paydate` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vnp_tmncode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vnp_transactionno` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_code` int NOT NULL,
  `payment_status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `capacity`
--
ALTER TABLE `capacity`
  ADD PRIMARY KEY (`capacity_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`collection_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `evaluate`
--
ALTER TABLE `evaluate`
  ADD PRIMARY KEY (`evaluate_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indexes for table `inventory_detail`
--
ALTER TABLE `inventory_detail`
  ADD PRIMARY KEY (`inventory_detail_id`);

--
-- Indexes for table `metrics`
--
ALTER TABLE `metrics`
  ADD PRIMARY KEY (`metric_id`);

--
-- Indexes for table `momo`
--
ALTER TABLE `momo`
  ADD PRIMARY KEY (`momo_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `vnpay`
--
ALTER TABLE `vnpay`
  ADD PRIMARY KEY (`vnp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `capacity`
--
ALTER TABLE `capacity`
  MODIFY `capacity_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `collection_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluate`
--
ALTER TABLE `evaluate`
  MODIFY `evaluate_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventory_detail`
--
ALTER TABLE `inventory_detail`
  MODIFY `inventory_detail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `metrics`
--
ALTER TABLE `metrics`
  MODIFY `metric_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `momo`
--
ALTER TABLE `momo`
  MODIFY `momo_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vnpay`
--
ALTER TABLE `vnpay`
  MODIFY `vnp_id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
