<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>

            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <title>JTA Banking | Deposit</title>


            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">


            <!-- Bootstrap Icons -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.css" rel="stylesheet">


            <style>
                body {
                    background: #f4f8fc;
                    font-family: "Segoe UI", sans-serif;
                }


                /* Navbar */

                .navbar {

                    background: linear-gradient(90deg, #0d6efd, #084298);
                    box-shadow: 0 3px 10px rgba(0, 0, 0, .15);

                }


                .navbar-brand {

                    font-weight: bold;
                    letter-spacing: 1px;

                }


                .nav-link {

                    color: white !important;
                    margin-right: 10px;

                }


                .nav-link:hover {

                    color: #dbeafe !important;

                }



                /* Deposit Card */

                .deposit-card {

                    border: none;
                    border-radius: 20px;
                    box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                }



                .card-header {

                    background: #0d6efd;
                    color: white;
                    padding: 25px;
                    border-radius: 20px 20px 0 0 !important;

                }



                .form-select,
                .form-control {

                    height: 50px;
                    border-radius: 12px;

                }



                .input-group-text {

                    background: #0d6efd;
                    color: white;
                    border: none;

                }




                .btn-deposit {

                    height: 50px;
                    border-radius: 12px;
                    background: #0d6efd;
                    border: none;
                    font-weight: 600;

                }



                .btn-deposit:hover {

                    background: #084298;

                }



                .deposit-icon {

                    font-size: 60px;
                    color: #0d6efd;

                }
            </style>

        </head>


        <body>



            <!-- Navigation -->

            <nav class="navbar navbar-expand-lg navbar-dark">

                <div class="container">


                    <a class="navbar-brand" href="dashboard">

                        <i class="bi bi-bank2"></i>
                        JTA BANKING

                    </a>



                    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#menu">

                        <span class="navbar-toggler-icon"></span>

                    </button>




                    <div class="collapse navbar-collapse" id="menu">


                        <ul class="navbar-nav ms-auto">


                            <li class="nav-item">
                                <a class="nav-link" href="dashboard">

                                    <i class="bi bi-speedometer2"></i>
                                    Dashboard

                                </a>
                            </li>



                            <li class="nav-item">
                                <a class="nav-link active" href="deposit">

                                    <i class="bi bi-plus-circle"></i>
                                    Deposit

                                </a>
                            </li>



                            <li class="nav-item">
                                <a class="nav-link" href="withdraw">

                                    <i class="bi bi-dash-circle"></i>
                                    Withdraw

                                </a>
                            </li>



                            <li class="nav-item">
                                <a class="nav-link" href="transfer">

                                    <i class="bi bi-arrow-left-right"></i>
                                    Transfer

                                </a>
                            </li>



                            <li class="nav-item">
                                <a class="nav-link" href="create-account">

                                    <i class="bi bi-wallet2"></i>
                                    New Account

                                </a>
                            </li>



                            <li class="nav-item">
                                <a class="nav-link text-warning" href="logout">

                                    <i class="bi bi-box-arrow-right"></i>
                                    Logout

                                </a>
                            </li>


                        </ul>


                    </div>


                </div>

            </nav>






            <div class="container py-5">


                <div class="row justify-content-center">


                    <div class="col-lg-6">


                        <div class="card deposit-card">



                            <div class="card-header text-center">


                                <i class="bi bi-cash-coin deposit-icon text-white"></i>


                                <h2 class="mt-3 mb-0">

                                    Deposit Money

                                </h2>


                                <p class="mb-0">

                                    Add money to your bank account

                                </p>


                            </div>




                            <div class="card-body p-4">


                                <!-- Error Message -->

                                <% if(request.getAttribute("error") !=null){ %>


                                    <div class="alert alert-danger d-flex align-items-center">

                                        <i class="bi bi-exclamation-triangle-fill fs-4 me-3"></i>


                                        <div>

                                            <%= request.getAttribute("error") %>

                                        </div>


                                    </div>


                                    <% } %>





                                        <form action="deposit" method="post">


                                            <!-- Account Number -->

                                            <div class="mb-4">


                                                <label class="form-label">

                                                    Account Number

                                                </label>



                                                <div class="input-group">


                                                    <span class="input-group-text">

                                                        <i class="bi bi-credit-card"></i>

                                                    </span>



                                                    <select class="form-select" name="accountNo" required>


                                                        <option value="" disabled selected>

                                                            Select Account

                                                        </option>



                                                        <c:forEach var="account" items="${requestScope.accounts}">


                                                            <option value="${account.accNo}">

                                                                ${account.accNo}

                                                            </option>


                                                        </c:forEach>


                                                    </select>


                                                </div>


                                            </div>





                                            <!-- Amount -->


                                            <div class="mb-4">


                                                <label class="form-label">

                                                    Deposit Amount

                                                </label>




                                                <div class="input-group">


                                                    <span class="input-group-text">

                                                        <i class="bi bi-currency-dollar"></i>

                                                    </span>




                                                    <input type="number" class="form-control" name="amount" step="0.01"
                                                        min="0.01" placeholder="Enter deposit amount" required>


                                                </div>


                                            </div>





                                            <div class="d-grid">


                                                <button class="btn btn-primary btn-deposit">


                                                    <i class="bi bi-plus-circle-fill"></i>

                                                    Deposit Money


                                                </button>


                                            </div>



                                        </form>



                            </div>


                        </div>


                    </div>


                </div>


            </div>





            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>


        </body>

        </html>