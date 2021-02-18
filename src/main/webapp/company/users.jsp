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
    <script src="${pageContext.request.contextPath}/webjars/axios/0.21.1/dist/axios.js"></script>
    <style>
        #inviteForm {
            box-sizing: border-box;
            background-color: #E0E0E0;
            width: 600px;
            padding: 15px;
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
            width: 20%;
        }

        section {
            padding: 15px;
        }

        #userTable {
            margin-top: 10px;
            width: 100%;
            background-color: #FFFFFF;
            box-shadow: 0 0 5px;
            border-collapse: collapse;
        }

        #userTable tr {
            height: 30px;
            border: 1px solid #d3d3d3;
        }

        #userTable thead {
            background-color: #16A085;
        }

        #userTable th:not(:last-child) {
            text-align: left;
            width: 40%;
        }

        #userTable th:last-child {
            width: 20%;
        }

        #userTable th,
        #userTable td {
            padding-left: 10px;
        }

        .transparent {
            box-sizing: border-box;
            margin: 0;
            width: 100%;
            background: none;
            border: none;
            outline: none;
            cursor: pointer;
        }

        .invite {
            color: #16A085;
        }

        .invited {
            color: #1290ff;
            cursor: default;
        }
    </style>
    <script>
        function invite(id, button) {
            let params = {
                command: "invite",
                id: id
            };
            const payload = new URLSearchParams(params);

            axios.post("../member/api", payload)
                .then((response) => {
                    if (response.data.result) {
                        button.innerText = "초대완료";
                        button.classList.remove("invite");
                        button.classList.add("invited");
                        button.removeEventListener();
                    } else {
                        alert("초대에 실패했습니다.");
                    }
                });
        }

        function makeTableRow(tbody, data) {
            tbody.innerHTML = "";
            if (data.length === 0) {
                alert("검색된 결과가 없습니다");
            }
            data.forEach(function (el) {
                const tr = document.createElement("tr");
                const button = document.createElement("button");
                button.type = "button";
                button.className = "transparent invite";
                button.innerText = "초대";
                button.addEventListener("click", () => invite(el.id, button));

                tr.insertCell(-1);
                tr.insertCell(-1);
                tr.insertCell(-1);
                tr.cells[0].textContent = el.id;
                tr.cells[1].textContent = el.name;
                tr.cells[2].appendChild(button);
                tbody.appendChild(tr);
            });
        }

        function gradeHandler(isApply, ...memberIdList) {
            let payload = {
                isApply: isApply,
                memberIdList: memberIdList
            }
            axios.post("../member/updateGrade", payload).then(function (res) {
                payload.memberIdList.forEach(function (memberId) {
                    document.querySelector("#memberId_" + memberId).remove();
                })
                alert(res.data + "건 처리되었습니다");
            });
        }

        function loadApplyList() {
            axios.get("../member/api?command=findApplyList").then(function (res) {
                const tbody = document.createElement("tbody");
                tbody.id = "applyTbody";
                if (res.data.result) {
                    const list = res.data.list;
                    list.forEach(function (member, idx) {
                        const tr = tbody.insertRow(-1);
                        tr.id = "memberId_" + member.id;
                        const tdNo = tr.insertCell(-1);
                        const tdId = tr.insertCell(-1);
                        const tdName = tr.insertCell(-1);
                        const tdPosition = tr.insertCell(-1);
                        const tdApply = tr.insertCell(-1);
                        const applyBtn = document.createElement("button");
                        const refuseBtn = document.createElement("button");
                        tdNo.innerText = idx + 1;
                        tdId.innerText = member.id;
                        tdName.innerText = member.name;
                        tdPosition.innerText = member.position;
                        applyBtn.innerText = "승인";
                        applyBtn.type = "button";
                        applyBtn.addEventListener("click", () => gradeHandler(true, member.id));
                        refuseBtn.innerText = "거절";
                        refuseBtn.type = "button";
                        refuseBtn.addEventListener("click", () => gradeHandler(false, member.id));
                        tdApply.appendChild(applyBtn);
                        tdApply.appendChild(refuseBtn);
                    });
                    document.querySelector("#inviteTable thead").insertAdjacentElement("afterend", tbody);
                } else {
                    alert("에러가 발생했습니다. 서버관리자에게 문의해주세요");
                }
            });
        }

        document.addEventListener("DOMContentLoaded", function () {
            loadApplyList();

            document.querySelector("#searchUserBtn").addEventListener("click", function () {
                const tbody = document.getElementById("userTbody");
                const id = this.form.userId.value;
                axios.get("../member/api", {
                    params: {
                        command: "findInvitable",
                        id: id
                    }
                }).then(function (res) {
                    const data = res.data;
                    makeTableRow(tbody, data);
                });
            });
        });
    </script>
</head>
<body>
    <jsp:include page="../commons/nav.jsp"/>
    <jsp:include page="../commons/aside.jsp"/>
    <section id="inviteSection">
        <form id="inviteForm">
            <div class="form-group">
                <label for="userId"></label>
                <input type="text" placeholder="아이디로 검색" name="userId" id="userId">
                <button type="button" id="searchUserBtn" class="transparent">검색</button>
            </div>
            <table id="userTable">
                <thead>
                    <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>초대</th>
                    </tr>
                </thead>
                <tbody id="userTbody">
                    <tr>
                        <td>테스트1 아이디</td>
                        <td>테스트1 이름</td>
                        <td>
                            <button class="transparent invite">초대</button>
                        </td>
                    </tr>
                    <tr>
                        <td>테스트2 아이디</td>
                        <td>테스트2 이름</td>
                        <td>
                            <button class="transparent invite">초대</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </section>
    <section id="inviteList">
        <table id="inviteTable">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>직급</th>
                    <th>승인</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td colspan="5">
                        <button type="button" id="applyAll">모두 승인</button>
                    </td>
                </tr>
            </tfoot>
        </table>
    </section>
</body>
</html>
