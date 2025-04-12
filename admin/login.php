<?php
session_start();
include('config/config.php');
if (isset($_POST['login'])) {
    $account_email = $_POST['account_email'];
    $account_password = md5($_POST['account_password']);
    $account_email = mysqli_real_escape_string($mysqli, $account_email);
    $account_password = mysqli_real_escape_string($mysqli, $account_password);
    $sql_account = "SELECT * FROM account WHERE account_email='" . $account_email . "' AND account_password='" . $account_password . "' AND (account_type=1 OR account_type=2) ";
    $query_account = mysqli_query($mysqli, $sql_account);
    $row = mysqli_fetch_array($query_account);
    $count = mysqli_num_rows($query_account);
    if ($count > 0) {
        $_SESSION['login'] = $row['account_email'];
        $_SESSION['account_id_admin'] = $row['account_id'];
        $_SESSION['account_name'] = $row['account_name'];
        $_SESSION['account_type'] = $row['account_type'];
        header('Location:index.php');
    } else {
        $error = true;
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - LaptopSale</title>
    <link rel="shortcut icon" href="../admin/images/logo-shop.jpg" />
    <link rel="stylesheet" href="../assets/css/toast.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>

<body>
    <!-- Toast Container -->
    <div id="toast"></div>

    <div class="back-to-home">
        <a href="../index.php" class="back-button">
            <ion-icon name="arrow-back-outline"></ion-icon>
            Quay lại trang chủ
        </a>
    </div>

    <section class="login-section">
        <div class="login-container">
            <div class="login-box">
                <div class="login-header">
                    <h2>Đăng nhập Admin</h2>
                    <p>Chào mừng đến với LaptopSale</p>
                </div>
                <form action="" method="POST" class="login-form">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-icon">
                                <ion-icon name="mail-outline"></ion-icon>
                            </span>
                            <input type="email" name="account_email" required placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-icon">
                                <ion-icon name="lock-closed-outline"></ion-icon>
                            </span>
                            <input type="password" name="account_password" required placeholder="Mật khẩu">
                        </div>
                    </div>
                    <div class="form-options">
                        <label class="remember-me">
                            <input type="checkbox" name="remember">
                            <span>Ghi nhớ đăng nhập</span>
                        </label>
                    </div>
                    <button type="submit" name="login" class="login-button">Đăng nhập</button>
                </form>
            </div>
        </div>
    </section>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f5f5;
        }

        .back-to-home {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1000;
        }

        .back-button {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 10px 20px;
            background: white;
            border-radius: 30px;
            color: #333;
            text-decoration: none;
            font-weight: 500;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .back-button:hover {
            background: #4A90E2;
            color: white;
            transform: translateY(-2px);
        }

        .back-button ion-icon {
            font-size: 20px;
        }

        .login-section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
        }

        .login-box {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h2 {
            color: #333;
            font-size: 28px;
            margin-bottom: 10px;
        }

        .login-header p {
            color: #666;
            font-size: 16px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .input-group {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-icon {
            position: absolute;
            left: 12px;
            color: #666;
            display: flex;
            align-items: center;
        }

        .input-group input {
            width: 100%;
            padding: 12px 40px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .input-group input:focus {
            border-color: #4A90E2;
            box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
            outline: none;
        }

        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #666;
        }

        .login-button {
            width: 100%;
            padding: 14px;
            background: #4A90E2;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .login-button:hover {
            background: #357ABD;
            transform: translateY(-2px);
        }

        @media (max-width: 480px) {
            .login-box {
                padding: 20px;
            }

            .login-header h2 {
                font-size: 24px;
            }

            .input-group input {
                padding: 10px 35px;
                font-size: 14px;
            }

            .back-button {
                padding: 8px 16px;
                font-size: 14px;
            }
        }
    </style>

    <script>
        // Toast function
        function toast({
            title = "",
            message = "",
            type = "info",
            duration = 3000
        }) {
            const main = document.getElementById("toast");
            if (main) {
                const toast = document.createElement("div");

                // Auto remove toast
                const autoRemoveId = setTimeout(function() {
                    main.removeChild(toast);
                }, duration + 1000);

                // Remove toast when clicked
                toast.onclick = function(e) {
                    if (e.target.closest(".toast__close")) {
                        main.removeChild(toast);
                        clearTimeout(autoRemoveId);
                    }
                };

                const icons = {
                    success: "checkmark-circle",
                    info: "information-circle",
                    warning: "warning",
                    error: "close-circle"
                };
                const icon = icons[type];
                const delay = (duration / 1000).toFixed(2);

                toast.classList.add("toast", `toast--${type}`);
                toast.innerHTML = `
                    <div class="toast__icon">
                        <ion-icon name="${icon}-outline"></ion-icon>
                    </div>
                    <div class="toast__body">
                        <h3 class="toast__title">${title}</h3>
                        <p class="toast__msg">${message}</p>
                    </div>
                    <div class="toast__close">
                        <ion-icon name="close"></ion-icon>
                    </div>
                `;
                main.appendChild(toast);
            }
        }

        function showErrorMessage() {
            toast({
                title: "Đăng nhập thất bại",
                message: "Email hoặc mật khẩu không chính xác. Vui lòng kiểm tra lại!",
                type: "error",
                duration: 5000
            });
        }

        function showSuccessMessage() {
            toast({
                title: "Đăng nhập thành công",
                message: "Đang chuyển hướng đến trang quản trị...",
                type: "success",
                duration: 3000
            });
        }

        // Show error message if login failed
        <?php if (isset($error) && $error) { ?>
            showErrorMessage();
        <?php } ?>
    </script>

</body>

</html>