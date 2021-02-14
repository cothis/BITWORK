<%@page import="com.bitwork.board.dao.BoardDAO"%>
<%@page import="com.bitwork.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String b_idx = request.getParameter("boardIdx");
	System.out.println("b_idx : " + b_idx);

	BoardVO bvo = BoardDAO.selectOne(b_idx);	
	System.out.println("bvo : " + bvo);
	
	session.setAttribute("bvo", bvo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>게시글 상세</title>
	<link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/board.css">
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="commons/nav.jsp"/>
    <jsp:include page="commons/aside.jsp"/>
	<main>
	    
	    <h3>${bvo.subject }</h3>
	    <input type="button" value="목록" onclick="javascript:location.href='board.jsp'">
	    <p>${bvo.name } ${bvo.position }</p>
	    <p>조회수 ${bvo.hit }</p>
	    <p>${bvo.regdate }</p>
	    <hr>
	    <p>${bvo.content }</p>
	    
	</main>
</body>
</html>