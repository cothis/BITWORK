<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Sign Write</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/axios/0.21.1/dist/axios.min.js"></script>
</head>
<body>
    <h2>상신 폼</h2>
    <div>
        <span>결재 서류(상신)</span>
        <span>작성 일자 : ${requestScope.date}</span>
        <form action="write" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="subject">제목</label>
                <input type="text" name="subject" id="subject">
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea type="text" name="content" id="content"></textarea>
            </div>
            <div class="form-group">
                <label for="writer">기안자</label>
                <input type="text" name="writer" id="writer" value="${sessionScope.user.name}" readonly>
            </div>
            <div class="form-group">
                <label for="file">첨부파일</label>
                <input type="file" name="file" id="file">
            </div>
            <div class="form-buttons">
                <button type="submit">상신</button>
                <button type="button" onclick="history.back()">목록</button>
            </div>
        </form>
    </div>
</body>
</html>
