<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Wait</title>
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/components/button.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelector("#cancel").addEventListener("click", function () {
                $.ajax({
                    url: "/member/cancelJoinCompany",
                    method: "get",
                    dataType: "json"
                }).then(function (res) {
                    if (res) {
                        location.href = "/member/noCompany";
                    } else {
                        alert("신청 취소에 실패했습니다");
                    }
                });
            });
        });
    </script>
    <style>
        .wrap {
            display: flex;
            flex-direction: column;
        }

        .wrap div {
            margin-top: 10px;
        }

    </style>
</head>
<body>
    <header class="header">
        <div class="category">Member</div>
        <div class="title">가입 대기</div>
    </header>
    <div class="wrap">
        <div>${requestScope.company.companyName}</div>
        <div>
            <h2>가입 승인 대기중입니다</h2>
        </div>
        <div>
            <button class="btn" type="button" id="cancel">신청 취소</button>
        </div>
    </div>
</body>
</html>
