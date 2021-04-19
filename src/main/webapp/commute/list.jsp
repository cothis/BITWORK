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
	            <span>from</span>
	            <input class="search-bar" type="date" id="startDay" name="startDay" value="${searchOption.start }">
	        </div>
	        <div>
	            <span>to</span>
	            <input class="search-bar" type="date" id="endDay" name="endDay" value="${searchOption.end }">
            </div>
            <button class="search-button" type="submit">
				<i class="fas fa-search"></i>
			</button>
        </form>
	        <table class="content-table">
	            <thead class="table-head">
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
	                        <td  ${list.status eq "지각" ? "class='red'" : "class='blue'"}>${list.status}</td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
        </div>
        <ul class="paging">
        	<c:choose>
				<c:when test="${paging.nowBlock eq 1 }">
					<li class="disable"><i class="fas fa-chevron-left"></i></li>
				</c:when>
				<c:otherwise>
            		<li>
                		<c:if test="${paging.nowBlock ne 1}">
                    		<c:set var="prev" value="href='list?nowPage=${paging.startPage - 1}'"/>
                			</c:if>
               		 	<a ${prev}><i class="fas fa-chevron-left"></i></a>
            		</li>
            	</c:otherwise>
			</c:choose>
        	<c:forEach var="page" begin="${paging.startPage}" end="${paging.endPage}">
	        	<li>
	            	<a href="list?startDay=${searchOption.start}&endDay=${searchOption.end}&nowPage=${page}"
	                       ${page eq paging.nowPage ? "class='now'" : "class='other'"}>${page}</a>
	            </li>
        	</c:forEach>
        	<c:choose>
				<c:when test="${paging.endPage >= paging.totalPage }">
					<li class="disable"><i class="fas fa-chevron-right"></i></li>
				</c:when>
				<c:otherwise>
            <li>
                <c:if test="${paging.endPage ne paging.totalPage}">
                    <c:set var="next" value="href='list?nowPage=${paging.endPage + 1}'"/>
                </c:if>
                <a ${next}><i class="fas fa-chevron-right"></i></a>
            </li>
            	</c:otherwise>
			</c:choose>
        </ul>

    </div>
</body>
</html>