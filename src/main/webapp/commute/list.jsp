<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>근태 기간별 조회</title>
    <link rel="stylesheet" href="/css/CommuteList.css">
    <link rel="stylesheet" href="/fontawesome/css/fontawesome.css">
    <script src="../webjars/jquery/3.5.1/jquery.min.js"></script>
    <style>
        ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        li {
            padding: 0 10px;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="category">Commute</div>
        <div class="title">근태 현황</div>
    </header>
    <div class="wrap">
    <div class="content-bg">
        <form class="search-wrap" action="list">
	        <div>
	            <input class="search-bar" type="date" id="startDay" name="startDay" value="${searchOption.start }">&nbsp부터
	        </div>
	        <div>
	            <input class="search-bar" type="date" id="endDay" name="endDay" value="${searchOption.end }">&nbsp까지
            </div>
            <button class="search-button" type="submit">
				<i class="fas fa-search"></i>
			</button>
        </form>
	        <table class="content-table">
	            <thead>
	                <tr>
	                    <th>근무일자</th>
	                    <th>출근시간</th>
	                    <th>퇴근시간</th>
	                    <th>근태구분</th>
	                </tr>
	            </thead>
	            <tbody id="tbody">
	                <c:forEach var="list" items="${list}">
	                    <tr>
	                        <td>${list.CDate}</td>
	                        <td>${list.onTime}</td>
	                        <td>${list.offTime}</td>
	                        <td id="status">${list.status}</td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
        </div>
        <ul class="paging">
            <li>
                <c:if test="${paging.nowBlock ne 1}">
                    <c:set var="prev" value="href='list?nowPage=${paging.startPage - 1}'"/>
                </c:if>
                <a ${prev}><i class="fas fa-chevron-left"></i></a>
            </li>
            <c:forEach var="page" begin="${paging.startPage}" end="${paging.endPage}">
                <li>
                    <a href="list?startDay=${searchOption.start}&endDay=${searchOption.end}&nowPage=${page}">${page}</a>
                </li>
            </c:forEach>
            <li>
                <c:if test="${paging.endPage ne paging.totalPage}">
                    <c:set var="next" value="href='list?nowPage=${paging.endPage + 1}'"/>
                </c:if>
                <a ${next}><i class="fas fa-chevron-right"></i></a>
            </li>
        </ul>

    </div>
</body>
</html>