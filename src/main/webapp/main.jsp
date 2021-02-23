<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/fontawesome/css/fontawesome.css">
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
    .wrap {
        display: flex;
        flex-direction: column;
        width: 1000px;
        height: 80%;
        margin-top: auto;
        margin-bottom: auto;
    }

    .row {
        width: 100%;
        flex-basis: 50%;
        display: flex;
    }

    .section {
        display: flex;
        flex-direction: column;
        padding: 10px;
        margin-bottom: 10px;
        background-color: #FFFFFF;
        border-radius: 10px;
    }

    .notice {
        width: 100%;
        flex-basis: 100%;
    }

    .sign {
        flex-basis: 30%;
        margin-right: 10px;
    }

    .board {
        flex-basis: 70%;
    }

    .sub-title {
        display: flex;
        font-weight: bold;
        font-size: 20px;
        border-bottom: 2px solid #999696;
        padding-bottom: 5px;
    }

    .sub-title i {
        line-height: inherit;
        margin-right: 5px;
    }

    .into-page-btn {
        margin-left: auto;
        color: #FFFFFF;
        text-decoration: none;
        background-color: #39485D;
        font-size: 20px;
        width: 30px;
        height: 30px;
        line-height: 30px;
        border-radius: 5px;
        text-align: center;
    }

    .into-page-btn:hover {
        background-color: #00add0;
        transition-duration: 0.1s;
    }

</style>
<body>
    <header class="header">
        <div class="category">Main</div>
        <div class="title">메인페이지</div>
    </header>

    <div class="wrap">
        <div class="row">
            <section class="notice section">
                <div class="sub-title">
                    <i class="fas fa-microphone"></i>
                    <span class="sub-title-text">사내공지</span>
                    <a href="" class="into-page-btn">+</a>
                </div>
            </section>
        </div>

        <div class="row">
            <section class="sign section">
                <div class="sub-title">
                    <i class="fas fa-file-alt"></i>
                    <span class="sub-title-text">전자결재</span>
                    <a href="" class="into-page-btn">+</a>
                </div>
            </section>

            <section class="board section">
                <div class="sub-title">
                    <i class="fas fa-file-alt"></i>
                    <span class="sub-title-text">게시판</span>
                    <a href="" class="into-page-btn">+</a>
                </div>
            </section>
        </div>
    </div>
</body>
</html>