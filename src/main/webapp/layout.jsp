<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/axios/0.21.1/dist/axios.js"></script>
</head>
<body>
    <header>
        <h1>내용</h1>
        <ul class="nav-menu">
            <li>인사관리</li>
            <li>게시판</li>
            <li>전자결재</li>
            <li>주소록</li>
            <li>근태관리</li>
        </ul>
        <a href="#" class="nav-menu-icon">|||</a>
    </header>

    <main>
        <aside>
            <h1>aside 내용</h1>
            <a href="${pageContext.request.contextPath}/test?testParam=testData">test</a>
        </aside>

        <section id="container">
            <jsp:include page="#{param.dest}"/>
        </section>
    </main>

    <footer>
        <h1>footer 내용</h1>
    </footer>
    <script>
        let navMenuIcon = document.querySelector(".nav-menu-icon");
        let headerUl = document.querySelector("header > ul");
        navMenuIcon.addEventListener("click", function (e) {
            e.preventDefault();
            headerUl.classList.toggle("nav-menu");
        });
    </script>
</body>
</html>
<style>
    /* 전역 설정 */
    :root {
        --header-height: 100px;
        --footer-height: 100px;
        --aside-width: 200px;
    }

    * {
        box-sizing: border-box;
    }

    html,
    body {
        width: 100%;
        min-width: 500px;
        height: 100%;
        padding: 0;
        margin: 0;
        display: flex;
        flex-direction: column;
    }

    /* header */
    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-basis: var(--header-height);
        background-color: khaki;
    }

    header ul {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .nav-menu {
        display: flex;
    }

    header li {
        margin: 0 20px;
    }

    header a {
        display: none;
    }

    /* main */
    main {
        display: flex;
        width: 100%;
        flex: 1;
        background-color: lightblue;
    }

    /* main aside */
    aside {
        display: block;
        flex-basis: var(--aside-width);
        height: 100%;
        background-color: lawngreen;
    }

    /* main > #container */
    #container {
        display: block;
        flex-basis: calc(100% - var(--aside-width));
        height: 100%;
        background-color: lightgray;
        overflow: auto;
    }

    /* footer */
    footer {
        display: flex;
        width: 100%;
        flex-basis: var(--footer-height);
        background-color: khaki;
    }


    @media screen and (max-width: 800px) {

        /* header */
        header {
            flex-basis: auto;
            min-height: var(--header-height);
            flex-wrap: wrap;
        }

        header ul {
            flex-basis: 100%;
            flex-direction: column;
            align-items: center;
        }

        .nav-menu {
            display: none;
        }

        header a {
            display: block;
            position: relative;
            right: 20px;
        }

        /* main */
        main {
            /* flex: 1; */
        }

        /* main > aside*/
        aside {
            display: none;
        }

        /* main > #container */
        #container {
            flex-basis: 100%;
            overflow: initial;
        }
    }
</style>