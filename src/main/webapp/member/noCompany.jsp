<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - No Company</title>
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
    .form {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 300px;
        height: 200px;
        background-color: #143455;
    }
    .form a {
        color: white;
        text-decoration: none;
        text-align: center;
        margin: 10px;
    }
</style>
<body>
    <header class="header">
        <div class="category">Member</div>
        <div class="title">회사가 없습니다</div>
    </header>
    <div class="wrap">
        <div class="form">
            <a href="../member/joinCompany" class="btn primary">가입 신청</a>
            <a href="../company/makeCompany" class="btn primary">회사 생성</a>
        </div>
    </div>
</body>
</html>
