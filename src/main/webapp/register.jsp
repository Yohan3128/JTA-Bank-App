<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JTA Banking - Register</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" rel="stylesheet">

        <style>
            body {
                background: linear-gradient(135deg, #0d6efd, #5482c6, #9eb4d4);
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                font-family: "Segoe UI", sans-serif;
            }

            .register-card {
                width: 100%;
                max-width: 450px;
                border: none;
                border-radius: 20px;
                overflow: hidden;
                box-shadow: 0 15px 35px rgba(0, 0, 0, .25);
            }

            .card-header {
                background: #0d6efd;
                color: white;
                text-align: center;
                padding: 30px;
            }

            .card-header i {
                font-size: 55px;
                margin-bottom: 10px;
            }

            .card-body {
                padding: 35px;
            }

            .form-control {
                height: 50px;
                border-radius: 12px;
            }

            .input-group-text {
                background: #0d6efd;
                color: white;
                border: none;
                border-radius: 12px 0 0 12px;
            }

            .btn-register {
                background: #0d6efd;
                border: none;
                height: 50px;
                border-radius: 12px;
                font-weight: bold;
                transition: .3s;
            }

            .btn-register:hover {
                background: #084298;
                transform: translateY(-2px);
            }

            .login-link {
                text-decoration: none;
                font-weight: 600;
                color: #0d6efd;
            }

            .login-link:hover {
                color: #084298;
            }

            .bank-title {
                font-weight: bold;
                letter-spacing: 1px;
            }

            .small-text {
                color: #6c757d;
            }
        </style>
    </head>

    <body>

        <div class="card register-card">

            <div class="card-header">
                <i class="bi bi-bank2"></i>
                <h2 class="bank-title">JTA BANKING</h2>
                <p class="mb-0">Create Your New Account</p>
            </div>
            <% if (request.getAttribute("error") !=null) { %>
                <div class="alert alert-danger alert-dismissible fade show shadow-sm rounded-3 d-flex align-items-center m-4"
                    role="alert">
                    <i class="bi bi-exclamation-triangle-fill fs-4 me-2"></i>
                    <div class="flex-grow-1">
                        <strong>Registration Failed!</strong><br>
                        <%= request.getAttribute("error") %>
                    </div>
                </div>
                <% } %>

                    <div class="card-body">

                        <form action="register" method="post">

                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-person-fill"></i>
                                    </span>
                                    <input type="text" class="form-control" id="name" name="name"
                                        placeholder="Enter your full name" required>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-envelope-fill"></i>
                                    </span>
                                    <input type="email" class="form-control" id="email" name="email"
                                        placeholder="example@gmail.com" required>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-lock-fill"></i>
                                    </span>
                                    <input type="password" class="form-control" id="password" name="password"
                                        placeholder="Create a strong password" required>
                                </div>
                            </div>

                            <div class="d-grid">
                                <button class="btn btn-primary btn-register">
                                    <i class="bi bi-person-plus-fill"></i>
                                    Create Account
                                </button>
                            </div>

                        </form>

                        <hr>

                        <div class="text-center">
                            <span class="small-text">Already have an account?</span>
                            <a href="login.jsp" class="login-link">
                                Login Here
                            </a>
                        </div>

                    </div>

        </div>

    </body>

    </html>