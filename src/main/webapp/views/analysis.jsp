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
                <label for="platformSelect" class="col-sm-2 control-label">Platform</label>
                <div class="col-sm-10">
                    <div class="btn-group">
                        <div class="dropdown">
                            <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenu1"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="#">Microarray</a></li>
                                <li><a href="#">RNA-seq</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="btn-group">
                        <div class="dropdown">
                            <button class="btn btn-warning dropdown-toggle subMenu" type="button" id="dropdownMenu2"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                Please choose...
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <li><a href="#">Affymetric mouse 430 2.0</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="btn-group">
                        <div class="dropdown">
                            <button class="btn btn-warning dropdown-toggle subMenu" type="button" id="dropdownMenu3"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                Please choose...
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu3">
                                <li><a href="#">Agilent Whole Mouse Genome Microarray 4x44K v2</a></li>
                                <li><a href="#">Illumina MouseWG-6 v2.0 expression beadchip</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="methodSelect" class="col-sm-2 control-label ">Method</label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                        <input type="radio" name="inlineRadioOptions" id="inlineSVR" value="SVR"> SVR
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="inlineRadioOptions" id="inlineLLSR" value="LLSR">LLSR
                    </label>
                    <p>The emaile account to reveive the calculated result.</p>
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
                    <button type="submit" class="btn btn-warning active">Run</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<%@include file="common/script.jsp" %>
<script>
    (function () {
        var menuText = $("#dropdownMenu1").text().trim();
        if (!menuText) {
            $("#dropdownMenu1").text($("#dropdownMenu1").siblings("ul").find("a").first().text())
            $("#dropdownMenu3").hide()
        }

        $("#dropdownMenu1").siblings("ul").children("li").click(function () {
            var text = $(this).text();
            $("#dropdownMenu1").text(text)
            if (text == 'Microarray') {
                $("#dropdownMenu2").show()
                $("#dropdownMenu3").hide()
            } else {
                $("#dropdownMenu2").hide()
                $("#dropdownMenu3").show()
            }
            $(".subMenu").text("Please choose...");
        })

        $(".subMenu").siblings("ul").children("li").click(function () {
            var text = $(this).text();
            $(this).parent("ul").siblings("button").text(text)
        })

    })();
</script>
</html>
