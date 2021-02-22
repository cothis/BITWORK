<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Insert Form</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/axios/0.21.1/dist/axios.min.js"></script>
    <script>
        function cancelAddr() {
            location.href = "list";
        }
    </script>
</head>
<body>
    <h1>주소록 추가</h1>
    <hr>
    <form action="modify" method="post">
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="name" id="name" value="${requestScope.vo.name}">
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="text" name="email" id="email" value="${requestScope.vo.email}">
        </div>
        <div class="form-group">
            <label for="company">회사</label>
            <input type="text" name="company" id="company" value="${requestScope.vo.company}">
        </div>
        <div class="form-group">
            <label for="phone">전화번호</label>
            <input type="text" name="phone" id="phone" value="${requestScope.vo.phone}">
        </div>
        <div class="form-buttons">
            <input type="hidden" name="idx" value="${requestScope.vo.addressbookIdx}">
            <button type="submit">추가</button>
            <button type="button" onclick="cancelAddr()">취소</button>
        </div>
    </form>
</body>
</html>
