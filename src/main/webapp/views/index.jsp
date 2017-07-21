<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/taglib.jsp"%>
<html lang="zh-hans">
<head>
    <meta charset="UTF-8">
    <title>The Aiping Wu Lab</title>
    <link rel="stylesheet" href="${staticPath}/css/allStyle.css" >
</head>
<body>
    <div id="z_menu">
        <a class="z_menu_main" href="/">Home</a>
        <a class="z_menu_main" href="/${ctx}/analysis">Analysis</a>
        <a class="z_menu_main" href="/${ctx}/manual">Manual</a>
        <a class="z_menu_main" href="/${ctx}/contact">Contact</a>
        <div class="z_clear"></div>
    </div>

    <div id="z_body">
        <div id="z_sidebar">
            <p class="z_sidebar_menu z_sidebar_menu1">
                <a href="/I-TASSER">&#9679;<span>I-TASSER</span></a>
                <a href="/QUARK">&#9679;<span>QUARK</span></a>
                <a href="/LOMETS">&#9679;<span>LOMETS</span></a>
                <a href="/COACH">&#9679;<span>COACH</span></a>
            </p>
        </div>
    </div>
</body>
</html>