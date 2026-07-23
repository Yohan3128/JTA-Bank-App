<%--
  Created by IntelliJ IDEA.
  User: Yohan Silva
  Date: 22/07/2026
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JTA Banking - Login</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        body{
            margin:0;
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            background:linear-gradient(135deg,#0d6efd, #618ecf, #a8b8d1);
            font-family:"Segoe UI",sans-serif;
        }

        .login-card{
            width:100%;
            max-width:420px;
            border:none;
            border-radius:20px;
            overflow:hidden;
            box-shadow:0 15px 40px rgba(0,0,0,.25);
        }

        .card-header{
            background:#0d6efd;
            color:#fff;
            text-align:center;
            padding:30px;
        }

        .card-header i{
            font-size:55px;
        }

        .card-body{
            padding:35px;
        }

        .input-group-text{
            background:#0d6efd;
            color:white;
            border:none;
        }

        .form-control{
            height:50px;
        }

        .btn-login{
            background:#0d6efd;
            border:none;
            height:50px;
            font-weight:bold;
            transition:.3s;
        }

        .btn-login:hover{
            background:#084298;
            transform:translateY(-2px);
        }

        a{
            text-decoration:none;
        }
    </style>
</head>
<body>

<div class="card login-card">

    <div class="card-header">
        <i class="bi bi-bank2"></i>
        <h2 class="mt-2">JTA BANKING</h2>
        <p class="mb-0">Secure Login</p>
    </div>

    <div class="card-body">

        <!-- Error Message -->
        <%
            if(request.getAttribute("error") != null){
        %>
        <div class="alert alert-danger">
            <i class="bi bi-exclamation-triangle-fill"></i>
            <%= request.getAttribute("error") %>
        </div>
        <%
            }
        %>

        <!-- Login Form -->
        <form action="login" method="post">

            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="bi bi-envelope-fill"></i>
                    </span>
                    <input
                            type="email"
                            class="form-control"
                            name="email"
                            placeholder="Enter your email"
                            required>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">Password</label>
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="bi bi-lock-fill"></i>
                    </span>
                    <input
                            type="password"
                            class="form-control"
                            name="password"
                            placeholder="Enter your password"
                            required>
                </div>
            </div>

            <div class="d-grid">
                <button class="btn btn-primary btn-login">
                    <i class="bi bi-box-arrow-in-right"></i>
                    Login
                </button>
            </div>

        </form>

        <hr>

        <div class="text-center">
            Don't have an account?
            <a href="register.jsp">
                <strong>Create Account</strong>
            </a>
        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>