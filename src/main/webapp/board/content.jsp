<%@page import="com.bitwork.board.dao.BoardDAO"%>
<%@page import="com.bitwork.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>게시글 상세</title>
	<link rel="stylesheet" href="/css/boardContent.css">
    <script src="../webjars/jquery/3.5.1/jquery.min.js"></script>
<script>
	function deleteGo() {
		var isDelete = confirm("정말 삭제하시겠습니까?");
		if (isDelete) {
			location.href = "delete?b_idx=" + ${bvo.boardIdx };
		}
	}

</script>    
</head>
<body>
	<div class="white-bg">
		<div class="header">
			<p class="category">Board</p>
			<h2 class="title">사내게시판</h2>
		
	</div>
	<div class="wrap">
	<div class="content-bg">
	    <h3 class="subject">${bvo.subject }</h3>
	    <input class="list-btn" type="submit" value="목록" onclick="location.href='list?cPage=${pvo.nowPage }'">
	    <p>${bvo.name } ${bvo.position}</p>
	    <p>조회수 ${bvo.hit}</p>
	    <p>${bvo.regdate}</p>
	    <hr>
	    <p>
	    	<pre><c:out value="${bvo.content}"/></pre>
	      
	    <c:if test="${isImage }">
	    	<img src="../data/board/${bvo.fileName }">
	    </c:if>
	    <h4>첨부파일</h4>
	    <c:if test="${empty bvo.fileName }">
			첨부파일 없음
		</c:if>
		<c:if test="${not empty bvo.fileName }">
			<%-- 다운로드 링크 연결 --%>
			<a href="download?path=data/board&name=${bvo.fileName }&ori=${bvo.oriName }">${bvo.oriName }</a>
		</c:if>
		</div>
		<div>
			<div class="btn-wrap">
			<!-- 글쓴이 아이디랑 세션 아이디 동일해야 버튼 생성 -->
			<c:if test="${user.id == bvo.memberId}">
				<input class="update-btn" type="button" value="수정" onclick="location.href='update?b_idx=${bvo.boardIdx }&cPage=${pvo.nowPage}'">
				<input class="delete-btn" type="button" value="삭제" onclick="deleteGo()">
				<input type="hidden" name="cPage" value="${cPage }">
			</c:if>
			</div>
		</div>
		<hr>
		<%-- 게시글에 대한 댓글 작성 영역 --%>
		<form action="comments" method="post">
			<!-- 댓글쓰는사람 이름 -->
			<h5>${user.name } ${user.position }</h5>
			<textarea name="content" rows="4" cols="55" required></textarea>
			<input type="submit" value="댓글입력">
			<input type="hidden" name="b_idx" value="${bvo.boardIdx }">
		</form>
		<hr>
		<p>comment</p>
		<hr>
		
		<%-- 게시글에 작성된 댓글 표시 영역 --%>
	<c:forEach var="cmtVO" items="${cvo }">
	<div class="comment"> 
		<form action="delete" method="post">
			<p>${cmtVO.name }  ${cmtVO.position }</p>
			<p>${cmtVO.cmtDate }</p>
			<p>${cmtVO.cmtContent }</p>
						
			<c:if test="${(user.id == cmtVO.memberId) || (user.id == bvo.memberId)}">
				<input type="submit" value="댓글삭제">
				<input type="hidden" name="c_idx" value="${cmtVO.cmtIdx }">
				<%-- 댓글 삭제처리 후 게시글 상세페이지로 이동 시  --%>
				<input type="hidden" name="b_idx" value="${cmtVO.boardIdx }">
				<input type="hidden" name="cPage" value="${cPage }">
			</c:if>
		</form>
	</div>
	<hr>
	</c:forEach>
	</div>
	</div>  
</body>
</html>