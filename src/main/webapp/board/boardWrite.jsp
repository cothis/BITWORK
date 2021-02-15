<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/board.css">
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../commons/nav.jsp"/>
    <jsp:include page="../commons/aside.jsp"/>
    <main>
	    <h2>게시글 작성</h2>
	    <input type="button" value="목록" onclick="javascript:location.href='board.jsp'">
	    <hr>
	    <table>
	    	<tr>
			    <th>제목</th>
			    <td>
			    	<input type="text" id="write_subject">
			    </td>
		    </tr>
		    <tr>
			    <th>내용</th>
			    <td>
			    	<input type="text" id="write_content">
			    </td>
		    </tr>
		    <tr>
			    <th>첨부파일</th>
			    <td>
			    	<input type="file" id="write_file">
			    </td>
		    </tr>
	    </table>
	    <input type="button" value="등록">
	</main>
</body>
</html>