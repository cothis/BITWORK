<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ּ��߰�</title>
<script>
function list_go() {
	location.href = "addressbook_main.jsp";
}

function sendData(firstForm) {
	alert(">> �ּҰ� ����Ǿ����ϴ�.");
	for (var i=0; i<firstForm.elements.length; i++) {
		console.log(firstForm.elements[i]);
		if (firstForm.elements[i].value.trim() == "") {
			alert(firstForm.elements[i].title + " �Է��ϼ���");
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
		<caption>�ּ� �߰�</caption>
		<tbody>
			<tr>
				<th>�̸�</th>
				<td>
					<input type="text" name="name" size="12" title="�̸�">
				</td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td>
					<input type="text" name="phone" size="40" title="��ȭ��ȣ">
				</td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td>
					<input type="text" name="email" size="40" title="�̸���">
				</td>
			</tr>
			<tr>
				<th>ȸ��</th>
				<td>
					<input type="text" name="company" size="20" title="ȸ��">
				</td>
			</tr>
			
			
			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="����" onclick="sendData(this.form)">
					<input type="button" value="���" onclick="list_go()">
				</td>
			</tr>
		</tfoot>
	</table>
</form>


</div>

</body>
</html>