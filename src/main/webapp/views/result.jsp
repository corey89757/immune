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
                <div class="col-sm-10">
                    Download&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="submit" class="btn btn-warning active" id="resultType">txt</button>
                    &nbsp;&nbsp;
                    <button type="submit" class="btn btn-warning active" id="resultType">csv</button>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <!--<div style="position:absolute; height:200px; overflow:auto"></div>   overflow-y:hidden-->
                    <div class="table-responsive row pre-scrollable" ><!--row pre-scrollable-->
                        <table class="table  table-bordered table-hover table-condensed">
                            <tr>
                                <th></th>
                                <th>B.Cells</th>
                                <th>CD4.T.Cells</th>
                                <th>CD8.T.Cells</th>
                                <th>Dendritic.Cells</th>
                                <th>Eosinophils</th>
                                <th>Macrophages</th>
                                <th>Mast.Cells</th>
                                <th>Monocytes</th>
                                <th>Neutrophils</th>
                                <th>NK.Cells</th>
                                <th>P-value</th>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>SRR1177063</th>
                                <td>8.1901</td>
                                <td>0</td>
                                <td>1.4462</td>
                                <td>0</td>
                                <td>13.1086</td>
                                <td>1.1317</td>
                                <td>0.2006</td>
                                <td>3.3502</td>
                                <td>72.3246</td>
                                <td>0.0628</td>
                                <td>0</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="resultPicType" class="col-sm-2 control-label ">Result Picture</label>
                <div class="col-sm-10">
                    Download&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="submit" class="btn btn-warning active" id="resultPicType">pdf</button>
                    &nbsp;&nbsp;
                    <button type="submit" class="btn btn-warning active" id="resultPicType">jpeg</button>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <img src="C:/Users/quanlijun/Desktop/web/test.jpeg" class="img-responsive" alt="Responsive image">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>