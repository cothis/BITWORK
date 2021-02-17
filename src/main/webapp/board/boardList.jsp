<%@page import="com.bitwork.board.dao.BoardDAO"%>
<%@page import="com.bitwork.board.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>게시판리스트</title>
	<link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/board.css">
    <script src="../webjars/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../commons/nav.jsp"/>
    <jsp:include page="../commons/aside.jsp"/>
    <main>
	    <h2>게시판</h2>
	    <form action="list">
		    <select name="search_option">
		    	<option value="0" ${search.search_option eq "0" ? "selected" : "" }>전체</option>
		    	<option value="1" ${search.search_option eq "1" ? "selected" : "" }>제목</option>
		    	<option value="2" ${search.search_option eq "2" ? "selected" : "" }>작성자</option>
		    </select>
		    <input type="text" name="keyword" value="${search.keyword }">
		    <button type="submit">검색</button>
	    </form>
	    <table border>
		    <thead>
		    	<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					
				</tr>
			</thead>
			<tbody id="tbody"> 
			<c:forEach var="article" items="${list}">
				<tr>
					<td>${article.boardIdx}</td>
					<td><a href='content?b_idx=${article.boardIdx}&cPage=${pvo.nowPage}'>${article.subject}</a></td>
					<td>${article.name}</td>
					<td>${article.regdate}</td>
					<td>${article.hit}</td>
				</tr>
			</c:forEach>			
			
			</tbody>
			<tfoot id="tfoot">
				<tr>
					<td colspan="4">
						<ol class="paging">
						<%-- [이전으로]에 대한 사용여부 처리 시작페이지번호가 1 인 경우 비활성화 --%>	
							<c:choose>
								<c:when test="${pvo.beginPage == 1 }">
									<li class="disable">이전으로</li>
								</c:when>
								<c:otherwise>
									<li><a href="list?cPage=${pvo.beginPage - 1}&search_option=${search.search_option }&keyword=${search.keyword }">이전으로</a></li>
								</c:otherwise>	
							</c:choose>
							<%-- 블록내에 표시할 페이지 태그 작성(시작페이지 ~ 끝페이지) 현재페이지와 페이지 번호가 같으면 현재페이지 처리 --%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="now">${pageNo }</li>
								</c:if>
								<c:if test="${pageNo != pvo.nowPage }">
									<li>
										<a href="list?cPage=${pageNo }&search_option=${search.search_option }&keyword=${search.keyword }">${pageNo }</a>
									</li>
								</c:if>
							</c:forEach>
							<%-- [다음으로]에 대한 사용여부 처리 endPage가 전체페이지수(totalPage)보다 작은 경우 활성화 --%>
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li>
									<a href="list?cPage=${pvo.endPage + 1 }&search_option=${search.search_option }&keyword=${search.keyword }">다음으로</a>
								</li>
							</c:if>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">다음으로</li>
							</c:if>
						</ol>
					</td>
					<td>
						<a href="write">글쓰기</a>
						<!-- <input type="button" value="글쓰기" onclick="location.href='boardWrite.jsp'"> -->
					</td>
				</tr>
			</tfoot>
	    </table>
	 
	</main>
</body>
</html>