<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - AddressBook</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/axios/0.21.1/dist/axios.min.js"></script>
    <style>
        table {
            border-collapse: collapse;
            width: 800px;
            background-color: #FFFFFF;
        }

        thead {
            background-color: #EAEAEA;
        }

        tr {
            border: 1px solid #CCCCCC;
            border-left: none;
            border-right: none;
        }

        td {
            text-align: center;
        }
        
        table {
            border-collapse: collapse;
            width: 1000px;
            background-color: #FFFFFF;
        }

        thead {
            background-color: #EAEAEA;
        }

        tr {
            border: 1px solid #CCCCCC;
            border-left: none;
            border-right: none;
            
        }

        td {
            text-align: center;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        
        .primary {
        	margin: 3px;
        	float: left;
        }
        .green {
        	margin: 3px;
        	float: right;
        }
        
        #name {
        	position: relative;
        	left: 445px;
        	top: 10px;
        	font-size: 18px;
        }
        #pageNav {
        	display: flex;
        	width: 100%;
        	justify-content: center;
        	margin-top: 10px;
        }
        
        #pageNav a {
        	box-sizing: border-box;
        	display: block;
        	margin: 0 10px;
        	width: 50px;
        	height: 30px;
        	line-height: 30px;        	
        	border: 1px solid silver;
        	border-radius: 5px;
        	background-color: #FEFEFE;
        	text-align: center;
        	text-decoration: none;
        	color: #ababab;
        }
        
        #pageNav a:hover {
        	cursor: pointer;
        	background-color: #7562ca;
        }
        
        #pageNav a[href] {
        	background-color: #3498D8;
        	font-weight: bold;
        }
        
    </style>
    <script>
        function checkOthers() {
            let checkBoxes = document.querySelectorAll("tbody input[type='checkbox']");
            let resultStatus = true;
            for (let checkBox of checkBoxes) {
                resultStatus = resultStatus && checkBox.checked;
            }
            let checkAllBtn = document.querySelector("thead input[type='checkbox']");
            checkAllBtn.checked = resultStatus;
        }

        function checkAll(checkAllBtn) {
            let checkBoxes = document.querySelectorAll("tbody input[type='checkbox']");
            for (let checkBox of checkBoxes) {
                checkBox.checked = checkAllBtn.checked;
            }
        }

        function searchAddr() {
            let name = document.querySelector(".form-buttons > input").value;
            location.href = "list?name=" + name;
        }

        function deleteAddr() {
            let abIdxArray = [];
            let checkBoxes = document.querySelectorAll("tbody input[type='checkbox']");
            for (let checkBox of checkBoxes) {
                if (checkBox.checked) {
                    abIdxArray.push(checkBox.value);
                }
            }

            let data = {
                idxArr: abIdxArray
            }

            axios.post("delete", data)
                .then(response => {
                    if (response.data.result) {
                        location.href = "list?name=${param.name}&nowPage=${param.nowPage}";
                    } else {
                        alert("삭제 실패입니다");
                    }
                });
        }

        function addAddr() {
            location.href = "modify";
        }
    </script>
</head>
<body>
    <header class="header">
        <div class="category">AddressBook</div>
        <div class="title">주소록</div>
    </header>
    <div class="wrap">
        <section class="form-buttons">
            <button type="button" onclick="addAddr()" class="btn primary">추가</button>
            <button type="button" onclick="deleteAddr()" class="btn primary">삭제</button>
            <label for="name"></label>
            <input type="text" name="name" id="name" placeholder="이름" class="search" value="${param.name}">
            <button type="button" onclick="searchAddr()" class="btn green">검색</button>
        </section>
        <section id="bbs">
            <table>
                <thead>
                    <tr>
                        <th>
                            <label for="checkAllButton"></label>
                            <input type="checkbox" id="checkAllButton" onclick="checkAll(this)">
                        </th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>회사</th>
                        <th>전화번호</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="vo" items="${requestScope.list}">
                        <tr>
                            <td>
                                <label>
                                    <input type="checkbox" name="selectRows" value="${vo.addressbookIdx}"
                                           onclick="checkOthers()">
                                </label>
                            </td>
                            <td><a href="modify?idx=${vo.addressbookIdx}&nowPage=${param.nowPage}">${vo.name}</a></td>
                            <td>${vo.email}</td>
                            <td>${vo.company}</td>
                            <td>${vo.phone}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div id="pageNav">
                <c:if test="${requestScope.paging.startPage - 1 > 0}">
                    <a href="list?name=${param.name}&nowPage=${requestScope.paging.startPage - 1}">이전</a>
                </c:if>
                <c:if test="${not (requestScope.paging.startPage - 1 > 0)}">
                    <a>이전</a>
                </c:if>

                <c:forEach var="page" begin="${requestScope.paging.startPage}" end="${requestScope.paging.endPage}">
                    <c:if test="${page eq requestScope.paging.nowPage}">
                        <a>${page}</a>
                    </c:if>
                    <c:if test="${page ne requestScope.paging.nowPage}">
                        <a href="list?name=${param.name}&nowPage=${page}">${page}</a>
                    </c:if>
                </c:forEach>

                <c:if test="${requestScope.paging.endPage < requestScope.paging.totalPage}">
                    <a href="list?name=${param.name}&nowPage=${requestScope.paging.endPage + 1}">다음</a>
                </c:if>
                <c:if test="${not (requestScope.paging.endPage < requestScope.paging.totalPage)}">
                    <a>다음</a>
                </c:if>
            </div>
        </section>
    </div>

</body>
</html>
