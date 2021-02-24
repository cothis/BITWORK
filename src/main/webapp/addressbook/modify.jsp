<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Insert Form</title>
    <link rel="stylesheet" href="/css/button.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/axios/0.21.1/dist/axios.min.js"></script>
    <style>
		.wrap {
			padding : 5px;
			margin-top : 40px;
			background-color: #FFFFFF;
			width: 1000px;
			height: 600px;
			text-align: center;
			border: none;
		}
		
		.form-group {
			position: relative;
			top: 47px;
			padding: 20px;
			font-size: 30px;
		}
		
		.form-buttons {
			position: relative;
			top: 55px;
			padding: 10px;
			font-size: 25px;
			
		}
    </style>
    <script>
        function cancelAddr() {
            location.href = "list";
        }
    </script>
</head>
<body>
    <header class="header">
        <div class="category">AddressBook</div>
        <div class="title">주소록 ${empty vo ? "추가" : "변경"}</div>
    </header>
    <div class="wrap">
    <form action="modify" method="post">
        <div class="form-group">
            <label for="name">&nbsp;&nbsp;이름 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" name="name" id="name" value="${requestScope.vo.name }">
        </div>
        <div class="form-group">
            <label for="email">&nbsp;&nbsp;이메일 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" name="email" id="email" value="${requestScope.vo.email}">
        </div>
        <div class="form-group">
            <label for="company">&nbsp;&nbsp;회사 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" name="company" id="company" value="${requestScope.vo.company}">
        </div>
        <div class="form-group">
            <label for="phone">&nbsp;&nbsp;전화번호 :&nbsp;&nbsp;&nbsp;</label>
            <input type="text" name="phone" id="phone" value="${requestScope.vo.phone}">
        </div>
        <div class="form-buttons">
            <input type="hidden" name="idx" value="${requestScope.vo.addressbookIdx}">
            <a id="add" class="btn" type="submit">${empty vo ? "추가" : "변경"}</a>
            <a id="cancel" class="btn" type="button" onclick="cancelAddr()">취소</a>
        </div>
    </form>
    </div>
</body>
</html>
