<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>include1</title>
</head>
<body>
    <h1>include1</h1>
    <h2>dest : ${param.dest}</h2>
    <h2>testParam : ${param.testParam}</h2>
    <form action="test" method="post">
        <input type="text" name="id" placeholder="id">
        <button>전송</button>
    </form>
</body>
</html>
