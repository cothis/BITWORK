<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Manage</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/axios/0.21.1/dist/axios.min.js"></script>
    <style>
        table {
            background-color: #FFFFFF;
            border: 2px solid #CCCCCC;
            border-collapse: collapse;
        }

        th {
            background-color: #EAEAEA;
        }

        th,
        td {
            border: 1px solid #CCCCCC;
        }
    </style>
    <script>
        function loadEmployees() {
            axios.get("api?type=employees")
                .then(response => {
                    makeTbodyContents(response.data.employees);
                });
        }

        function makeTbodyContents(employees) {
            employees.forEach(function (emp, idx) {
                console.log(emp);
                let tr = document.querySelector("tbody").insertRow(-1);
                tr.insertCell(-1).innerText = idx + 1;
                tr.insertCell(-1).innerText = emp.position;
                tr.insertCell(-1).innerText = emp.name;
                tr.insertCell(-1).innerText = emp.joindate;
            });
        }

        document.addEventListener("DOMContentLoaded", function () {
            loadEmployees();
        });
    </script>
</head>
<body>
    <div class="form-group">
        <label for="name"></label>
        <input type="text" name="name" id="name" placeholder="이름">
        <button type="button">검색</button>
    </div>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>직급</th>
                <th>이름</th>
                <th>입사일</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</body>
</html>
