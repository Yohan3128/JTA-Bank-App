<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hnys.bank.entity.Account" %><%--
  Created by IntelliJ IDEA.
  User: Yohan Silva
  Date: 23/07/2026
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JTA Bank | Dashboard</title>
</head>
<body>
<nav>
    <a href="dashboard">Dashboard</a>
    <a href="deposit">Deposit</a>
    <a href="withdraw">Withdraw</a>
    <a href="transfer">Transfer</a>
    <a href="create-account">New Account</a>
    <a href="logout">Logout</a>
</nav>

<div>
    <h1>Deposit</h1>
    <%
        if (request.getAttribute("error") != null) {
    %>
    <div class="alert alert-danger alert-dismissible fade show shadow-sm rounded-3 d-flex align-items-center m-4" role="alert">
        <i class="bi bi-exclamation-triangle-fill fs-4 me-2"></i>
        <div class="flex-grow-1">
            <%= request.getAttribute("error") %>
        </div>
    </div>
    <%
        }
    %>

    <form action="deposit" method="post">
        <table>
            <tr>
                <th>Account No</th>
                <td>
                    <select name="accountNo" required>
                        <option value="" disabled>Select Account</option>
                        <c:forEach var="account" items="${requestScope.accouts}">
                            <option value="${account.accNo}">${account.accNo}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Amount</th>
                <td>
                    <input type="number" step="0.01" min="0.01" name="amount" required>
                </td>
            </tr> <tr>
                <th></th>
                <td>
                    <input type="submit" value="Deposit">
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
