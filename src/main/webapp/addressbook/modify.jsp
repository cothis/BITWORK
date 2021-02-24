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
            padding: 10px;
            margin-top: 40px;
            background-color: #FFFFFF;
            width: 1000px;
            text-align: center;
            border: none;
        }

        .form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            padding: 20px;
            font-size: 30px;
            display: flex;
        }

        .form-group label {
            flex-basis: 20%;
            text-align: left;
        }

        .form-group input {
            flex-basis: 60%;
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
        <form action="modify" method="post" class="form">
            <div class="form-group">
                <label for="name">이름 :</label>
                <input type="text" name="name" id="name" value="${requestScope.vo.name }">
            </div>
            <div class="form-group">
                <label for="email">이메일 :</label>
                <input type="text" name="email" id="email" value="${requestScope.vo.email}">
            </div>
            <div class="form-group">
                <label for="company">회사 : </label>
                <input type="text" name="company" id="company" value="${requestScope.vo.company}">
            </div>
            <div class="form-group">
                <label for="phone">전화번호 : </label>
                <input type="text" name="phone" id="phone" value="${requestScope.vo.phone}">
            </div>
            <div class="form-buttons">
                <input type="hidden" name="idx" value="${requestScope.vo.addressbookIdx}">
                <button id="add" class="btn" type="submit">${empty vo ? "추가" : "변경"}</button>
                <button id="cancel" class="btn" type="button" onclick="cancelAddr()">취소</button>
            </div>
        </form>
    </div>
</body>
</html>
