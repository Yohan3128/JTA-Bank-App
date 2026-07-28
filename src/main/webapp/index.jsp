<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>JTA Banking | Home</title>


        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">


        <!-- Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.css" rel="stylesheet">


        <style>
            body {

                min-height: 100vh;
                margin: 0;
                font-family: "Segoe UI", sans-serif;
                background: linear-gradient(135deg, #0d6efd, #6e9adb);

                display: flex;
                justify-content: center;
                align-items: center;

            }


            .home-card {

                width: 100%;
                max-width: 600px;
                background: white;
                border-radius: 25px;
                overflow: hidden;
                box-shadow: 0 20px 45px rgba(0, 0, 0, .25);

            }


            .header {

                background: #0d6efd;
                color: white;
                text-align: center;
                padding: 45px 30px;

            }


            .header i {

                font-size: 80px;

            }


            .header h1 {

                font-weight: bold;
                margin-top: 15px;
                letter-spacing: 1px;

            }


            .body {

                padding: 40px;

                text-align: center;

            }


            .description {

                color: #6c757d;
                font-size: 17px;
                margin-bottom: 35px;

            }


            .btn-login {

                height: 55px;
                border-radius: 12px;
                font-weight: 600;
                background: #0d6efd;
                border: none;

            }


            .btn-login:hover {

                background: #084298;

            }


            .btn-register {

                height: 55px;
                border-radius: 12px;
                font-weight: 600;

            }


            .feature {

                margin-top: 35px;
                padding-top: 25px;
                border-top: 1px solid #ddd;

            }


            .feature i {

                font-size: 35px;
                color: #0d6efd;

            }
        </style>


    </head>


    <body>


        <div class="home-card">


            <!-- Header -->


            <div class="header">


                <i class="bi bi-bank2"></i>


                <h1>
                    Welcome to JTA Bank
                </h1>


                <p class="mb-0">

                    Secure & Simple Digital Banking

                </p>


            </div>


            <!-- Body -->


            <div class="body">


                <p class="description">

                    Manage your accounts, transfer money,
                    and track your transactions securely
                    with JTA Banking.

                </p>


                <div class="d-grid gap-3">


                    <a href="login.jsp" class="btn btn-primary btn-login">


                        <i class="bi bi-box-arrow-in-right"></i>

                        Login


                    </a>


                    <a href="register.jsp" class="btn btn-outline-primary btn-register">


                        <i class="bi bi-person-plus-fill"></i>

                        Create New Account


                    </a>


                </div>


                <div class="row feature">


                    <div class="col-4">

                        <i class="bi bi-shield-lock-fill"></i>

                        <p class="small mt-2">

                            Secure

                        </p>

                    </div>


                    <div class="col-4">

                        <i class="bi bi-lightning-charge-fill"></i>

                        <p class="small mt-2">

                            Fast

                        </p>

                    </div>


                    <div class="col-4">

                        <i class="bi bi-clock-history"></i>

                        <p class="small mt-2">

                            24/7 Access

                        </p>

                    </div>


                </div>


            </div>


        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>


    </body>

    </html>