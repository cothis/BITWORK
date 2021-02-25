<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>BitWork - Join</title>
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/member.css">
    <link rel="stylesheet" href="/css/components/search.css">
    <link rel="stylesheet" href="/css/components/button.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/js/member.js"></script>
</head>
<body>
    <header class="header">
        <div class="category">Member</div>
        <div class="title">회원가입</div>
    </header>

    <div class="wrap">
        <form id="file_form" action="/member/join" method="post"
              enctype="multipart/form-data">
            <div class="input-form">
                <div class="picture-form">
                    <div class="picture-img">
                        <img src="/profile-picture/default.png" alt="프로필사진" width="250px" height="250px" id="user_image">
                    </div>
                    <div class="image-form">
                        <input type="file" name="user_picture" id="user_picture" accept="image/jpeg, image/png">
                        <button id="uploadPicture" type="button" class="btn">사진 등록</button>
                    </div>
                </div>
                <div class="text-form">
                    <div class="form-group">
                        <label for="user_id"></label>
                        <input type="text" name="user_id" id="user_id" placeholder="ID" class="search-bar"
                               pattern="[A-Za-z0-9]{4,12}" title="아이디 입력 형식 : 영어 숫자 4~12 글자" required>
                        <button type="button" id="checkDuplicate" class="btn small">중복확인</button>
                    </div>
                    <div class="form-group">
                        <label for="user_pw"></label>
                        <input type="password" name="user_pw" id="user_pw" placeholder="PASSWORD" class="search-bar"
                               pattern="[A-Za-z0-9]{4,12}" title="비밀번호 입력 형식 : 영어 숫자 4~12 글자" required>
                    </div>
                    <div class="form-group">
                        <label for="user_name"></label>
                        <input type="text" name="user_name" id="user_name" placeholder="이름" class="search-bar"
                               pattern="[a-zA-Zㄱ-힣]{2,}" title="이름 입력 형식 : 한글 또는 영어 2글자 이상" required>
                    </div>
                    <div class="form-group">
                        <label for="user_phone"></label>
                        <input type="text" name="user_phone" id="user_phone" placeholder="전화번호" class="search-bar"
                               pattern="[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}" title="전화번호 입력 형식 : 010-1234-5678" required>
                    </div>
                    <div class="form-group">
                        <label for="user_email"></label>
                        <input type="text" name="user_email" id="user_email" placeholder="이메일(abc@abc.com)" class="search-bar"
                               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}" title="이메일 입력 형식 : abc@abc.com" required>
                    </div>
                    <div class="form-group">
                        <label for="user_position"></label>
                        <input type="text" name="user_position" id="user_position" placeholder="직급" value="사원"
                               class="search-bar" required>
                    </div>
                </div>
            </div>
            <div class="form-buttons">
                <button type="button" id="cancel" class="btn">취소</button>
                <button type="button" id="join" disabled class="btn disable">가입 신청</button>
            </div>
        </form>
    </div>
</body>
</html>
