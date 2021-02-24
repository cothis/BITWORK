<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Manage</title>
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/fontawesome/css/fontawesome.css">
    <link rel="stylesheet" href="/css/boardList.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/axios/0.21.1/dist/axios.min.js"></script>
    <script>
        function loadEmployees() {
            let name = document.querySelector("#name").value;
            let params = {
                type: "employees",
                name: name
            }
            axios.get("api", {
                params: params
            }).then(response => {
                makeTbodyContents(response.data.employees);
            });
        }

        function makeTbodyContents(employees) {
            const tbody = document.querySelector(".member-content");
            tbody.innerHTML = "";
            employees.forEach(function (emp, idx) {
                console.log(emp);
                const tr = tbody.insertRow(-1);
                tr.classList.add("trow");
                tr.insertCell(-1).innerText = idx + 1;
                tr.insertCell(-1).innerText = emp.position;
                tr.insertCell(-1).innerText = emp.name;
                tr.insertCell(-1).innerText = getFormatDate(emp.joindate);
            });
        }

        function getFormatDate(dateString) {
            if (dateString) {
                const date = new Date(dateString);
                let year = date.getFullYear();
                let month = (1 + date.getMonth());
                month = month >= 10 ? month : '0' + month;
                let day = date.getDate();
                day = day >= 10 ? day : '0' + day;
                return year + "." + month + "." + day;
            } else {
                return "";
            }
        }

        document.addEventListener("DOMContentLoaded", function () {
            loadEmployees();
        });
    </script>
    <style>
        .wrap {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .section {
            width: 80%;
            min-width: 800px;
            background-color: #FFFFFF;
            border-radius: 10px;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }

        .search-form {
            align-self: flex-end;
            display: flex;
        }

        table {
            background-color: #FFFFFF;
            border: none;
            border-collapse: collapse;
            border-radius: 5px;
            text-align: center;
        }

        .thead-row {
            background-color: #EAEAEA;
            padding: 10px;
        }

        .trow {
            border-top: 1px solid #CCCCCC;
            border-bottom: 1px solid #CCCCCC;
        }

        .col-25 {
            width: 25%;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="category">Company</div>
        <div class="title">조직 관리</div>
    </header>
    <div class="wrap">
        <div class="section">
            <div class="search-form">
                <label for="name"></label>
                <input type="text" name="name" id="name" placeholder="이름" class="search-bar">
                <button class="search-button" type="submit" onclick="loadEmployees()">
                    <i class="fas fa-search"></i>
                </button>
            </div>

            <table>
                <thead>
                    <tr class="trow thead-row">
                        <th class="col-25">번호</th>
                        <th class="col-25">직급</th>
                        <th class="col-25">이름</th>
                        <th class="col-25">입사일</th>
                    </tr>
                </thead>
                <tbody class="member-content">
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
