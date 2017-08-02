<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>The Aiping Wu Lab</title>
    <%@include file="common/styles.jsp" %>
</head>
<body>
<%@include file="common/header.jsp" %>
<div class="layout">
    <div class="layout-left">
        <%@include file="common/menu.jsp" %>
    </div>
    <div class="layout-main">
        <h2>Introduction</h2>
        <p>
            Tissue-infiltration immune cells play an important role in causing and resolving various disorders. Mouse models have been largely used to investigate the development of disease.
            Thus, characterzing the tissue immune compostion may be benifit for our understanding of the immune mechanisms in physiological and pathological states.<br>
            Here, ImmuCC, a server was developed to predict the tissue immune composition based on the transcriptomal data of mouse profiled on both microarray and RNA-Seq platform.
        </p>


        <h2>Citation</h2>
        <p>
            Researchers who are intersted in the application of ImmuCC to estimate the immune composition of mouse tissues, please cite as follow:<br>
        <ul>
            <li>Lijun Quan, Qiang Lv, Yang Zhang.
                <i>STRUM: Structure-based stability change prediction upon single-point mutation</i>,
                Bioinformatics, 32: 2911-19 (2016)
                <!--(download <a href="">the PDF file of manuscript</a>
                or <a href="">Support Information</a>)-->
            </li>
        </ul>
        </p>
    </div>
</div>
</body>
</html>