<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>The Aiping Wu Lab</title>
    <%@include file="common/styles.jsp" %>
    <style>
        .form-inline .dropdown{
            display: inline-block;
        }
    </style>
</head>
<body>
<%@include file="common/header.jsp" %>
<div class="layout">
    <div class="layout-left">
        <%@include file="common/menu.jsp" %>
    </div>
    <div class="layout-main">
        <form class="form-horizontal js-submit-form" onsubmit="return false">
            <div class="form-group">
                <label class="col-sm-2 control-label">Platform</label>
                <div class="col-sm-10 form-inline">
                        <div class="dropdown js-dropdown-control">
                            <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenu1"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="chosen-result">Microarray</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="#" data-target="js-dropdown-1">Microarray</a></li>
                                <li><a href="#" data-target="js-dropdown-2">RNA-seq</a></li>
                            </ul>
                        </div>

                        <div class="dropdown sub-dropdown js-dropdown-1">
                            <button class="btn btn-warning dropdown-toggle subMenu" type="button" id="dropdownMenu2"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                <span class="chosen-result">Please choose...</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <li><a href="#">Affymetric mouse 430 2.0</a></li>
                            </ul>
                        </div>
                        <div class="dropdown sub-dropdown js-dropdown-2 hide">
                            <button class="btn btn-warning dropdown-toggle subMenu" type="button" id="dropdownMenu3"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                <span class="chosen-result">Please choose...</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu3">
                                <li><a href="#">Agilent Whole Mouse Genome Microarray 4x44K v2</a></li>
                                <li><a href="#">Illumina MouseWG-6 v2.0 expression beadchip</a></li>
                            </ul>
                        </div>
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-2 control-label ">Method</label>
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
                <label class="col-sm-2 control-label">File Upload</label>
                <div class="col-sm-10">
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
        $(".dropdown-toggle").dropdown();

        $(".js-dropdown-control").on("click","[data-target]",function (e) {
            var target = $(e.currentTarget).data("target");
            var hideClass = ['js-dropdown-1','js-dropdown-2'][(target == 'js-dropdown-1')|0];
            $(".sub-dropdown." + hideClass).addClass("hide");
            $(".sub-dropdown." + target).removeClass("hide").find(".chosen-result").text("Please choose...");
            //todo 隐藏域赋值
        });

        $(".form-group").on("click",".dropdown-menu li>a",function (e) {
            var ele = $(e.currentTarget),text = ele.text();
            ele.closest(".dropdown").find(".chosen-result").text(text);
            //todo 隐藏域赋值
        });

        $(".js-submit-form").submit(function () {
            debugger
            //todo:这里可以做表单验证
            //如果验证通过，则加载loding状态
            $(".js-submit-form").ajaxSubmit({//TODO 需要引入jquery 表单提交控件
                success:function () {
                    //todo:关闭loding状态，页面跳转到结果页
                }
            });
        });
        /*var menuText = $("#dropdownMenu1").text().trim();
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
        })*/

       /* $(".subMenu").siblings("ul").children("li").click(function () {
            var text = $(this).text();
            $(this).parent("ul").siblings("button").text(text)
        })*/

    })();
</script>
</html>
