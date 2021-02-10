<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>board</title>
	<link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/board.css">
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
<script>

	$(function() {
		
	})
	
	
</script>
</head>
<body>
	<jsp:include page="commons/nav.jsp"/>
    <jsp:include page="commons/aside.jsp"/>
    <main>
	    <h2>게시판</h2>
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
			<tbody>
			
			
			</tbody>
	    </table>
	</main>
</body>
</html>