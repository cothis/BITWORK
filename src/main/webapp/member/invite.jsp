<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Invite</title>
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/member.css">
    <link rel="stylesheet" href="/css/makeCompany.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/axios/0.21.1/dist/axios.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            axios.get("api?command=inviteCompanyName")
                .then(response => {
                    const span = document.querySelector("#companyName");
                    span.textContent = response.data.companyName + "회사에서 초대가 왔습니다";
                });

            document.querySelector("#accept").addEventListener("click", function () {
                sendDecide(true);
            });

            document.querySelector("#refuse").addEventListener("click", function () {
                sendDecide(false);
            });

            function sendDecide(decide) {
                const data = {
                    isApply: decide
                }
                axios.post("updateGrade", data)
                    .then(response => {
                        console.log(response);
                        if (response.data) {
                            if (decide) {
                                alert("환영합니다");
                                location.replace("/main");
                            } else {
                                alert("거절했습니다.");
                                location.replace("/member/noCompany");
                            }
                        }
                    });
            }
        });
    </script>
    <style>
    .wrap {
    	margin-top: 120px;
    }
    </style>
</head>
<body>
    <header class="header">
        <div class="category">Company</div>
        <div class="title">가입 승인</div>
    </header>
    <div class="wrap">
        <div>
        	<img src="/img/invite.JPG">
            <h3 id="companyName"></h3>
        </div>
        <div class="form-buttons">
	        <button class="button1" type="button" id="refuse">거절</button>
	        <button class="button2" type="button" id="accept">승인</button>
        </div>
    </div>
</body>
</html>
