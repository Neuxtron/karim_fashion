<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #002147, #002147); /* Warna disesuaikan dengan logo */
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
        }
        .login-box {
            max-width: 400px;
            width: 100%;
            border: none;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            padding: 30px;
        }
        .login-box .form-control {
            height: 45px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .login-box .btn-primary {
            background-color: #002147;
            border-color: #002147;
            border-radius: 5px;
        }
        .login-box .btn-primary:hover {
            background-color: #0f5bbf;
            border-color: #0f5bbf;
        }
        .login-box h2 {
            color: #002147;
            margin-bottom: 30px;
        }
        .login-box img {
            display: block;
            margin: 0 auto 20px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <img src="./assets/images/DALL·E-2024-03-25-21.49.png" alt="Logo" width="80" style="border-radius: 50%; object-fit: cover;"> <!-- Ganti dengan logo Anda -->
            <h2 class="text-center">Admin Login</h2>
            <form action="authenticate.php" method="post">
                <div class="form-group">
                    <label for="username">Email</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
