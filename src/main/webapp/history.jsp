<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <%@ page contentType="text/html;charset=UTF-8" language="java" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>

                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>JTA Banking | Transaction History</title>


                <!-- Bootstrap -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">


                <!-- Icons -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.css"
                    rel="stylesheet">



                <style>
                    body {

                        background: #f4f8fc;
                        font-family: "Segoe UI", sans-serif;

                    }



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





                    .history-card {

                        border: none;
                        border-radius: 20px;
                        box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

                    }



                    .history-header {

                        background: #0d6efd;
                        color: white;
                        padding: 25px;
                        border-radius: 20px 20px 0 0;

                    }



                    .table {

                        margin-bottom: 0;

                    }



                    .table thead {

                        background: #0d6efd;
                        color: white;

                    }



                    .table th {

                        padding: 15px;

                    }



                    .table td {

                        vertical-align: middle;
                        padding: 15px;

                    }




                    .deposit {

                        color: #198754;
                        font-weight: bold;

                    }



                    .withdraw {

                        color: #dc3545;
                        font-weight: bold;

                    }




                    .balance {

                        font-weight: 600;
                        color: #0d6efd;

                    }



                    .empty-box {

                        text-align: center;
                        padding: 50px;

                    }
                </style>


            </head>


            <body>



                <!-- Navbar -->

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
                                    <a class="nav-link" href="deposit">
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
                                    <a class="nav-link" href="logout">

                                        <i class="bi bi-box-arrow-right"></i>
                                        Logout

                                    </a>
                                </li>


                            </ul>


                        </div>


                    </div>


                </nav>





                <div class="container py-5">



                    <div class="card history-card">


                        <div class="history-header">


                            <h2 class="mb-2">

                                <i class="bi bi-clock-history"></i>

                                Transaction History

                            </h2>



                            <p class="mb-0">

                                Account Number :
                                <strong>${requestScope.accountNo}</strong>

                            </p>


                        </div>





                        <div class="card-body p-0">



                            <c:choose>


                                <c:when test="${empty requestScope.transactions}">


                                    <div class="empty-box">


                                        <i class="bi bi-receipt text-primary" style="font-size:60px;"></i>



                                        <h4 class="mt-3">

                                            No Transactions Found

                                        </h4>



                                        <p class="text-muted">

                                            This account does not have any transaction history.

                                        </p>



                                    </div>



                                </c:when>



                                <c:otherwise>



                                    <div class="table-responsive">


                                        <table class="table table-hover">


                                            <thead>


                                                <tr>

                                                    <th>Date / Time</th>

                                                    <th>Type</th>

                                                    <th>Amount</th>

                                                    <th>Related Account</th>

                                                    <th>Balance After</th>

                                                </tr>


                                            </thead>



                                            <tbody>


                                                <c:forEach var="transaction" items="${requestScope.transactions}">


                                                    <tr>


                                                        <td>

                                                            <i class="bi bi-calendar-event"></i>

                                                            ${transaction.timestamp}

                                                        </td>



                                                        <td>


                                                            <c:choose>


                                                                <c:when test="${transaction.type == 'DEPOSIT'}">

                                                                    <span class="deposit">

                                                                        <i class="bi bi-arrow-down-circle-fill"></i>

                                                                        ${transaction.type}

                                                                    </span>

                                                                </c:when>



                                                                <c:otherwise>


                                                                    <span class="withdraw">

                                                                        <i class="bi bi-arrow-up-circle-fill"></i>

                                                                        ${transaction.type}

                                                                    </span>


                                                                </c:otherwise>


                                                            </c:choose>



                                                        </td>




                                                        <td>


                                                            <fmt:formatNumber value="${transaction.amount}"
                                                                type="number" minFractionDigits="2"
                                                                maxFractionDigits="2" groupingUsed="true" />


                                                        </td>





                                                        <td>


                                                            ${transaction.relatedAccountNo == null
                                                            ? "-"
                                                            : transaction.relatedAccountNo}



                                                        </td>





                                                        <td class="balance">


                                                            <fmt:formatNumber value="${transaction.balanceAfter}"
                                                                type="number" minFractionDigits="2"
                                                                maxFractionDigits="2" groupingUsed="true" />


                                                        </td>



                                                    </tr>


                                                </c:forEach>



                                            </tbody>



                                        </table>



                                    </div>



                                </c:otherwise>


                            </c:choose>



                        </div>


                    </div>



                    <div class="mt-4">

                        <a href="dashboard" class="btn btn-primary">

                            <i class="bi bi-arrow-left"></i>
                            Back to Dashboard

                        </a>

                    </div>



                </div>





                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>


            </body>

            </html>