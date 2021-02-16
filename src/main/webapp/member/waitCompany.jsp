<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Wait</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelector("#cancel").addEventListener("click", function () {
                $.ajax({
                    url: "cancelJoinCompany",
                    method: "get",
                    dataType: "json"
                }).then(function (res) {
                    if (res) {
                        location.href = "noCompany";
                    } else {
                        alert("신청 취소에 실패했습니다");
                    }
                });
            });
        });
    </script>
</head>
<body>
    <jsp:include page="../commons/nav.jsp"/>
    <jsp:include page="../commons/aside.jsp"/>
    <div id="container">
        <div>${requestScope.company.companyName}</div>
        <h2>가입 승인 대기중입니다</h2>
        <button type="button" id="cancel">신청 취소</button>
    </div>
</body>
</html>
