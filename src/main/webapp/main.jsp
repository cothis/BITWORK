<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="commons/nav.jsp"/>
    <jsp:include page="commons/aside.jsp"/>
    <h2>Main 페이지</h2>
    <a href="member/update">회원정보 수정</a>
</body>
</html>