<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>The Aiping Wu Lab</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #allmap{width:100%;height:320px;}
        p{margin-left:5px; font-size:14px;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=VWaNfQyFKkeNP1g148zuNeul"></script>
</head>
    <%@include file="common/styles.jsp" %>
</head>
<body>
<%@include file="common/header.jsp" %>
<div class="layout">
    <div class="layout-left">
        <%@include file="common/menu.jsp" %>
    </div>
    <div class="layout-main">
        <div class="row" style="margin: 15px">
            <div class="col-md-6">
                <h3 style="color:#6897bb">Contact Us:</h3>
                <address>
                    <strong>Suzhou Institute of Systems Medicine</strong><br>
                    Room 501, Building B5, 218 Xinghu Street<br>
                    Suzhou Industrial Park, Suzhou, China, 215123<br>
                    <abbr title="Phone">P:</abbr> +86-512-62873529<br>
                </address>

                <address>
                    <strong>Prof Aiping Wu</strong><br>
                    Email: <a href="mailto:#">wap@ism.cams.cn</a><br>
                    <a href="http://www.ismsz.cn/Index/EPage/98169fc1-0d89-4e02-b356-a099af3e0565" style="color: #6897bb" target="_blank">Aiping Wu's Lab</a>
                </address>

                <address>
                    <strong>Prof F.xiaofeng Qin</strong><br>
                    Email: <a href="mailto:#">sjz@ism.cams.cn</a><br>
                    <a href="http://www.ismsz.cn/Index/EPage/98169fc1-0d89-4e02-b356-a099af3e0565" style="color: #6897bb" target="_blank">Frank Xiaofeng Qin's Lab</a>
                </address>
            </div>
            <div class="col-md-6">
                <div id="allmap"></div>
            </div>
        </div>
    </div>
</div>

<%@include file="common/footer.jsp" %>
</body>
</html>

<script type="text/javascript">
    //搜索范围
    var radius = 1000;
    var map = new BMap.Map("allmap");
    //中心点
    var mPoint = new BMap.Point(120.740542,31.267529);
    map.enableScrollWheelZoom();
    map.centerAndZoom(mPoint,14);//缩放级别

    //画个圈圈
    var circle = new BMap.Circle(mPoint,radius,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
    map.addOverlay(circle);


    //搜半径内的地铁站
    var local =  new BMap.LocalSearch(map, {renderOptions: {map: map, autoViewport: false,panel: "r-result"}});
    local.searchNearby('苏州系统医学研究所',mPoint,radius);
</script>
