<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>BitWork - Join Company</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <style>

        th {
            background-color: #16A085;
            color: white;
        }

        tr {
            cursor: pointer;
        }

        tr:hover {
            background-color: #5ab194;
        }

        .selected {
            background-color: #16A085;
            color: white;
        }
    </style>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // 변수 선언
            let searchCompany = document.querySelector("#searchCompany");
            let joinCompany = document.querySelector("#joinCompany");
            let companyName = document.querySelector("#companyName");

            // 회사명 변경 -> 가입신청(비활성화), 검색(활성화)
            document.querySelector("#companyName").addEventListener("change", function () {
                searchCompany.removeAttribute("disabled");
                joinCompany.setAttribute("disabled", "true");
            });

            // 검색 클릭 시, 회사명 검색
            searchCompany.addEventListener("click", function () {
                $.ajax({
                    url: "api",
                    data: {
                        command: "searchCompany",
                        companyName: companyName.value
                    },
                    dataType: "json"
                }).then(function (res) {
                    console.log(res);
                    if (res) {
                        let table = document.createElement("table");
                        let thead_tr = table.createTHead().insertRow();
                        thead_tr.insertCell(-1).outerHTML = "<th>NO</th><th>회사명</th><th>사원수</th>"
                        table.createTBody();
                        let i = 0;
                        for (let company of res) {
                            i++;
                            let tr = table.tBodies[0].insertRow(-1);
                            tr.insertCell(-1).innerText = i + "";
                            tr.insertCell(-1).innerText = company.companyName;
                            tr.insertCell(-1).innerText = company.companyEmpCnt;
                        }
                        document.querySelector("#container").innerHTML = table.outerHTML;
                        document.querySelectorAll("tbody > tr").forEach(function (tr) {
                            console.log(tr);
                            tr.addEventListener("click", selectEventHandler);
                        })
                    }
                });
            });

            // 회사명 선택
            function selectEventHandler() {
                if (this.classList.contains("selected")) {
                    return;
                }
                let trArr = document.querySelectorAll("tbody > tr");

                for (let all of trArr) {
                    all.classList.remove("selected");
                }
                this.classList.add("selected");
                joinCompany.removeAttribute("disabled");
            }
        });
    </script>
</head>
<body>
    <jsp:include page="../commons/nav.jsp"/>
    <jsp:include page="../commons/aside.jsp"/>
    <form action="joinCompany" method="post">
        <div class="form-group">
            <label for="companyName"></label>
            <input type="text" name="companyName" id="companyName" placeholder="회사명" required>
            <button type="button" id="searchCompany">검색</button>
        </div>
        <div id="container">
        </div>
        <div class="form-buttons">
            <button type="submit" id="joinCompany" disabled>가입 신청</button>
        </div>
    </form>
</body>
</html>
