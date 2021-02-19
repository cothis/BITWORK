<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - AddressBook</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/axios/0.21.1/dist/axios.min.js"></script>
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

        function searchAddr(form) {
            form.action = "list?name=" + form.name.value;
            form.submit();
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
                .then(result => {
                    console.log(result);
                });
        }

        function addAddr(form) {
            alert("추가");
        }
    </script>
</head>
<body>
    <form class="form-buttons" method="get">
        <button type="button" onclick="addAddr(this.form)">추가</button>
        <button type="button" onclick="deleteAddr()">삭제</button>
        <label for="name"></label>
        <input type="text" name="name" id="name" placeholder="이름" value="${param.name}">
        <button type="button" onclick="searchAddr(this.form)">검색</button>
    </form>
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
                            <input type="checkbox" name="selectRows" value="${vo.addressbookIdx}" onclick="checkOthers()">
                        </label>
                    </td>
                    <td>${vo.name}</td>
                    <td>${vo.email}</td>
                    <td>${vo.company}</td>
                    <td>${vo.phone}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div id="pageNav">
        <c:if test="${requestScope.paging.startPage - 1 > 0}">
            <a href="list?name=${param.name}&nowPage=${requestScope.paging.startPage - 1}">이전으로</a>
        </c:if>
        <c:if test="${not (requestScope.paging.startPage - 1 > 0)}">
            <a>이전으로</a>
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
            <a href="list?name=${param.name}&nowPage=${requestScope.paging.endPage + 1}">다음으로</a>
        </c:if>
        <c:if test="${not (requestScope.paging.endPage < requestScope.paging.totalPage)}">
            <a>다음으로</a>
        </c:if>
        </div>
    </section>
</body>
</html>
