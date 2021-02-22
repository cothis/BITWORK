<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - MakeCompany</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/company.js"></script>
    <style>
        .red-important {
            border: 1px solid red !important;
            outline: none;
        }
    </style>
</head>
<body>
    <form action="">
        <div class="form-group">
            <label for="companyName"></label>
            <input type="text" name="companyName" id="companyName" placeholder="회사명"
                   pattern="[a-zA-Zㄱ-힣0-9]{2,}" title="이름 입력 형식 : 한글 또는 영어, 숫자 2글자 이상" required>
            <button type="button" id="checkDuplicate">중복확인</button>
        </div>
        <div>
            <label for="phone"></label>
            <input type="text" name="phone" id="phone" placeholder="전화번호"
                   pattern="[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}" title="전화번호 입력 형식 : 010-1234-5678" required>
        </div>
        <div>
            <label for="email"></label>
            <input type="text" name="email" id="email" placeholder="이메일(abc@abc.com)"
                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}" title="이메일 입력 형식 : abc@abc.com" required>
        </div>
        <div class="form-buttons">
            <button type="button" id="cancel">취소</button>
            <button type="button" id="makeCompany" disabled>회사 생성</button>
        </div>
    </form>
</body>
</html>
