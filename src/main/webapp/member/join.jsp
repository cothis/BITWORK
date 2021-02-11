<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>BitWork - Join</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script>

        let testData;

        function sendJoin() {
            let fileForm = $("#file_form")[0];
            let formData = new FormData(fileForm);
            testData = formData;
            for (let data of formData) {
                console.log(data);
            }
        }

        function callInputFile() {
            $("#user_picture")[0].click();
        }

        $(function () {
            $("#user_picture").change(function () {
                let file = this.files[0];
                testData = file;

                $("img")[0].setAttribute("src", testData.name);
            })
        })

    </script>
    <style>
        #user_picture {
            display: none;
        }
    </style>
</head>
<body>
    <jsp:include page="../commons/nav.jsp"/>
    <main>
        <form id="file_form" action="member/join" method="post" enctype="multipart/form-data">
            <div class="picture-form">
                <div class="picture-img">
                    <img src="" alt="프로필사진">
                </div>
                <div>
                    <input type="file" name="user_picture" id="user_picture">
                    <button id="uploadPicture" type="button" onclick="callInputFile()">사진 등록</button>
                </div>
            </div>
            <div class="form-group">
                <label for="user_id"></label>
                <input type="text" name="user_id" id="user_id">
                <button type="button" id="checkDuplicate">중복확인</button>
            </div>
            <div class="form-group">
                <label for="user_pw"></label>
                <input type="text" name="user_pw" id="user_pw">
            </div>
            <div class="form-group">
                <label for="user_name"></label>
                <input type="text" name="user_name" id="user_name">
            </div>
            <div class="form-group">
                <label for="user_phone"></label>
                <input type="text" name="user_phone" id="user_phone">
            </div>
            <div class="form-group">
                <label for="user_email"></label>
                <input type="text" name="user_email" id="user_email">
            </div>
            <div class="form-group">
                <label for="user_position"></label>
                <input type="text" name="user_position" id="user_position">
            </div>
            <div class="form-buttons">
                <button type="button" name="cancel" id="cancel">취소</button>
                <button type="button" name="join" id="join" onclick="sendJoin()">가입 신청</button>
            </div>
        </form>
    </main>
</body>
</html>
