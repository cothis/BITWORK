<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주소추가</title>
<script>
function list_go() {
	location.href = "addressbook_main.jsp";
}

function sendData(firstForm) {
	alert(">> 주소가 저장되었습니다.");
	for (var i=0; i<firstForm.elements.length; i++) {
		console.log(firstForm.elements[i]);
		if (firstForm.elements[i].value.trim() == "") {
			alert(firstForm.elements[i].title + " 입력하세요");
			firstForm.elements[i].focus();
			return;
		}
	}
	firstForm.action= "addressbook_main.jsp";
	firstForm.submit();
}
</script>
</head>
<body>
<div id="bbs">
<form method="post">
	<table>
		<caption>주소 추가</caption>
		<tbody>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" size="12" title="이름">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="phone" size="40" title="전화번호">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" size="40" title="이메일">
				</td>
			</tr>
			<tr>
				<th>회사</th>
				<td>
					<input type="text" name="company" size="20" title="회사">
				</td>
			</tr>
			
			
			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" onclick="sendData(this.form)">
					<input type="button" value="목록" onclick="list_go()">
				</td>
			</tr>
		</tfoot>
	</table>
</form>


</div>

</body>
</html>