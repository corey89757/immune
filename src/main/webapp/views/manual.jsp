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
            <h2 class="bg-info" style="text-align:center">Overview</h2>
            <p align="justify">ImmuCC server was developed to estimate the relative immune cell compositions in mouse tissue from the transcriptomal data profiled on both microarray and RNA-Seq platforms.
                Two main sections in this manual were briefly summarized to show how to use the ImmuCC web server, including data processing part and results presentation part.
                In consideration of the importance of the input data format, the pre-processing methods for the raw transcriptomal data are also described in the data processing section.
            </p>
            <h2  class="bg-info" style="text-align:center">Data Processing</h2>
            <ol>
                <h4><strong><li>Parameter selection</li></strong></h4>
                <ol type="i">
                    <strong><li>Platform</li></strong>
                    <p align="justify">The ImmuCC web server can be applied to different types of transcriptomal data profiled on microarray or RNA-Seq (Illumina) technology.
                        The microarray platform further involves Affymetric mouse 430 2.0, Illumina MouseWG-6 v2.0 expression beadchip and Agilent Whole Mouse Genome Microarray 4x44K v2.
                        Users should exactly choose the suited platform according to their experiments.
                    </p>
                    <strong><li>Method</li></strong>
                    <p align="justify">Two machine-learning methods, support vector regression (SVR) and linear least square regression (LLSR),
                        can be freely selected to infer the tissue immune cell compositions.
                        The performance evaluation of these two methods will be shown in our reference paper.
                    </p>
                </ol>

                <h4><strong><li> Transcriptomal data</li></strong></h4>
                <p align="justify">Figure 1 gives an example of the input file for transcriptomal data profiled on RNA-Seq.
                    Each column denotes an expression profile of a single sample and each row label corresponds to a particular gene.
                    Users should note that the gene name of microarray data is Entrez IDs,
                    while the gene name of RNASeq data is Ensemble gene IDs.
                    An example of transcriptome data can be downloaded
                    <b><a href="${staticPath}/download/qxf.rnaseq.expression.csv" target="_blank">here</a></b>.
                </p>
                <img src="${staticPath}/img/expressionMatrix.png" class="img-responsive center-block" alt="Responsive image">
                <br>
                <p style="text-align: center"><b>Figure 1</b>: The input format of the transcriptomal data.</p>

                <h4><strong><li>Pre-processing method for raw data</li></strong></h4>
                <p align="justify">How to gain the standard input of ImmuCC for microarray or RNA-Seq data?
                    The different platforms have the different pipelines.
                </p>
                <ol type="i">
                    <strong><li>Microarray data pre-processing pipeline</li></strong>
                    <p align="justify">The raw microarray files are Affy CEL files, Agilent TXT files, etc.
                        A guide for pre-processing these raw data to meet the rule of ImmuCC input format was described in
                        <b><a href="https://github.com/chenziyi/ImmuCC/blob/master/webserver/array_pre-procession.R" target="_blank">Github</a></b>.
                    </p>
                    <strong><li>RNA-Seq data pre-processing pipeline</li></strong>
                    <p align="justify">The raw RNA-Seq data is fastq format.
                        A script for pre-processing the raw data to input format can be downloaded <b><a href="${staticPath}/download/ExampleFIle_scripts.tar.gz">here</a></b>
                        and <b><a href="https://github.com/chenziyi/ImmuCC/blob/master/webserver/RNASeq_pipeline.sh" target="_blank">Github</a></b>
                    </p>
                </ol>
            </ol>
            <h2  class="bg-info" style="text-align:center">Results Presentation</h2>
            <p align="justify"> After users have submitted their jobs, a confirmation email will be sent to their email box.
                The ImmuCC will take a few minutes to predict the tissue immune cell compositions if there are sample less than 10.
                Once the job is finished, an auto reminding email with results page URL will also be sent to the user.
                If users have been patiently waiting for the prediction, the results page of the estimated relative immune cell compositions of tissue samples will be displayed after the job is finished.
                An example of the results was shown in Figures 2 and 3.
            </p>
            <img src="${staticPath}/img/calculateResult.png" class="img-responsive center-block" alt="Responsive image">
            <br>
            <p style="text-align: center"><b>Figure 2</b>: The table of estimated immune cell compositions.</p>
            <p align="justify"> For the result described in the above table 2, each column represents one kind of immune cell type,
                and each row shows the fractions of immune cell types in this tissue sample.
                The sum of each row is 100. Here, the inferred immune cell compositions are available for downloading in CSV file format or txt format.
            </p>
            <img src="${staticPath}/img/barPlotResult.jpg" style="max-width: 60%" class="img-responsive center-block" alt="Responsive image">
            <br>
            <p style="text-align: center"><b>Figure 3</b>: The bar plot of estimated immune cell compositions.</p>
            <p align="justify">
                If the number of samples is less than 10, a bar plot will also be provided online.
                Users can also download it in the pdf or jpg format.
            </p>
            <h2  class="bg-info" style="text-align:center">Citations</h2>
            <ol>
                <li><p>For microarray data analysis, please cite:</p>
                    <p align="justify">Chen Z, Huang A, Sun J, Jiang T, Qin F.X, Wu A.
                        Inference of immune cell composition on the expression profiles of mouse tissue[J].
                        Scientific reports, 2017, 7: 40508.
                    </p>
                </li>
                <li><p>For RNA-Seq data analysis, please cite:</p>
                    <p align="justify">Chen Z, Quan L, Huang A, Zhao Q, Yuan Y, Yuan X, Shen Q, Shang J, Ben Y, Qin FX-F and Wu A
                    (2018) seq-ImmuCC: Cell-Centric View of Tissue Transcriptome Measuring Cellular Compositions of Immune Microenvironment From Mouse RNA-Seq Data.
                    Front. Immunol. 9:1286. doi: 10.3389/fimmu.2018.01286.
                    </p>
                </li>
            </ol>
        </div>
    </div>
</div>

<%@include file="common/footer.jsp" %>
</body>
</html>