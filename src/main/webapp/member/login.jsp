<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>BitWork - Login</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script>
        let testData;
        $(function () {
            $("#login").click(function () {
                let formData = $("form").serialize();
                $.ajax({
                    url: "login",
                    method: "post",
                    data: formData,
                    dataType: "json",
                    success: function (res) {
                        if (res) {
                            alert("login 성공");
                            if (res.grade === 0) {
                                alert("가입된 회사 없음");
                                location.href = "noCompany";
                            } else if (res.grade === 1) {
                                alert("가입 대기중");
                                location.href = "waitCompany";
                            } else if (res.grade > 1) {
                                alert("직원 또는 사장");
                                location.href = "../main";
                            }
                        } else {
                            alert("로그인 실패");
                        }
                    },
                    error: function () {
                        alert("서버와 통신에 실패했습니다.");
                    }
                });
            });

            $("#join").click(function () {
                location.href = "join";
            });
        });
    </script>
</head>
<body>
    <jsp:include page="../commons/nav.jsp"/>
    <main>
        <form action="">
            <div class="form-group">
                <label for="user_id">
                    <span class="user-icon"></span>
                </label>
                <input type="text" name="user_id" id="user_id" placeholder="ID를 입력하세요">
            </div>
            <div class="form-group">
                <label for="user_pw">
                    <span class="user-pw"></span>
                </label>
                <input type="text" name="user_pw" id="user_pw" placeholder="Password를 입력하세요">
            </div>
            <div class="form-buttons">
                <button type="button" id="login">
                    로그인
                </button>
                <button type="button" id="join">
                    회원가입
                </button>
            </div>
        </form>
    </main>
</body>
</html>
