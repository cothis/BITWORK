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
<script>
	
	$(function(){
		$("#sendData").on("click", function () {
			/* let requiredList = this.form.querySelectorAll("[required]");
			for (let item of requiredList) {
				if (item.value == null || item.value.trim().length === 0){
					alert(item.name + "에 값을 입력해주세요");
					return;
				}
			} */
			
			if (!this.form.checkValidity()) {
				this.form.reportValidity();
				return;
			}
			
			let formData = new FormData(this.form);
			
			$.ajax({
				url: "write",
				processData: false,
				contentType: false,
				method: "post",
				data: formData,
				dataType: "json"
			}).then(function (b_idx) {
				if (b_idx) {
					alert("등록되었습니다.");
					location.href = "content?b_idx=" + b_idx;
				} else {
					alert("등록이 실패하였습니다.");
				}
			})
		});
	});

	


</script>    
    
</head>
<body>
	<jsp:include page="../commons/nav.jsp"/>
    <jsp:include page="../commons/aside.jsp"/>
    <main>
	    <h2>게시글 작성</h2>
	    <input type="button" value="목록" onclick="history.back()">
	    <hr>
	    <form enctype="multipart/form-data">
		    <input type="radio" name="write_option" value="1" checked="checked">일반글
		    <input type="radio" name="write_option" value="0">공지글
		    <table>
		    	<tr>
				    <th>제목</th>
				    <td>
				    	<input type="text" name="write_subject" id="write_subject" required>
				    </td>
			    </tr>
			    <tr>
				    <th>내용</th>
				    <td>
				    	<textarea name="write_content" id="write_content" cols="50" rows="10" required></textarea>
				    </td>
			    </tr>
			    <tr>
				    <th>첨부파일</th>
				    <td>
				    	<input type="file" name="write_file" id="write_file" >
				    </td>
			    </tr>
		    </table>
		    <input type="button" value="등록" id="sendData">
		</form>
	</main>
</body>
</html>