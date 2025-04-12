# Hệ thống quản lý cửa hàng H-Shop

## Chức năng nhập kho

### 1. Tạo phiếu nhập kho

- Tạo mã phiếu tự động không trùng lặp
- Nhập thông tin phiếu: người nhập, nhà cung cấp, ghi chú, số điện thoại
- Thêm nhiều sản phẩm vào phiếu
- Tự động tính tổng tiền
- Validation đầy đủ các trường bắt buộc

### 2. Thêm sản phẩm vào phiếu

- Chọn sản phẩm từ danh sách có sẵn
- Nhập số lượng và giá nhập
- Tự động điền giá nhập từ lần nhập trước
- Tự động cộng dồn số lượng nếu thêm sản phẩm đã có
- Format số tiền theo định dạng VND

### 3. Xử lý lưu phiếu

- Kiểm tra đầy đủ thông tin bắt buộc
- Validate số điện thoại 10 số
- Sử dụng transaction để đảm bảo tính toàn vẹn dữ liệu
- Cập nhật số lượng tồn kho
- Lưu chi tiết phiếu nhập
- Xử lý lỗi và rollback khi cần thiết

### 4. Bảo mật

- Sử dụng prepared statements để tránh SQL injection
- Escape dữ liệu đầu vào
- Kiểm tra quyền truy cập
- Log lỗi để debug

### 5. Giao diện

- Responsive design
- Validation form phía client
- Thông báo lỗi/thành công rõ ràng
- Nút xóa sản phẩm và xóa tất cả
- Nút in phiếu nhập

## Cài đặt

1. Clone repository
2. Import database
3. Cấu hình kết nối trong config/config.php
4. Chạy composer install để cài đặt các dependency

## Yêu cầu hệ thống

- PHP >= 7.0
- MySQL >= 5.7
- Apache/Nginx
- Composer
