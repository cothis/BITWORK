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
    <link rel="stylesheet" href="/fontawesome/css/fontawesome.css">
    <script src="../webjars/jquery/3.5.1/jquery.min.js"></script>
	<style>
		.content-image {
			max-width: 100%;
		}
	</style>
<script>

	document.addEventListener("DOMContentLoaded", function() {
		document.querySelectorAll(".remove-cmt").forEach(function(el) {
			el.addEventListener("click", function() {
				var isDelete = confirm("정말 삭제하시겠습니까?");
				if (isDelete) {
					//location.href = "delete?b_idx=" + ${bvo.boardIdx};
					this.form.submit();
				}
			});
		});
	});
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
	    	<div class="btn-wrap">
			<!-- 글쓴이 아이디랑 세션 아이디 동일해야 버튼 생성 -->
			<c:if test="${user.id == bvo.memberId}">
				<input class="update-btn" type="button" value="수정" onclick="location.href='update?b_idx=${bvo.boardIdx }&cPage=${pvo.nowPage}'">
				<input class="delete-btn" type="button" value="삭제" onclick="deleteGo()">
				<input type="hidden" name="cPage" value="${cPage }">
			</c:if>
			</div>
	    	<h4 class="name">${bvo.name } ${bvo.position}</h4>
	   		<div class="hit-date">
	    	<p>조회수</p>
		    <h4 class="hit">${bvo.hit}</h4>
		    <p>${bvo.regdate}</p>
	    </div>
	    <hr>
	    	<pre class="content"><c:out value="${bvo.content}"/></pre>
	    	<c:if test="${isImage }">
	    		<img src="/data/board/${bvo.fileName }" class="content-image">
	   		</c:if>
		    <div class="file-wrap">
			    <h4 class="file"><i class="far fa-file-alt"></i></h4>
			    <c:if test="${empty bvo.fileName }">
					첨부파일 없음
				</c:if>
				<c:if test="${not empty bvo.fileName }">
					<%-- 다운로드 링크 연결 --%>
					<a href="download?path=data/board&name=${bvo.fileName }&ori=${bvo.oriName }">${bvo.oriName }</a>
				</c:if>
			</div>
		</div>
		<input class="list-btn" type="submit" value="목록" onclick="location.href='list?cPage=${pvo.nowPage }'">
		<%-- 게시글에 대한 댓글 작성 영역 --%>
		<div class="cmt-wrap">
		<form class="comment" action="comments" method="post">
			<!-- 댓글쓰는사람 이름 -->
			<h4><i class="fas fa-user"></i> ${user.name } ${user.position }</h4>
			<textarea name="content" rows="4" cols="55" required></textarea>
			<input class="cmt-btn" type="submit" value="댓글입력">
			<input type="hidden" name="b_idx" value="${bvo.boardIdx }">
		</form>
		
		<p>이 글에 달린 댓글 <b>[${cmtCount}]</b></p>
		<hr>
		
		<%-- 게시글에 작성된 댓글 표시 영역 --%>
	<c:forEach var="cmtVO" items="${cvo }">
	<div class="comment"> 
		<form action="delete" method="post">
			<h4><i class="fas fa-user"></i> ${cmtVO.name }  ${cmtVO.position }</h4>
			<p class="cmt-date">${cmtVO.cmtDate }</p>
			<p class="cmt-text">${cmtVO.cmtContent }</p>
						
			<c:if test="${(user.id == cmtVO.memberId) || (user.id == bvo.memberId)}">
				<button class="remove-cmt" type="button" id="remove-cmt"><i class="fas fa-times"></i></button>
				<input type="hidden" name="c_idx" value="${cmtVO.cmtIdx }">
				<!-- 댓글 삭제처리 후 게시글 상세페이지로 이동 시  -->
				<input type="hidden" name="b_idx" value="${cmtVO.boardIdx }">
				<input type="hidden" name="cPage" value="${cPage }">
			</c:if>
		</form>
	</div>
	<hr>
	</c:forEach>
	</div>
	</div>
	</div>  
</body>
</html>