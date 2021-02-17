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
	<link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/board.css">
    <script src="../webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../commons/nav.jsp"/>
    <jsp:include page="../commons/aside.jsp"/>
	<main>
	    
	    <h3>${bvo.subject }</h3>
	    <input type="submit" value="목록" onclick="location.href='list?cPage=${pvo.nowPage }'">
	    <p>${bvo.name } ${bvo.position}</p>
	    <p>조회수 ${bvo.hit}</p>
	    <p>${bvo.regdate}</p>
	    <hr>
	    <p>${bvo.content}</p>
	    <h4>첨부파일</h4>
	    <c:if test="${empty bvo.fileName }">
			첨부파일 없음
		</c:if>
		<c:if test="${not empty bvo.fileName }">
			<%-- 다운로드 링크 연결 --%>
			<a href="download?path=data/board&name=${bvo.fileName }&ori=${bvo.oriName }">${bvo.oriName }</a>
		</c:if>
		
		<tr>
			<td colspan="2" class="btn">
			<!-- 세션아이디랑 글쓴이랑 동일해야 수정/삭제 버튼 생성 -->
				<a href="update?b_idx=${bvo.boardIdx }&cPage=${pvo.nowPage}">수정</a>
				<input type="button" value="삭제" onclick="">
				<input type="hidden" name="cPage" value="${cPage }">
			</td>
		</tr>
		<hr>
		<%-- 게시글에 대한 댓글 작성 영역 --%>
		<form action="comments" method="post">
			<!-- 댓글쓰는사람 이름 -->
			<h5>${mvo.name } ${mvo.position }</h5>
			<textarea name="content" rows="4" cols="55"></textarea>
			<input type="submit" value="댓글입력">
			<input type="hidden" name="b_idx" value="${bvo.boardIdx }">
		</form>
		<hr>
		<p>comment</p>
		<hr>
		
		<%-- 게시글에 작성된 댓글 표시 영역 --%>
	<c:forEach var="cmtVO" items="${cvo }">
	<div class="comment"> 
		<form action="" method="post">
			<p>${cmtVO.name }  ${cmtVO.position }</p>
			<p>${cmtVO.cmtDate }</p>
			<p>${cmtVO.cmtContent }</p>
			<!------------------------------------- 세션 아이디랑 동일해야 버튼 생성 -->
			<input type="submit" value="댓글삭제">
			<input type="hidden" name="c_idx" value="${cmtVO.cmtIdx }">
			
			<%-- 댓글 삭제처리 후 게시글 상세페이지로 이동 시  --%>
			<input type="hidden" name="b_idx" value="${cmtVO.boardIdx }">
		</form>
	</div>
	<hr>
	</c:forEach>
	    
	</main>
</body>
</html>