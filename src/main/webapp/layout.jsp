<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/normalize.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/axios/0.21.1/dist/axios.js"></script>
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/navbar.css">
    <link rel="stylesheet" href="/css/aside.css">
    <script src="/js/navbar.js"></script>
</head>
<body>
    <nav class="navbar">
        <h1><a href="/main">Company</a></h1>
        <ul class="nav-menu">
            <li>
                <a href="/company/manage">인사관리</a>
                <ul class="sub-menu">
                    <li><a href="/company/manage">조직관리</a></li>
                    <li><a href="/company/users">사용자관리</a></li>
                </ul>
            </li>
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
    </nav>
    <main class="main">
        <c:if test="${not empty sessionScope.user}">
        <aside class="aside">
            <div class="profile">
                <div class="profile-picture">
                    <img src="/data/member/${sessionScope.user.fileName}" alt="사진">
                </div>
                <div class="name">
                    <span>${sessionScope.user.name}</span>
                    <span>${sessionScope.user.position}</span>
                </div>
                <div class="work-day">
                    근무일 ${sessionScope.workingDay}일째
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
            </div>
        </aside>
        </c:if>

        <section id="container">
            <jsp:include page="#{param.dest}"/>
        </section>
    </main>

    <footer class="footer">
        <h1>(주)비트워크</h1>
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