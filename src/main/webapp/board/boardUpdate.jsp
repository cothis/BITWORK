<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/board.css">
    <script src="../webjars/jquery/3.5.1/jquery.min.js"></script>
    <style>
    input[type='file'] {
    	display: none;
    }
    </style>
<script>
	document.addEventListener("DOMContentLoaded", function () {
		document.getElementById("select_file").addEventListener("click", function () {
			document.getElementById("update_file").click();
		});
		
		document.getElementById("update_file").addEventListener("change", function () {
			let fileName = this.files[0].name;
			document.getElementById("fileName").innerText = fileName;
			document.querySelector("#removed").value = "false";
		});
		
		document.getElementById("remove_file").onclick = function () {
			document.getElementById("fileName").innerText = "첨부된 파일이 없습니다";
			document.getElementById("update_file").value = "";
			document.querySelector("#removed").value = "true";
		};		
				
		document.querySelector("#sendData").addEventListener("click", function () {
			let formData = new FormData(this.form);
			
			$.ajax({
				url: "update",
				processData: false,
				contentType: false,
				method: "post",
				data: formData,
				dataType: "json",
				success: function (result) {
					alert("수정되었습니다.");
					location.href = "content?b_idx=" + ${bvo.boardIdx } + "&cPage=" + ${cPage };
				},
				error: function () {
					alert("수정이 실패하였습니다.");
				}
			})
		});
	});

</script>  
</head>
<body>
    <main>
    	<h2>게시글 수정</h2>
	    <input type="button" value="목록" onclick="location.href='list?cPage=${cPage }'">
    	<hr>
	    <form enctype="multipart/form-data">
		    <input type="radio" name="update_option" value="1" ${bvo.status eq "1" ? "checked" : "" }>일반글
		    <input type="radio" name="update_option" value="0" ${bvo.status eq "0" ? "checked" : "" }>공지글
		    <table>
		    	<tr>
				    <th>제목</th>
				    <td>
				    	<input type="text" name="update_subject" id="update_subject" value="${bvo.subject }" pattern="">
				    </td>
			    </tr>
			    <tr>
				    <th>내용</th>
				    <td>
				    	<textarea name="update_content" id="update_content" cols="50" rows="10">${bvo.content }</textarea>
				    </td>
			    </tr>
			    <tr>
				    <th>첨부파일</th>
				    <td>
				    	<div id="fileName">${bvo.oriName }</div>
				    	<button type="button" id="remove_file">삭제</button>
				    	<button type="button" id="select_file">파일 선택</button>
				    	<input type="file" name="update_file" id="update_file">
				    	<input type="hidden" name="removed" id="removed">
				    </td>
			    </tr>
		    </table>
		    <input type="hidden" name="b_idx" value="${bvo.boardIdx }">
		    <input type="button" value="수정" id="sendData">
		</form>
    </main>
</body>
</html>