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
        <div style="margin: 30px">
            <h2 class="bg-info" style="text-align:center"><strong>Overview</strong></h2>
            <p>This manual here will give a brief introduction for the usage of our web server including: input file format, the raw transcriptomal data pre-processing method and the result format.
                Here, an example transcriptomal data profiled on RNA-Seq were used to demonstrate them, all the example files used in the web server can be downloaded from in
                <b><a href="https://github.com/chenziyi/ImmuCC/tree/master/webserver" target="_blank">Github</a></b>.</p>
            <h2  class="bg-info" style="text-align:center"><strong>Data Analysis</strong></h2>
            <ol>
                <h4><strong><li> Raw data pre-processing method</li></strong></h4>
                    <ol type="i">
                        <strong><li>Microarray data analysis pipeline</li></strong>
                        <p>The pipeline of raw microarray data pre-processing were listed in <b><a href="https://github.com/chenziyi/ImmuCC/blob/master/Deconvolution.R" target="_blank">Github</a></b>.
                        </p>
                        <strong><li>RNA-Seq data analysis pipeline</li></strong>
                        <p>Raw sequencing data were first analyzed with FastQC and the quality control was performed using Trimmomatic.
                            The trimmed reads were then mapped to the reference genome (Mus_musculus.GRCm38 v80) using STAR and quantified by HTSeq.
                        </p>
                    </ol>
                <h4><strong><li> Sample expression File</li></strong></h4>
                    <p>The sample expression profile is the input file, with each data column consisting of the expression profile for a single mixture.
                        Each row corresponds to the expression values of a given gene in all the mixtures.
                        The microarray data requires an Entrez IDs as the associated gene names and the RNASeq data should be Ensemble IDs.
                        Below is a snapshot of the RNASeq data format used in our web server.
                    </p>
                    <img src="${staticPath}/img/expressionMatrix.png" class="img-responsive center-block" alt="Responsive image">
                    <br>
                    <p style="text-align: center"><b>Figure 1</b>: Format of the input expression matrix</p>
                <h4><strong><li>Parameter selection</li></strong></h4>
                    <ol type="i">
                        <strong><li>Platform</li></strong>
                        <p>The web server can be applied to the calculation of data sets profiled on both microarray and RNA-Seq technology,
                            you can choose one based on the transcriptomic technologies used in your experiment.
                        </p>
                        <strong><li>Method</li></strong>
                        <p>There are two machine learning methods here can be selected in your analysis.
                            The performance of those two method were in our research paper(unpublished).
                        </p>
                    </ol>
            </ol>
            <h2  class="bg-info" style="text-align:center"><strong>Result</strong></h2>
            <p> When the job is finished, a result in a table format and a bar plot from the result will be present on the web page and can be downloaded directly,
                the example result were like the one shown below:
            </p>
            <img src="${staticPath}/img/calculateResult.png" class="img-responsive center-block" alt="Responsive image">
            <br>
            <p style="text-align: center"><b>Figure 2</b>: Format of the calculated result</p>
            <img src="${staticPath}/img/barPlotResult.jpg" style="max-width: 60%" class="img-responsive center-block" alt="Responsive image">
            <br>
            <p style="text-align: center"><b>Figure 3</b>: Bar plot from the calculated result</p>
        </div>
    </div>
</div>

<%@include file="common/footer.jsp" %>
</body>
</html>