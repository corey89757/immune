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
        <h2 style="text-align:center; padding-top:15px"> ImmuCC results for job (${jobName})</h2>
        <!--<p style="text-align:center"><small>(${pId})</small></p>-->
        <div class="container-fluid" style = "margin-top:0rem;">
            <h3 class="bg-info" style="text-align:center;">Table: predicted immune cell compositions</h3>
            <label for="resultType" class="control-label ">Download: </label>
            <c:url var="txtFileLink" value="/download">
                <c:param name="path">${txtFile}</c:param>
            </c:url>
            <a class="btn btn-warning active" href="${txtFileLink}" download="txt">txt</a>
            <c:url var="csvFileLink" value="/download">
                <c:param name="path">${csvFile}</c:param>
            </c:url>
            <a class="btn btn-warning active" href="${csvFileLink}" download="csv">csv</a>
        </div>

        <div class="container-fluid">
            <%--<div class="">--%>
                <div class="row-fluid">
                    <!--<div style="position:absolute; height:150px; overflow:auto"></div>   overflow-y:hidden-->
                    <div class="table-responsive"><!--row pre-scrollable-->
                        <table class="table  table-striped table-bordered table-hover table-condensed datatable">
                            <thead>
                            <tr>
                                <c:forEach items="${formData[0]}" var="cell">
                                    <th>${cell.key}</th>
                                </c:forEach>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${formData}" var="item">
                                <tr>
                                    <c:forEach items="${item}" var="cell">
                                        <td>${cell.value}</td>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%@include file="common/script.jsp" %>
                <script>
                    $(document).ready(function() {
                        $('.datatable').dataTable( {
                            "bPaginate": false,
                            "bFilter": false,
                            "bSort": true
                        });
                    } );
                </script>
                <%--</div>--%>
        </div>
    </div>
</div>
</body>
</html>