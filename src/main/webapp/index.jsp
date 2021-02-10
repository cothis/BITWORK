<%@ page import="com.bitwork.common.DBService" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bitwork.member.vo.MemberVO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    SqlSession sqlSession = DBService.getFactory().openSession();
    List<MemberVO> vos = sqlSession.selectList("member.all");
    System.out.println(vos);

%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <h1><%= "Hello World!" %>
    </h1>
    <br/>
    <a href="hello-servlet">Hello Servlet</a>
</body>
</html>