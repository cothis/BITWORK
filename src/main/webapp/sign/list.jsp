<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Sign List</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/axios/0.21.1/dist/axios.min.js"></script>
    <style>
        table {
            border-collapse: collapse;
            width: 800px;
            background-color: #FFFFFF;
        }

        thead {
            background-color: #EAEAEA;
        }

        tr {
            border: 1px solid #CCCCCC;
            border-left: none;
            border-right: none;
        }

        td {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="nav-buttons">
        <a href="list?nowPage=${requestScope.paging.nowPage}">결재전체</a>
        <a href="list?nowPage=${requestScope.paging.nowPage}&docStatus=완료">완료문서</a>
        <a href="list?nowPage=${requestScope.paging.nowPage}&docStatus=반려">반려문서</a>
        <a href="list?nowPage=${requestScope.paging.nowPage}&docStatus=대기">대기문서</a>
        <a href="write?nowPage=${requestScope.paging.nowPage}&docStatus=${requestScope.docStatus}">결재상신</a>
    </div>
    <h1>결재 ${empty requestScope.docStatus ? "전체" : requestScope.docStatus}</h1>
    <hr>
    <table>
        <thead>
            <tr>
                <th>서류번호</th>
                <th>제목</th>
                <th>기안자</th>
                <th>기안일</th>
                <th>결재일</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <!-- requestScope에 있는 리스트 객체에서 꺼내서 쓸것임-->
            <c:forEach var="vo" items="${requestScope.list}">
                <tr>
                    <td>${vo.docNo}</td>
                    <td>${vo.docTitle}</td>
                    <td>${vo.writerName}</td>
                    <td>${vo.insertDate}</td>
                    <td>${vo.signDate}</td>
                    <td>${vo.docStatus}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="pageNav">
        <!-- requestScope에 있는 페이지 객체에서 꺼내서 쓸것임-->
    <c:if test="${requestScope.paging.startPage > 1}">
        <a href="list?docStatus=${requestScope.docStatus}&nowPage=${requestScope.paging.startPage - 1}">이전으로</a>
    </c:if>
    <c:if test="${requestScope.paging.startPage == 1}">
        <a>이전으로</a>
    </c:if>


    <c:forEach var="page" begin="${requestScope.paging.startPage}" end="${requestScope.paging.endPage}">
    <c:if test="${requestScope.paging.nowPage ne page}">
        <a href="list?docStatus=${requestScope.docStatus}&nowPage=${page}">${page}</a>
    </c:if>
    <c:if test="${requestScope.paging.nowPage eq page}">
        <a>${page}</a>
    </c:if>
    </c:forEach>

    <c:if test="${requestScope.paging.endPage < requestScope.paging.totalPage}">
        <a href="list?docStatus=${requestScope.docStatus}&nowPage=${requestScope.paging.endPage + 1}">다음으로</a>
    </c:if>
    <c:if test="${requestScope.paging.endPage == requestScope.paging.totalPage}">
        <a>다음으로</a>
    </c:if>
    </div>
</body>
</html>
