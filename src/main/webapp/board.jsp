<%@page import="com.bitwork.board.dao.BoardDAO"%>
<%@page import="com.bitwork.board.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	PagingVO pvo = (PagingVO)session.getAttribute("pvo");
%>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>게시판리스트</title>
	<link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/board.css">
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){        
	    getBoardList();
	});
	
	$
	
	function getBoardList(){
		/* alert("getBoardList() 실행"); */
		$.ajax("boardList", {
			type : "get",
			dataType : "json",
			success : function(data){
				console.log(data);
				/* alert("Ajax 처리 성공!!! data : " + data); */
				var tbody = "";
				var boardList = data.list;
				$.each(boardList, function(index, list) {
					tbody += "<tr>";
					tbody += "<td>"+ this.boardIdx + "</td>";
					tbody += "<td><a href='boardRead.jsp?boardIdx=" + this.boardIdx + "'>"+ this.subject + "</a></td>";
					tbody += "<td>"+ this.name + "</td>";
					tbody += "<td>"+ this.regdate + "</td>";
					tbody += "<td>"+ this.hit + "</td>";
					tbody += "</tr>";
				});
				
				$("#tbody").html(tbody);
			},
			error : function(jqXHR, textStatus, errorThrown ){
				alert("[예외발생] Ajax 처리실패!!! \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown: " + errorThrown);
			}
			
		});
	}
	
	
</script>
</head>
<body>
	<jsp:include page="commons/nav.jsp"/>
    <jsp:include page="commons/aside.jsp"/>
    <main>
	    <h2>게시판</h2>
	    <select>
	    	<option value selected="selected">전체</option>
	    	<option value="1">제목</option>
	    	<option value="2">작성자</option>
	    </select>
	    <input type="text">
	    <a href=# onclick="">검색</a>
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
									<li><a href="board.jsp?cPage=${pvo.beginPage - 1}">이전으로</a></li>
								</c:otherwise>	
							</c:choose>
							<%-- 블록내에 표시할 페이지 태그 작성(시작페이지 ~ 끝페이지) 현재페이지와 페이지 번호가 같으면 현재페이지 처리 --%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="now">${pageNo }</li>
								</c:if>
								<c:if test="${pageNo != pvo.nowPage }">
									<li>
										<a href="board.jsp?cPage=${pageNo }">${pageNo }</a>
									</li>
								</c:if>
							</c:forEach>
							<%-- [다음으로]에 대한 사용여부 처리 endPage가 전체페이지수(totalPage)보다 작은 경우 활성화 --%>
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li>
									<a href="board.jsp?cPage=${pvo.endPage + 1 }">다음으로</a>
								</li>
							</c:if>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">다음으로</li>
							</c:if>
						</ol>
					</td>
					<td>
						<input type="button" value="글쓰기" onclick="javascript:location.href='boardWrite.jsp'">
					</td>
				</tr>
			</tfoot>
	    </table>
	 
	</main>
</body>
</html>