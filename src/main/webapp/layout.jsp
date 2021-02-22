<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--    <link rel="stylesheet" href="/css/normalize.css">--%>
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/axios/0.21.1/dist/axios.js"></script>
    <link rel="stylesheet" href="/css/navbar.css">
    <link rel="stylesheet" href="/css/aside.css">
    <script src="/js/navbar.js"></script>
</head>
<body>
    <nav class="navbar">
        <h1>Company</h1>
        <ul class="nav-menu">
            <li>
                <a href="/company/manage">인사관리</a>
                <ul class="sub-menu show">
                    <li>조직관리</li>
                    <li>사용자관리</li>
                </ul>
            </li>
            <li>게시판</li>
            <li>전자결재</li>
            <li>주소록</li>
            <li>근태관리</li>
        </ul>
        <a class="nav-toggle-btn">|||</a>
    </nav>
    <main class="main">
        <aside class="aside">
            <div class="profile">
                <div class="profile-picture">
                    <img src="/img/default.jpg" alt="사진">
                </div>
                <div class="name">
                    신진영 사원
                </div>
                <div class="work-day">
                    근무일 187일째
                </div>
                <div class="member-button">
                    <a class="member-info" href="/member/update">정보수정</a>
                    <a class="member-logout" href="/member/logout">로그아웃</a>
                </div>
            </div>
            <div class="commute">
                <div class="today-info">
                    <div class="today">2021년 02월 10일</div>
                    <div class="today-message">오늘의 근태 현황</div>
                </div>
                <div class="today-commute-time">
                    <i></i>
                    08 : 30 : 00
                </div>
                <div class="today-commute-time">
                    <i></i>
                    00 : 00 : 00
                </div>
            </div>
        </aside>

        <section id="container">
            <jsp:include page="#{param.dest}"/>
        </section>
    </main>

    <footer class="footer">
        <h1>footer 내용</h1>
    </footer>
    <script>
        let navMenuIcon = document.querySelector(".nav-toggle-btn");
        let navUl = document.querySelector(".nav-menu");
        navMenuIcon.addEventListener("click", function (e) {
            e.preventDefault();
            navUl.classList.toggle("active");
        });
    </script>
</body>
</html>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&family=Quicksand:wght@700&display=swap');
    /* 전역 설정 */
    :root {
        --nav-height: 100px;
        --footer-height: 80px;
        --aside-width: 360px;
    }

    * {
        box-sizing: border-box;
        font-family: 'Noto Sans KR', sans-serif;
        padding: 0;
        margin: 0;

    }

    html,
    body {
        width: 100%;
        min-width: 500px;
        height: 100%;
        display: flex;
        flex-direction: column;
    }

    /* nav */
    .navbar {
        flex-basis: var(--nav-height);
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #1B232D;
        color: #039DBE;
        padding-left: 20px;

    }

    .navbar h1 {
        font-family: 'Quicksand', sans-serif;
        color: white;
        font-size: 35px;
    }

    .nav-menu {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;
        color: #FFFFFF;
    }

    .nav-menu li {
        margin: 0 20px;
    }

    .nav-toggle-btn {
        display: none;
        position: absolute;
        right: 20px;
        top: 20px;
    }

    /* main */
    .main {
        height: calc(100% - var(--nav-height) - var(--footer-height));
        display: flex;
        width: 100%;
        background-color: #E8ECEF;
    }

    /* main aside */

    .aside {
        flex-basis: var(--aside-width);
        display: block;
        background-color: #39485D;
        color: #FFFFFF;
        padding: 20px;
    }

    /* main > #container */
    #container {
        flex: 1;
        display: flex;
        flex-direction: column;
        overflow: auto;
    }

    .wrap {
        margin: 0 280px;
    }

    /* footer */
    .footer {
        display: flex;
        width: 100%;
        flex-basis: var(--footer-height);
        background-color: #282828;
    }

    /* header */
    .header {
        width: 100%;
        flex-basis: 50px;
        padding: 20px 0 20px 280px;
        background-color: #FFFFFF;
        border: 1px solid #e0e4e7;

    }

    /* Element */
    .category {
        color: #00add0;
        font-weight: 800;
        margin-left: 3px;
        font-family: 'Quicksand', sans-serif;
    }

    .title {
        color: #1e1e1e;
        font-size: 30px;
        font-weight: 500;
    }

    .btn {
        width: 100px;
        height: 40px;
        padding: 10px;
        border: none;
        border-radius: 5px;
        outline: none;
    }

    .btn:hover {
        cursor: pointer;
        background-color: #7562ca;
        transition-duration: 0.3s;
    }

    .primary {
        background-color: #3498D8;
        color: #FFFFFF;
    }

    /* header */
    .header {
        width: 100%;
        flex-basis: 50px;
        margin: 0;
        padding-left: 280px;
        background-color: #FFFFFF;
    }

    /* Element */

    h1 {
        padding: 0;
        margin: 0;
    }

    .btn {
        width: 100px;
        height: 40px;
        padding: 10px;
        border: none;
        border-radius: 5px;
        outline: none;
    }

    .btn:hover {
        cursor: pointer;
        background-color: #7562ca;
        transition-duration: 0.3s;
    }

    .primary {
        background-color: #3498D8;
        color: #FFFFFF;
    }

    .green {
        background-color: #2DDCAD;
        color: #FFFFFF;
    }

    @media screen and (max-width: 800px) {

        /* nav */
        .navbar {
            flex-direction: column;
            align-items: flex-start;
            flex-wrap: wrap;
        }

        .nav-menu {
            align-self: center;
            display: none;
            flex-direction: column;
            align-items: center;
        }

        .nav-toggle-btn {
            display: block;
        }

        .active {
            display: flex;
        }

        /* main */
        #main {
            height: auto;
        }

        /* main > aside*/
        #aside {
            display: none;
        }

        /* main > #container */
        #container {
            overflow: initial;
        }
    }
</style>