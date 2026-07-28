<%@ page import="java.util.List" %>
    <%@ page import="com.hnys.bank.entity.Account" %>

        <%@ page contentType="text/html;charset=UTF-8" language="java" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>

                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>JTA Bank | Dashboard</title>

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


                    /* Welcome */

                    .welcome-card {

                        background: linear-gradient(135deg, #0d6efd, #084298);
                        color: white;
                        border-radius: 20px;
                        padding: 35px;
                        box-shadow: 0 10px 25px rgba(0, 0, 0, .15);

                    }



                    /* Account Card */

                    .account-card {

                        border: none;
                        border-radius: 18px;
                        box-shadow: 0 8px 20px rgba(0, 0, 0, .08);
                        transition: .3s;

                    }


                    .account-card:hover {

                        transform: translateY(-5px);
                        box-shadow: 0 12px 25px rgba(0, 0, 0, .15);

                    }


                    .account-header {

                        background: #0d6efd;
                        color: white;
                        padding: 20px;
                        border-radius: 18px 18px 0 0;

                    }


                    .balance {

                        font-size: 28px;
                        font-weight: bold;
                        color: #0d6efd;

                    }


                    .account-number {

                        font-size: 18px;
                        font-weight: 600;

                    }


                    .history-btn {

                        border-radius: 10px;
                        font-weight: 600;

                    }


                    .empty-card {

                        background: white;
                        border-radius: 20px;
                        padding: 40px;
                        text-align: center;
                        box-shadow: 0 10px 25px rgba(0, 0, 0, .08);

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
                                    <a class="nav-link active" href="dashboard">
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



                    <!-- Welcome -->

                    <div class="welcome-card mb-5">


                        <h1>
                            Welcome, ${sessionScope.userName}
                            <i class="bi bi-hand-thumbs-up"></i>
                        </h1>


                        <p class="mb-0">
                            Manage your accounts, transactions and banking activities securely.
                        </p>


                    </div>





                    <h2 class="mb-4">

                        <i class="bi bi-wallet-fill text-primary"></i>
                        Your Accounts

                    </h2>





                    <% List<Account> accounts =
                        (List<Account>) request.getAttribute("accounts");


                            if(accounts == null || accounts.isEmpty()){

                            %>



                            <div class="empty-card">


                                <i class="bi bi-wallet2 text-primary" style="font-size:60px;"></i>


                                <h3 class="mt-3">
                                    No Accounts Found
                                </h3>


                                <p class="text-muted">
                                    You don't have any bank accounts yet.
                                </p>



                                <a href="create-account" class="btn btn-primary">

                                    <i class="bi bi-plus-circle"></i>
                                    Create New Account

                                </a>


                            </div>




                            <% }else{ %>



                                <div class="row g-4">


                                    <% for(Account account : accounts){ %>


                                        <div class="col-lg-4 col-md-6">


                                            <div class="card account-card">


                                                <div class="account-header">


                                                    <h5 class="mb-0">

                                                        <i class="bi bi-credit-card"></i>

                                                        Account

                                                    </h5>


                                                </div>



                                                <div class="card-body">


                                                    <div class="account-number mb-2">

                                                        <%= account.getAccNo()%>

                                                    </div>



                                                    <span class="badge bg-primary mb-3">

                                                        <%= account.getAccountType()%>

                                                    </span>



                                                    <h6 class="text-muted">
                                                        Available Balance
                                                    </h6>



                                                    <div class="balance mb-4">

                                                        LKR <%= account.getBalance()%>

                                                    </div>




                                                    <a href="history?accountNo=<%=account.getAccNo()%>"
                                                        class="btn btn-outline-primary w-100 history-btn">


                                                        <i class="bi bi-clock-history"></i>

                                                        Transaction History


                                                    </a>



                                                </div>


                                            </div>


                                        </div>



                                        <% } %>


                                </div>



                                <% } %>



                </div>





                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>


            </body>

            </html>