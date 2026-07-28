<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>JTA Banking | Withdraw</title>

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
                }

                .nav-link {
                    color: white !important;
                    margin-right: 10px;
                }

                .nav-link:hover {
                    color: #dbeafe !important;
                }

                /* Card */
                .card {
                    border: none;
                    border-radius: 18px;
                    box-shadow: 0 10px 25px rgba(0, 0, 0, .08);
                }

                .card-header {
                    background: #0d6efd;
                    color: white;
                    border-radius: 18px 18px 0 0 !important;
                    padding: 20px;
                }

                .form-control,
                .form-select {
                    height: 48px;
                    border-radius: 10px;
                }

                .btn-withdraw {
                    background: #0d6efd;
                    border: none;
                    height: 48px;
                    border-radius: 10px;
                    font-weight: 600;
                }

                .btn-withdraw:hover {
                    background: #084298;
                }
            </style>
        </head>

        <body>

            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container">

                    <a class="navbar-brand" href="dashboard">
                        <i class="bi bi-bank2"></i> JTA BANKING
                    </a>

                    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#menu">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="menu">

                        <ul class="navbar-nav ms-auto">

                            <li class="nav-item">
                                <a class="nav-link" href="dashboard">
                                    <i class="bi bi-speedometer2"></i> Dashboard
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="deposit">
                                    <i class="bi bi-plus-circle"></i> Deposit
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" href="withdraw">
                                    <i class="bi bi-dash-circle"></i> Withdraw
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="transfer">
                                    <i class="bi bi-arrow-left-right"></i> Transfer
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="create-account">
                                    <i class="bi bi-wallet2"></i> New Account
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link text-warning" href="logout">
                                    <i class="bi bi-box-arrow-right"></i> Logout
                                </a>
                            </li>

                        </ul>

                    </div>

                </div>
            </nav>

            <div class="container py-5">

                <div class="row justify-content-center">

                    <div class="col-lg-6">

                        <div class="card">

                            <div class="card-header">
                                <h3 class="mb-0">
                                    <i class="bi bi-cash-stack"></i>
                                    Withdraw Money
                                </h3>
                            </div>

                            <div class="card-body p-4">

                                <!-- Error Message -->
                                <% if(request.getAttribute("error") !=null){ %>

                                    <div class="alert alert-danger d-flex align-items-center mb-4">

                                        <i class="bi bi-exclamation-triangle-fill fs-4 me-3"></i>

                                        <div>
                                            <%= request.getAttribute("error") %>
                                        </div>

                                    </div>

                                    <% } %>

                                        <form action="withdraw" method="post">

                                            <div class="mb-3">
                                                <label class="form-label">
                                                    Account Number
                                                </label>

                                                <select class="form-select" name="accountNo" required>

                                                    <option value="" selected disabled>
                                                        Select Account
                                                    </option>

                                                    <c:forEach var="account" items="${requestScope.accounts}">

                                                        <option value="${account.accNo}">
                                                            ${account.accNo}
                                                        </option>

                                                    </c:forEach>

                                                </select>
                                            </div>

                                            <div class="mb-4">

                                                <label class="form-label">
                                                    Withdrawal Amount
                                                </label>

                                                <div class="input-group">

                                                    <span class="input-group-text">
                                                        <i class="bi bi-currency-dollar"></i>
                                                    </span>

                                                    <input type="number" class="form-control" name="amount" step="0.01"
                                                        min="0.01" placeholder="Enter amount" required>

                                                </div>

                                            </div>

                                            <div class="d-grid">

                                                <button class="btn btn-primary btn-withdraw">

                                                    <i class="bi bi-cash"></i>
                                                    Withdraw Money

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