<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/normalize.css">
</head>
<body>
    <header>
        <h1>내용</h1>
    </header>

    <main>
        <aside>
            <h1>aside 내용</h1>
            <a href="test?testParam=testData">test</a>
        </aside>

        <section id="container">
            <jsp:include page="#{param.dest}"/>
        </section>
    </main>

    <footer>
        <h1>footer 내용</h1>
    </footer>
</body>
</html>
<style>
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
        height: 100%;
        padding: 0;
        margin: 0;
    }

    header {
        display: flex;
        width: 100%;
        height: var(--header-height);
        background-color: khaki;
        overflow-y: hidden;
    }

    main {
        display: flex;
        width: 100%;
        height: calc(100% - var(--header-height) - var(--footer-height));
    }

    aside {
        display: block;
        width: var(--aside-width);
        height: 100%;
        background-color: lawngreen;
    }

    #container {
        display: block;
        width: calc(100% - var(--aside-width));
        height: 100%;
        background-color: lightgray;
        overflow-y: auto;
    }

    footer {
        display: flex;
        width: 100%;
        height: var(--footer-height);
        background-color: khaki;
    }
</style>