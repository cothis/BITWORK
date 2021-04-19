<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - AddressBook</title>
    <link rel="stylesheet" href="/fontawesome/css/fontawesome.css">
    <link rel="stylesheet" href="/css/components/table.css">
    <link rel="stylesheet" href="/css/components/search.css">
    <link rel="stylesheet" href="/css/components/button.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/axios/0.21.1/dist/axios.min.js"></script>
    <style>
    	.wrap {
    		display: flex;
    		flex-direction: column;
    	}
    	
    	.user-form {
    		margin-top: 10px;
    		width: 1000px;
    		display: flex;
    		justify-content: space-between;
    	}
    	
/*    	.add-delete .search-button {
    		width: 50px;
    	}*/
    	
    	.delete-button {
    		background-color: #7a7a7a;
    	}
    
        a { 
        	text-decoration: none; 
        	color: black; 
        }

        a:link { 
        	color: black;
	        text-decoration: none;
	    }
        
 		a:visited {
	 		text-decoration: none;
	 	}
 		
 		a:hover { 
	 		text-decoration: underline;
	 	}
	 	#pageNav li a:hover {
	 		color: #ff9c00;
	 	}
       
        #pageNav {
        	display: flex;
        	width: 100%;
        	justify-content: center;
        	margin-top: 10px;
        	
        }
        #pageNav a {
        	margin: 0 20px;
        	line-height: 16px;        	
        	text-align: center;
        	text-decoration: underline;
        	color: #3498D8;
        }
        

        
        #pageNav a[href] {
        	text-decoration: none;
        	font-weight: bold;
        	color: #000000; 
        }

        a i:hover{
        	color: #ff9c00;
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
            let name = document.querySelector("#name").value;
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
    	<div class="user-form">
    		<div class="add-delete">
	            <button type="button" onclick="addAddr()" class="btn">추가</button>
	            <button type="button" onclick="deleteAddr()"
	                    class="delete-button btn">삭제</button>
    		</div>
	    	<div class="search-form">
	            <label for="name"></label>
	            <input type="text" name="name" id="name" placeholder="이름" class="search-bar" value="${param.name}">
	            <button type="button" onclick="searchAddr()" class="search-button">
	            	<i class="fas fa-search"></i>
	            </button>
	        </div>
    	</div>
        <section id="bbs">
<!--             <table style="table-layout: fixed"> -->
            <table class="table">
                <thead class="thead">
                    <tr>
                        <th width="5%">
                            <label for="checkAllButton"></label>
                            <input type="checkbox" id="checkAllButton" onclick="checkAll(this)">
                        </th>
                        <th width="20%">이름</th>
                        <th width="25%">이메일</th>
                        <th width="20%">회사</th>
                        <th width="15%">전화번호</th>
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
                            <td><a href="modify?idx=${vo.addressbookIdx}&nowPage=${param.nowPage}">${vo.name}&nbsp;&nbsp;<i class="fas fa-edit"></i></a></td>
                            <td>${vo.email}</td>
                            <td>${vo.company}</td>
                            <td>${vo.phone}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div id="pageNav">
                <c:if test="${requestScope.paging.startPage - 1 > 0}">
                    <a href="list?name=${param.name}&nowPage=${requestScope.paging.startPage - 1}" style="color:black;"><i class="fas fa-chevron-left"></i></a>
                </c:if>
                <c:if test="${not (requestScope.paging.startPage - 1 > 0)}">
                    <a><i class="fas fa-chevron-left" style="color:gray;"></i></a>
                </c:if>

                <c:forEach var="page" begin="${requestScope.paging.startPage}" end="${requestScope.paging.endPage}">
                    <c:if test="${page eq requestScope.paging.nowPage}">
                        <a>${page}</a>
                    </c:if>
                    <li>
                    <c:if test="${page ne requestScope.paging.nowPage}">
                        <a href="list?name=${param.name}&nowPage=${page}">${page}</a>
                    </c:if>
                    </li>
                </c:forEach>

                <c:if test="${requestScope.paging.endPage < requestScope.paging.totalPage}">
                    <a href="list?name=${param.name}&nowPage=${requestScope.paging.endPage + 1}"><i class="fas fa-chevron-right"></i></a>
                </c:if>
                <c:if test="${not (requestScope.paging.endPage < requestScope.paging.totalPage)}">
                    <a><i class="fas fa-chevron-right" style="color:gray;"></i></a>
                </c:if>
            </div>
        </section>
    </div>

</body>
</html>
