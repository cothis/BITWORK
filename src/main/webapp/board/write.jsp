<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../css/boardWrite.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
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
	   <div class="white-bg">
		<div class="header">
			<p class="category">Board</p>
			<h2 class="title">사내게시판</h2>
		</div>
	</div>
	<div class="wrap">
	    <hr>
	    <form class="input-form" enctype="multipart/form-data">
	   	<div class="input-bg">
		    <input id="option-one" type="radio" name="write_option" value="1" checked="checked">
		    <label for="option-one"><span></span>일반글 </label>
		    <input id="option-two" type="radio" name="write_option" value="0">
		    <label for="option-two"><span></span>공지글</label>
		   
		    <table>
		    	<tr>
				    <!-- <th>제목</th> -->
				    <td>
				    	<input class="subject" type="text" name="write_subject" id="write_subject" required>
				    </td>
			    </tr>
			    <tr>
				    <!-- <th>내용</th> -->
				    <td>
				    	<textarea class="content" name="write_content" id="write_content" cols="50" rows="10" required></textarea>
				    </td>
			    </tr>
		    </table>
			    <div class="file">첨부파일</div>
			    <input type="file" name="write_file" id="write_file" >
		    </div>
		    <div class="btn-wrap">
				<input class="list-btn" type="button" value="목록" onclick="history.back()">
				<input class="write-btn" type="button" value="글쓰기" id="sendData">
			</div>
		</form>
	</div>
</body>
</html>