<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>BitWork - Login</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/axios/0.21.1/dist/axios.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("login").addEventListener("click", function () {
                login(this);
            });

            document.getElementById("join").addEventListener("click", function () {
                location.href = "join";
            })
        });

        function login(btn) {
            const user_id = btn.form.user_id.value;
            const user_pw = btn.form.user_pw.value;
            const options = {
                user_id: user_id,
                user_pw: user_pw
            };
            const params = new URLSearchParams(options);
            axios.post("login", params)
                .then(res => {
                    const data = res.data;
                    if (data) {
                        if (data.grade === 0) {
                            location.href = "noCompany";
                        } else if (data.grade === 1) {
                            location.href = "invite";
                        } else if (data.grade === 2) {
                            location.href = "waitCompany";
                        } else if (data.grade > 2) {
                            location.href = "../main";
                        }
                    } else {
                        alert("로그인 실패");
                    }
                })
                .catch(err => {
                    console.log(err);
                    alert("서버와 통신에 실패했습니다.");
                });
        }
    </script>
</head>
<body>
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
</body>
</html>
