<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Invite</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="css/member.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/axios/0.21.1/dist/axios.min.js"></script>
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
                        if(response.data) {
                            if (decide) {
                                alert("환영합니다");
                                location.replace("../main");
                            } else {
                                alert("거절했습니다.");
                                location.replace("noCompany");
                            }
                        }
                    });
            }
        });
    </script>
</head>
<body>
    <div id="container">
        <div>
            <span id="companyName"></span>
        </div>
        <button type="button" id="accept">승인</button>
        <button type="button" id="refuse">거절</button>
    </div>
</body>
</html>
