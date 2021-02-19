<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <h2>Main 페이지</h2>
    <a href="member/update">회원정보 수정</a>
    <a href="member/logout">로그아웃</a>
    <a href="member/leave">회원탈퇴</a>
    <a href="addressbook/list">주소록</a>
    <c:if test='${sessionScope.user.grade eq 4}'>
        <a href="company/manage">조직관리</a>
        <a href="company/users">사용자관리</a>
    </c:if>
</body>
</html>