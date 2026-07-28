<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>JTA Banking | History</title>
</head>
<body>

<h1>History for ${requestScope.accountNo}</h1>

<table>
    <tr>
        <th>Date/Time</th>
        <th>Type</th>
        <th>Amount</th>
        <th>Related Account</th>
        <th>Balance After</th>
    </tr>

    <c:forEach var="transaction" items="${requestScope.transactions}">
        <tr>
            <td>${transaction.timestamp}</td>
            <td>${transaction.type}</td>
            <td>
                <fmt:formatNumber value="${transaction.amount}" type="number" minFractionDigits="2"
                                  maxFractionDigits="2" groupingUsed="true"/></td>
            <td>${transaction.relatedAccountNo eq null ? "-":transaction.relatedAccountNo}</td>
            <td><fmt:formatNumber value="${transaction.balanceAfter}" type="number" minFractionDigits="2"
                                  maxFractionDigits="2" groupingUsed="true"/></td>
        </tr>
    </c:forEach>

</table>

</body>
</html>