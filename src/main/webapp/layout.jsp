<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/fontawesome/css/fontawesome.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/navbar.css">
    <link rel="stylesheet" href="/css/aside.css">
    <script src="/js/navbar.js"></script>
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/axios/0.21.1/dist/axios.js"></script>
    <style>
        .footer {
            align-items: center;
        }

        .logo-title {
            margin-left: 20px;
            font-size: 18px;
            color: #FFFFFF;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <h1><a href="/main">${not empty sessionScope.company ? sessionScope.company.companyName : "BitWork"}</a></h1>
        <c:if test="${not empty sessionScope.company}">
            <ul class="nav-menu">
                <c:if test="${sessionScope.user.grade == 4}">
                    <li>
                        <a href="/company/manage">인사관리</a>
                        <ul class="sub-menu">
                            <li><a href="/company/manage">조직관리</a></li>
                            <li><a href="/company/users">사용자관리</a></li>
                        </ul>
                    </li>
                </c:if>
                <li><a href="/board/list">게시판</a></li>
                <li><a href="/sign/list">전자결재</a></li>
                <li><a href="/addressbook/list">주소록</a></li>
                <li>
                    <a href="/commute/main">근태관리</a>
                    <ul class="sub-menu">
                        <li><a href="/commute/main">근태관리</a></li>
                        <li><a href="/commute/list">근태현황</a></li>
                    </ul>
                </li>
            </ul>
            <a class="nav-toggle-btn">|||</a>
        </c:if>
    </nav>
    <main class="main">
        <c:if test="${not empty sessionScope.user}">
            <aside class="aside">
                <div class="profile">
                    <div class="profile-picture">
                        <c:set var="path" value="/profile-picture/default.png"/>
                        <c:if test="${not empty sessionScope.user.fileName}">
                            <c:set var="path" value="/data/member/${sessionScope.user.fileName}"/>
                        </c:if>
                        <img src="${path}" alt="사진" onerror="this.src='/profile-picture/default.png'">
                    </div>
                    <div class="name">
                        <span>${sessionScope.user.name}</span>
                        <span>${sessionScope.user.position}</span>
                    </div>
                    <div class="work-day">
                        <c:if test="${not empty sessionScope.user.joindate}">
                            근무일 ${sessionScope.workingDay}일째
                        </c:if>
                        <c:if test="${empty sessionScope.user.joindate}">
                            가입된 회사가 없습니다
                        </c:if>
                    </div>
                    <div class="member-button">
                        <a class="member-info" href="/member/update">정보수정</a>
                        <a class="member-logout" href="/member/logout">로그아웃</a>
                    </div>
                </div>
                <div class="commute">
                    <div class="today-info">
                        <div class="today-message">· TODAY ·</div>
                        <div class="today">${sessionScope.commute.CDate}</div>
                    </div>
                    <c:if test="${not empty sessionScope.user.joindate}">
                        <div class="today-commute-time">
                            <span>출근</span>
                            <i class="fas fa-briefcase"></i>
                                ${sessionScope.commute.onTime}
                        </div>
                        <div class="today-commute-time">
                            <span>퇴근</span>
                            <i class="fas fa-home"></i>
                                ${sessionScope.commute.offTime}
                        </div>
                    </c:if>
                </div>
            </aside>
        </c:if>

        <section id="container">
            <jsp:include page="#{param.dest}"/>
        </section>
    </main>

    <footer class="footer">
        <span class="logo-title">(주)비트워크</span>
    </footer>
    <script>
        let navMenuIcon = document.querySelector(".nav-toggle-btn");
        let navUl = document.querySelector(".nav-menu");
        if (navMenuIcon) {
            navMenuIcon.addEventListener("click", function (e) {
                e.preventDefault();
                navUl.classList.toggle("active");
            });
        }
    </script>
</body>
</html>