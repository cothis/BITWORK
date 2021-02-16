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
    <style>
        #invite {
            box-sizing: border-box;
            background-color: #E0E0E0;
            width: 400px;
            padding: 10px;
        }

        .form-group {
            display: flex;
        }

        .form-group input {
            box-sizing: border-box;
            width: 80%;
            height: 30px;
            padding-left: 10px;
        }

        .form-group button {
            box-sizing: border-box;
            width: 20%;
            height: 30px;
            background: none;
            border: none;
        }

        #userList {
            box-sizing: border-box;
            border: 1px solid gray;
            border-radius: 3px;
            box-shadow: 0 0 5px #000808;
            padding: 0;
            background-color: white;
            list-style: none;
        }

        #userList > li {
            box-sizing: border-box;
            display: flex;
            justify-content: space-around;
            line-height: 30px;
            border: 1px solid #F0F0F0;
            border-radius: 3px;

        }

        #userList span {
            box-sizing: border-box;
            height: 30px;
            width: 80%;
            padding-left: 10px;
        }

        #userList a {
            box-sizing: border-box;
            height: 30px;
            width: 20%;
            color: #16A085;
            cursor: pointer;
            text-align: center;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelector("#searchUserBtn").addEventListener("click", function () {
                let xhr = new XMLHttpRequest();
                let data = {
                    command: "findByLikeId",
                    id: document.querySelector("#userId").value
                }
                xhr.onload = function () {
                    if (xhr.status === 200 || xhr.status === 201) {
                        let idList = JSON.parse(xhr.responseText);
                        if (idList.length) {
                            console.log(idList)
                        }
                    }
                }

                xhr.open("post", "../member/api");
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.send(JSON.stringify(data));
            });
        });
    </script>
</head>
<body>
    <jsp:include page="../commons/nav.jsp"/>
    <jsp:include page="../commons/aside.jsp"/>
    <div id="invite">
        <div class="form-group">
            <label for="userId"></label>
            <input type="text" placeholder="아이디로 검색" name="userId" id="userId">
            <button type="button" id="searchUserBtn">검색</button>
        </div>
        <ul id="userList">
            <li>
                <span>테스트1</span>
                <a>초대</a>
            </li>
            <li>
                <span>테스트2</span>
                <a>초대</a>
            </li>
        </ul>
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
            <c:forEach var="employee" items="${requestScope.employees}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${employee.position}</td>
                <td>${employee.name}</td>
                <td>${employee.joindate}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
