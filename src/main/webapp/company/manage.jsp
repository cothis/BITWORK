<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Manage</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>직급</th>
                <th>이름</th>
                <th>입사일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="employee" items="${requestScope.employees}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${employee.position}</td>
                <td>${employee.name}</td>
                <td>${employee.joindate}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
