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
        <form class="form-horizontal">
            <div class="form-group">
                <label for="resultType" class="col-sm-2 control-label ">Result Table</label>
                <div class="col-sm-4">
                    <button type="submit" class="btn btn-warning active" id="resultType">txt</button>
                    <button type="submit" class="btn btn-warning active" id="resultType">csv</button>
                </div>

            </div>
            <div class="form-group">
                <label for="inputJobname" class="col-sm-2 control-label">Job Name</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="inputJobname" placeholder="Job Name">
                </div>
            </div>
            <div class="form-group">
                <label for="inputFile" class="col-sm-2 control-label">File Upload</label>
                <div class="col-sm-5">
                    <input type="file" class="btn-warning">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-warning active">Submit</button>
                </div>
            </div>
        </form>
        <button class="btn btn-primary">button</button>

        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>

    </div>
</div>
</body>
</html>