<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Sign List</title>
    <link href="/fontawesome/css/fontawesome.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/components/table.css">
    <link rel="stylesheet" href="/css/sign.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/axios/0.21.1/dist/axios.min.js"></script>
    <style>
        .wrap {
            display: flex;
            flex-direction: column;
            width: 1000px;
            align-items: center;
        }

        .sign-button {
            width: 100%;
            align-self: flex-start;
            display: flex;
            justify-content: flex-start;
            position: relative;
            margin: 10px 0 10px 0;
        }

        .sign-button .a {
            margin-right: 20px;
            text-decoration: none;
            color: white;
            background-color: #00add0;
            box-sizing: border-box;
            padding: 10px;
            border-radius: 5px;
        }

        .sign-button .a:hover {
            background-color: #ff9c00;
            transition-duration: 0.2s;
        }

        .sign-button .a:last-child {
            position: absolute;
            right: 0;
            margin: 0;
        }

    </style>
</head>
<body>
    <header class="header">
        <div class="category">Sign</div>
        <div class="title">결재 ${empty requestScope.docStatus ? "전체" : requestScope.docStatus}</div>
    </header>
    <div class="wrap">
        <div class="sign-button">
            <a class="a" href="list?nowPage=${requestScope.paging.nowPage}">결재전체
                <i class="far fa-envelope"></i>
            </a>
            <a class="a" href="list?nowPage=${requestScope.paging.nowPage}&docStatus=완료">완료문서
                <i class="far fa-envelope-open"></i>
            </a>
            <a class="a" href="list?nowPage=${requestScope.paging.nowPage}&docStatus=반려">반려문서
                <i class="fas fa-envelope-open"></i>
            </a>
            <a class="a" href="list?nowPage=${requestScope.paging.nowPage}&docStatus=대기">대기문서
                <i class="fas fa-envelope"></i>
            </a>
            <a class="a" href="detail?nowPage=${requestScope.paging.nowPage}&docStatus=${requestScope.docStatus}&type=write">결재상신
                <i class="fas fa-upload"></i>
            </a>
        </div>
        <table class="table">
            <thead class="thead">
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
                    <tr class="hover">
                        <td>${vo.docNo}</td>
                        <td>
                            <a href="detail?nowPage=${requestScope.paging.nowPage}&docStatus=${requestScope.docStatus}&docNo=${vo.docNo}">${vo.docTitle}</a>
                        </td>
                        <td>${vo.writerName}</td>
                        <td><fmt:formatDate value="${vo.insertDate}" pattern="yyyy.MM.dd"/></td>
                        <td><fmt:formatDate value="${vo.signDate}" pattern="yyyy.MM.dd"/></td>
                        <td>${vo.docStatus}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="pageNav" id="paging">
            <!-- requestScope에 있는 페이지 객체에서 꺼내서 쓸것임-->
            <c:if test="${requestScope.paging.startPage > 1}">
                <li><a href="list?docStatus=${requestScope.docStatus}&nowPage=${requestScope.paging.startPage - 1}"><i
                        class="fas fa-chevron-left"></i></a></li>
            </c:if>
            <c:if test="${requestScope.paging.startPage == 1}">
                <li><a><i class="fas fa-chevron-left"></i></a></li>
            </c:if>


            <c:forEach var="page" begin="${requestScope.paging.startPage}" end="${requestScope.paging.endPage}">
                <c:if test="${requestScope.paging.nowPage ne page}">
                    <li class="now"><a href="list?docStatus=${requestScope.docStatus}&nowPage=${page}">${page}</a></li>
                </c:if>
                <c:if test="${requestScope.paging.nowPage eq page}">
                    <li class="now"><a>${page}</a></li>
                </c:if>
            </c:forEach>

            <c:if test="${requestScope.paging.endPage < requestScope.paging.totalPage}">
                <li><a href="list?docStatus=${requestScope.docStatus}&nowPage=${requestScope.paging.endPage + 1}"><i
                        class="fas fa-chevron-right"></i></a></li>
            </c:if>
            <c:if test="${requestScope.paging.endPage == requestScope.paging.totalPage}">
                <li><a><i class="fas fa-chevron-right"></i></a></li>
            </c:if>
        </div>
    </div>

</body>
</html>

