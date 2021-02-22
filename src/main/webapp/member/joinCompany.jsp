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
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // 변수 선언
            let searchCompany = document.querySelector("#searchCompany");
            let joinCompany = document.querySelector("#joinCompany");
            let companyName = document.querySelector("#companyName");
            let companyIdx = document.querySelector("#companyIdx");

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
                    if (res) {
                        let table = document.createElement("table");
                        let thead_tr = table.createTHead().insertRow();
                        thead_tr.insertCell(-1).outerHTML = "<th>회사코드</th><th>회사명</th><th>사원수</th>"
                        table.createTBody();
                        for (let company of res) {
                            let tr = table.tBodies[0].insertRow(-1);
                            tr.insertCell(-1).innerText = company.companyIdx;
                            tr.insertCell(-1).innerText = company.companyName;
                            tr.insertCell(-1).innerText = company.companyEmpCnt;
                        }
                        document.querySelector("#container").innerHTML = table.outerHTML;
                        document.querySelectorAll("tbody > tr").forEach(function (tr) {
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
                    all.removeAttribute("class");
                }
                this.classList.add("selected");
                companyIdx.setAttribute("value", this.firstElementChild.textContent);
                joinCompany.removeAttribute("disabled");
            }

            // 가입 요청
            joinCompany.addEventListener("click", function () {
                $.ajax({
                    url: "joinCompany",
                    method: "post",
                    data: {
                        companyIdx: companyIdx.getAttribute("value")
                    },
                    dataType: "json"
                }).then(function (res) {
                    if (res) {
                        alert("신청되었습니다");
                        location.href = "waitCompany";
                    } else {
                        alert("가입 실패입니다");
                    }
                })
            });
        });
    </script>
</head>
<body>
    <div class="form-group">
        <label for="companyName"></label>
        <input type="text" id="companyName" placeholder="회사명">
        <button type="button" id="searchCompany">검색</button>
    </div>
    <div id="container">
    </div>
    <form>
        <div class="form-buttons">
            <input type="hidden" name="companyIdx" id="companyIdx">
            <button type="button" id="joinCompany" disabled>가입 신청</button>
        </div>
    </form>
</body>
</html>
