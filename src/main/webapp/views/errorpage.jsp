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
        <div style="margin: 30px; border: 1px solid #eee;">
            <h2 class="bg-danger" style="text-align:center"><strong>ImmuCC Error for job (${jobName})</strong></h2>
            <!--<p style="text-align:center"><small>(${pId})</small></p>-->
            <c:out value="${errFile}"/>
            <!--<p>${errFile}</p>-->
            <p>more detail, please <a href="${ctx}/manual">[back to manual web page]</a></p>
            <!--<p>more detail, please <a href="http://192.168.1.235:3200/immune/manual">[back to manual webpage]</a></p>-->
            <!--<p>more detail, please <a href="http://wap-lab.org:3200/immune/manual">[back to manual webpage]</a></p>-->
        </div>
    </div>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>