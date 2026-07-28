<%-- Created by IntelliJ IDEA. User: Yohan Silva Date: 22/07/2026 Time: 14:29 To change this template use File |
    Settings | File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>JTA Banking - Error</title>

            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

            <!-- Bootstrap Icons -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css"
                rel="stylesheet">

            <style>
                body {
                    margin: 0;
                    min-height: 100vh;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    background: linear-gradient(135deg, #0d6efd, #5f8aca, #a6bad8);
                    font-family: "Segoe UI", sans-serif;
                }

                .error-card {
                    width: 100%;
                    max-width: 600px;
                    background: #fff;
                    border-radius: 20px;
                    overflow: hidden;
                    box-shadow: 0 15px 40px rgba(0, 0, 0, .25);
                }

                .card-header {
                    background: #0d6efd;
                    color: #fff;
                    text-align: center;
                    padding: 35px;
                }

                .card-header i {
                    font-size: 70px;
                    margin-bottom: 10px;
                }

                .card-body {
                    padding: 35px;
                    text-align: center;
                }

                .error-message {
                    background: #b94c3e;
                    border-left: 5px solid #ad0f0f;
                    color: #034366;
                    border-radius: 10px;
                    padding: 15px;
                    margin: 25px 0;
                    word-break: break-word;
                }

                .btn-home {
                    background: #0d6efd;
                    border: none;
                    padding: 12px 30px;
                    font-weight: 600;
                    border-radius: 10px;
                    transition: .3s;
                }

                .btn-home:hover {
                    background: #084298;
                    transform: translateY(-2px);
                }

                h2 {
                    font-weight: bold;
                }

                p {
                    color: #6c757d;
                }
            </style>
        </head>

        <body>

            <div class="error-card">

                <div class="card-header">
                    <i class="bi bi-exclamation-octagon-fill"></i>
                    <h2>Oops! Something Went Wrong</h2>
                </div>

                <div class="card-body">

                    <p>
                        We couldn't process your request. Please try again or return to the home page.
                    </p>

                    <div class="error-message">
                        <strong>Error Details</strong><br><br>
                        <%= exception !=null ? exception.getMessage()
                            : "An unexpected error occurred. Please contact the system administrator if the problem persists."
                            %>
                    </div>

                    <button class="btn btn-primary btn-home" onclick="window.location='index.jsp'">
                        <i class="bi bi-house-door-fill"></i>
                        Return to Home
                    </button>

                </div>

            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

        </body>

        </html>