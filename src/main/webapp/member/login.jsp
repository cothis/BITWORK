<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>BitWork - Login</title>
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/axios/0.21.1/dist/axios.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("login").addEventListener("click", function () {
                login(this);
            });

            document.getElementById("join").addEventListener("click", function () {
                location.href = "join";
            })

            document.querySelectorAll(".user-input").forEach(function (input) {
                input.addEventListener("keyup", function (event) {
                    if (event.keyCode === 13) {
                        login();
                    }
                });
            });
        });

        function login() {
            const user_id = document.querySelector("#user_id").value;
            const user_pw = document.querySelector("#user_pw").value;
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

    <style>
        .wrap {
            width: 600px;
            height: 350px;
            background-color: #143455;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            align-items: center;
            padding: 20px 20px;
            position: relative;
        }

        .wrap h1 {
            color: #FFFFFF;
            position: absolute;
            top: 20px;
        }

        .form-group {
            padding: 0 20px;
            width: 100%;
        }

        .form-group > input {
            width: 100%;
            padding: 20px 10px 20px 10px;
            border: none;
            border-radius: 5px;
            margin: 10px 0;
        }

        .form-buttons {
            align-self: flex-end;
            display: flex;
            justify-content: flex-end;
            padding: 0 20px;
            margin: 20px 0;
        }

        .form-buttons button {
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="category">Member</div>
        <div class="title">로그인</div>
    </header>

    <div class="wrap">
        <h1>로그인</h1>

        <div class="form-group">
            <label for="user_id">
                <span class="user-icon"></span>
            </label>
            <input type="text" name="user_id" id="user_id" placeholder="ID를 입력하세요" class="user-input">
        </div>
        <div class="form-group">
            <label for="user_pw">
                <span class="user-pw"></span>
            </label>
            <input type="text" name="user_pw" id="user_pw" placeholder="Password를 입력하세요" class="user-input">
        </div>
        <div class="form-buttons">
            <button type="submit" class="btn primary" id="login">
                로그인
            </button>
            <button type="button" class="btn green" id="join">
                회원가입
            </button>
        </div>
    </div>
</body>
</html>
