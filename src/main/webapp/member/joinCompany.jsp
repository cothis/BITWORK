<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Join Company</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // 변수 선언
            let searchCompany = document.querySelector("#searchCompany");
            let joinCompany = document.querySelector("#joinCompany");
            let companyName = document.querySelector("#companyName");

            // 회사명 변경 -> 가입신청(비활성화), 검색(활성화)
            document.querySelector("#companyName").addEventListener("change", function () {
                searchCompany.removeAttribute("disabled");
                joinCompany.setAttribute("disabled", "true");
            });

            // 검색 클릭 시, 회사명 검색
            searchCompany.addEventListener("click", function () {
                $.ajax({
                    url: "api",
                    data: {
                        command: "searchCompany",
                        companyName: companyName.value
                    },
                    dataType: "json"
                }).then(function (res) {
                    console.log(res);
                });
            });

        });
    </script>
</head>
<body>
    <jsp:include page="../commons/nav.jsp"/>
    <jsp:include page="../commons/aside.jsp"/>
    <form action="joinCompany" method="post">
        <div class="form-group">
            <label for="companyName"></label>
            <input type="text" name="companyName" id="companyName" placeholder="회사명" required>
            <button type="button" id="searchCompany">검색</button>
        </div>
        <div class="form-buttons">
            <button type="submit" id="joinCompany" disabled>가입 신청</button>
        </div>
    </form>
</body>
</html>
