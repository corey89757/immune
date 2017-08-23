<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ImmuCC</title>
    <%@include file="common/styles.jsp" %>
    <style>
        .form-inline .dropdown {
            display: inline-block;
        }

        .loading {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 10;
            background-color: rgba(0, 0, 0, .5);
        }
    </style>
    <script src="${staticPath}/lib/js/js-compr.js" type="text/javascript"></script>
</head>
<body>
<%@include file="common/header.jsp" %>
<div class="layout">
    <div class="layout-left">
        <%@include file="common/menu.jsp" %>
    </div>
    <div class="layout-main" style="padding-left: 15px;padding-right: 15px;">
        <div class="bs-callout bs-callout-primary" id="callout-help-text-accessibility">
            <h4><strong>Welcome to ImmuCC</strong></h4>
            <p>ImmuCC server was developed to predict the tissue immune cell composition
                based on the tissue transcriptomal data of mouse profiled on both microarray and RNA-Seq platforms.
            </p>
        </div>
        <form action="${ctx}/process" method="post" class="form-horizontal js-submit-form" onsubmit="return false"
              enctype="multipart/form-data">

            <input type="hidden" name="species" value="Mouse">
            <div class="form-group row" style="padding-top:8px;padding-left: 18%;">
                <label class="col-sm-2 control-label">Species</label>
                <div class="col-sm-10 form-inline">
                    <div class="dropdown js-dropdown-species-control">
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownSpecies"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="chosen-result">Mouse</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropSpecies">
                            <li><a href="#" data-target="js-dropdown-species-1">Mouse</a></li>
                            <!--<li><a href="#" data-target="js-dropdown-species-2">Human</a></li>-->
                        </ul>
                    </div>
                </div>
            </div>

            <input type="hidden" name="type" value="Microarray">
            <input type="hidden" name="subType" value="">
            <div class="form-group row" style="padding-top:8px;padding-left: 18%;">
                <label class="col-sm-2 control-label">Platform</label>


                <div class="col-sm-10 form-inline">

                    <div class="dropdown js-dropdown-control">
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="chosen-result">Microarray</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <li><a href="#" data-target="js-dropdown-1">Microarray</a></li>
                            <li><a href="#" data-target="js-dropdown-2">RNASeq</a></li>
                        </ul>
                    </div>


                    <div class="dropdown sub-dropdown js-dropdown-1">
                        <button class="btn btn-primary dropdown-toggle subMenu" type="button" id="dropdownMenu2"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            <span class="chosen-result">Please choose...</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                            <li><a href="#">Affymetric mouse 430 2.0</a></li>
                            <li><a href="#">Agilent Whole Mouse Genome Microarray 4x44K v2</a></li>
                            <li><a href="#">Illumina MouseWG-6 v2.0 expression beadchip</a></li>
                        </ul>
                    </div>


                    <div class="dropdown sub-dropdown js-dropdown-2 hide">
                        <button class="btn btn-primary dropdown-toggle subMenu" type="button" id="dropdownMenu3"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            <span class="chosen-result">Please choose...</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu3">
                            <li><a href="#">illumina</a></li>
                        </ul>
                    </div>

                </div>

            </div>

            <div class="form-group" style="padding-top:8px;padding-left: 18%;">
                <label class="col-sm-2 control-label ">Method</label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                        <input type="radio" name="method" id="inlineSVR" value="SVR" checked> SVR
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="method" id="inlineLLSR" value="LLSR">LLSR
                    </label>
                </div>
            </div>
            <div class="form-group" style="padding-top:8px;padding-left: 18%;">
                <label class="col-sm-2 control-label">Job Name</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Job Name" name="jobName">
                </div>
            </div>
            <div class="form-group" style="padding-top:8px;padding-left: 18%;">
                <label class="col-sm-2 control-label">File Upload</label>
                <div class="col-sm-10">
                    <input type="file" class="btn-primary" name="file">
                </div>
            </div>
            <div class="form-group" style="padding-top:8px;padding-left: 18%;">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary active">Run</button>
                </div>
            </div>
        </form>
        <div  class="bs-callout bs-callout-primary" style="margin:0px 0px; margin-top: 35px; padding: 5px; font-size:10px">
            <p><strong>Citation</strong>
            <ul>
                <li>Chen Z, Huang A, Sun J, et al.
                    Inference of immune cell composition on the expression profiles of mouse tissue[J].
                    Scientific reports, 2017, 7: 40508.
                </li>
            </ul>
            </p>
        </div>
    </div>
</div>

<%@include file="common/footer.jsp" %>

<div class="loading" id="loading" style="display: none">
    <div class="nice" style="text-align: center; padding-top: 15%; color: white">
        <h2>Job status: RUNNING</h2>
        <p>
            <span>Running <strong>ImmuCC</strong> job for <span id="txt"></span>
            s, please wait for seconds...
                <!-- <img alt="" style="height:20px;width:20px" src="${staticPath}/img/progress.svg" class="progressImage"/>-->
        </span>
        </p>
    </div>
</div>

<div id="alert-popup" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
     aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="mySmallModalLabel">Small modal</h4>
            </div>
            <div class="modal-body">

            </div>
        </div>
    </div>
</div>
</body>
<%@include file="common/script.jsp" %>
<script>
    (function () {
        var spin = {
            spinner: new Spinner({
                color: "#fff",
                shadow: false,
                lines: 10,
                width: 4
            }),
            show: function () {
                $("#loading").fadeIn(300, function () {
                    this.spinner.spin($("#loading")[0]);
                }.bind(this));
                var c=0;
                var myVar=setInterval(function(){timedCount()},1000);
                function timedCount()
                {
                    document.getElementById("txt").innerHTML=c;
                    c=c+1
                }
            },
            hide: function () {
                $("#loading").fadeOut(300, function () {
                    this.spinner.stop();
                }.bind(this));
            }
        };
        var alertTip = function (title, msg) {
            $("#alert-popup").modal({
                show: true
            });
            $("#alert-popup").one("shown.bs.modal", function () {
                $(this).find(".modal-title").text(title || "title");
                $(this).find(".modal-body").html(msg || "");
            })

        }

        $(".dropdown-toggle").dropdown();

        $(".js-dropdown-species-control").on("click", "[data-target]", function (e) {
            var target = $(e.currentTarget).data("target");
            var hideClass = ['js-dropdown-species-1', 'js-dropdown-species-2'][(target == 'js-dropdown-species-1') | 0];
            //隐藏域赋值
            $("[name='species']").val($(e.currentTarget).text());
        });

        $(".js-dropdown-control").on("click", "[data-target]", function (e) {
            var target = $(e.currentTarget).data("target");
            var hideClass = ['js-dropdown-1', 'js-dropdown-2'][(target == 'js-dropdown-1') | 0];
            $(".sub-dropdown." + hideClass).addClass("hide");
            $(".sub-dropdown." + target).removeClass("hide").find(".chosen-result").text("Please choose...");

            //隐藏域赋值
            $("[name='type']").val($(e.currentTarget).text());
            $("[name='subType']").val("");
        });

        $(".form-group").on("click", ".dropdown-menu li>a", function (e) {
            var ele = $(e.currentTarget), text = ele.text();
            ele.closest(".dropdown").find(".chosen-result").text(text);
            //隐藏域赋值
            var target = $(e.currentTarget).data("target");
            if(text != 'Mouse' && text!='Human'){
                $("[name='" + (target ? "type" : "subType") + "']").val(text);
            }
        });

        $(".js-submit-form").submit(function () {
            var isValid = true, errorMsg = "";

            //todo:这里可以做表单验证
            if (!$("[name='species']").val()) {
                isValid = false;
                errorMsg += "<span class='text-warning'>Please choose a species</span><br/>"
            }

            if (!$("[name='subType']").val()) {
                isValid = false;
                errorMsg += "<span class='text-warning'>Please choose a type of Platform</span><br/>"
            }

            if (!$("[name='jobName']").val()) {
                isValid = false;
                errorMsg += "<span class='text-warning'>Please fill out the Job Name</span><br/>"
            }

            if (!$("[name='file']").val()) {
                isValid = false;
                errorMsg += "<span class='text-warning'>Please upload your file</span><br/>"
            }

            if (isValid === false) {
                alertTip("Errors!", errorMsg);
                return
            }

            //如果验证通过，则加载loding状态
            spin.show();
            $(".js-submit-form").ajaxSubmit({//TODO 需要引入jquery 表单提交控件
                success: function (resp) {
                    //todo:关闭loding状态，页面跳转到结果页
                    location.assign("${ctx}/result?pId=" + resp.pId + "&method=" + resp.method);
                },
                error: function () {

                },
                complete: function () {
                    spin.hide();
                }
            });
        });
    })();
</script>


</html>
