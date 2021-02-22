<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>BitWork - Leave</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="css/member.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(function () {
            document.querySelector("#leave").addEventListener("click", function () {
                let pw = this.form.pw.value;
                $.ajax("leave", {
                    method: "post",
                    data: {
                        pw : pw
                    },
                    dataType: "json",
                    success: function (res) {
                        if (res) {
                            alert("다음에 또 뵈요..");
                            location.href = "login.jsp";
                        } else {
                            alert("비밀번호가 틀렸습니다");
                        }
                    }
                });
            });

            document.querySelector("#cancel").addEventListener("click", function () {
                history.back();
            });
        });
    </script>
</head>
<body>
    <form>
        <div class="form-group">
            <label for="pw">비밀번호 확인</label>
            <input type="text" name="pw" id="pw" required>
        </div>
        <button type="button" id="leave">탈퇴</button>
        <button type="button" id="cancel">취소</button>
    </form>
</body>
</html>
