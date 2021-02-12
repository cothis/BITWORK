<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>BitWork - Join</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="css/join.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/join.js"></script>
</head>
<body>
    <jsp:include page="../commons/nav.jsp"/>
    <main>
        <form id="file_form" action="${pageContext.request.contextPath}/member/join" method="post" enctype="multipart/form-data">
            <div class="input-form">
                <div class="picture-form">
                    <div class="picture-img">
                        <img src="" alt="프로필사진" width="250px" height="250px">
                    </div>
                    <div>
                        <input type="file" name="user_picture" id="user_picture" accept="image/jpeg, image/png">
                        <button id="uploadPicture" type="button" onclick="callInputFile()">사진 등록</button>
                    </div>
                </div>
                <div class="text-form">
                    <div class="form-group">
                        <label for="user_id"></label>
                        <input type="text" name="user_id" id="user_id" placeholder="ID">
                        <button type="button" id="checkDuplicate">중복확인</button>
                    </div>
                    <div class="form-group">
                        <label for="user_pw"></label>
                        <input type="text" name="user_pw" id="user_pw" placeholder="PASSWORD">
                    </div>
                    <div class="form-group">
                        <label for="user_name"></label>
                        <input type="text" name="user_name" id="user_name" placeholder="이름">
                    </div>
                    <div class="form-group">
                        <label for="user_phone"></label>
                        <input type="text" name="user_phone" id="user_phone" placeholder="전화번호">
                    </div>
                    <div class="form-group">
                        <label for="user_email"></label>
                        <input type="text" name="user_email" id="user_email" placeholder="이메일">
                    </div>
                    <div class="form-group">
                        <label for="user_position"></label>
                        <input type="text" name="user_position" id="user_position" placeholder="직급" value="사원">
                    </div>
                </div>
            </div>
            <div class="form-buttons">
                <button type="button" name="cancel" id="cancel">취소</button>
                <button type="button" name="join" id="join" disabled>가입 신청</button>
            </div>
        </form>
    </main>
</body>
</html>
