<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String dd = request.getRealPath("data/board");
System.out.println("realPath : " + dd);
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="commons/nav.jspf"/>
    <jsp:include page="commons/aside.jspf"/>
    <a href="hello-servlet">Hello Servlet</a>
</body>
</html>