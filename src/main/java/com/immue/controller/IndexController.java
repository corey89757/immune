package com.immue.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.immue.util.FileUtil;
import com.immue.util.RUtil;
import com.immue.util.SentEmail;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

import java.io.*;
import java.util.UUID;
import javax.mail.MessagingException;

public class IndexController extends Controller {

    public void index() {
        renderJsp("index.jsp");
    }

    //public void analysis() {
    //    System.out.printf("analysis...........");
    //    renderJsp("analysis.jsp");
    //}

    public void contact() {
        System.out.printf("contact...........");
        renderJsp("contact.jsp");
    }

    public void manual() {
        System.out.printf("manual...........");
        renderJsp("manual.jsp");
    }

    public void result() throws IOException {
        System.out.printf("result...........\n");
        String jobName = getPara("jobName");
        System.out.println("[result] jobName : " + jobName);
        String pId = jobName + getPara("pId");
        System.out.println("[result] pId : " + pId);
        String method = getPara("method");
        System.out.println("[result] method : " + method);

        String workHome = RUtil.configHome + File.separator + "output" + File.separator + pId;

        String txtFile = null;
        String csvFile = null;
        String jpegFile = null;
        String pdfFile = null;

        if (method.equals("SVR")) {
            txtFile = workHome + File.separator + "result.SVR" + ".txt";
            csvFile = pId + File.separator + "result.SVR" + ".csv";
            jpegFile = pId + File.separator + "Bar plot of resultusingSVR" + ".jpeg";
            pdfFile = pId + File.separator + "Bar plot of resultusingSVR" + ".pdf";
        } else if (method.equals("LLSR")) {
            txtFile = workHome + File.separator + "result.LLSR" + ".txt";
            csvFile = pId + File.separator + "result.LLSR" + ".csv";
            jpegFile = pId + File.separator + "Bar plot of resultusingLLSR" + ".jpeg";
            pdfFile = pId + File.separator + "Bar plot of resultusingLLSR" + ".pdf";
        }

        System.out.println("[result] txtFile : " + txtFile +
                "\ncsvFile : " + csvFile +
                "\njpegFile : " + jpegFile +
                "\npdfFile : " + pdfFile);
        JSONArray formData = FileUtil.readTxtFileToJSONArray(txtFile);

        if (method.equals("SVR")) {
            txtFile = pId + File.separator + "result.SVR" + ".txt";
        } else if (method.equals("LLSR")) {
            txtFile = pId + File.separator + "result.LLSR" + ".txt";
        }

        setAttr("formData", formData);
        setAttr("txtFile", txtFile);
        setAttr("csvFile", csvFile);
        setAttr("jpegFile", jpegFile);
        setAttr("pdfFile", pdfFile);
        setAttr("jobName", jobName);
        setAttr("pId", pId);

        String errorFile = RUtil.configHome + File.separator + "output" + File.separator + pId + File.separator + "result.err";
        File errTxt = new File(errorFile);

        String testFile = RUtil.configHome + File.separator + "output" + File.separator + txtFile;
        File testTxt = new File(testFile);
        if (errTxt.isFile() && errTxt.exists()) { //判断文件是否存在
            String encoding = "GBK";
            InputStreamReader read = new InputStreamReader(new FileInputStream(errTxt), encoding);//考虑到编码格式
            BufferedReader bufferedReader = new BufferedReader(read);
            String lineTxt = null;
            String allTxt = "";
            while ((lineTxt = bufferedReader.readLine()) != null) {
                allTxt += lineTxt;
            }
            read.close();
            setAttr("errFile", allTxt);
            renderJsp("errorpage.jsp");
        } else if (testTxt.isFile() && testTxt.exists()) {
            String figFile = RUtil.configHome + File.separator + "output" + File.separator + jpegFile;
            File figTxt = new File(figFile);
            if (figTxt.isFile() && figTxt.exists()) {
                renderJsp("result.jsp");
            } else {
                renderJsp("nofigresult.jsp");
            }
        } else {
            String allTxt = "There are some errors in input file";
            setAttr("errFile", allTxt);
            renderJsp("errorpage.jsp");
        }

    }


    public void download() {
        String path = getPara("path");
        String filePath = RUtil.configHome + File.separator + "output" + File.separator + path;
        File file = new File(filePath);
        renderFile(file);
    }

    public void process() throws IOException, InterruptedException, MessagingException {
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        //接收参数
        UploadFile uploadFile = getFile("file");
        String type = getPara("type");
        String subType = getPara("subType");
        String method = getPara("method");
        String jobName = getPara("jobName");
        String species = getPara("species");
        String replyEmail = getPara("replyEmail");
        File file = uploadFile.getFile();

        if (jobName.equals("")) {
            jobName = "yourImmuCC";
        }

        System.out.println("[process] type : " + type
                + "\nsunType : " + subType
                + "\nmethod : " + method
                + "\njobName : " + jobName
                + "\nfile : " + file.getName()
                + "\nspecies : " + species
                + "\nreplyEmail: " + replyEmail);

        //保存文件到immue_home/[jobName+UUID]/jobName+UUID,后期R语言的输出结果也可以保存在immue_home/[jobName+UUID] 文件夹中

        String pId = UUID.randomUUID().toString().replaceAll("-", "");
        System.out.println("[process] pId:" + pId);
        try {
            File t = new File(FileUtil.makeFilePath(jobName + pId));
            try {
                t.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
            FileUtil.fileChannelCopy(file, t);
            file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }

        //发送邮件
        SentEmail.confirmationEmail(replyEmail, method, pId, jobName);
        //处理
        //RUtil.callRMethod();
        RUtil.doRImmune(type, subType, method, jobName + pId);
        //发送邮件
        SentEmail.resultEmail(replyEmail, method, pId, jobName);

        //返回
        JSONObject jsonObject = new JSONObject();
        //jsonObject.put("pId", UUID.randomUUID().toString());
        jsonObject.put("jobName", jobName);
        jsonObject.put("pId", pId);
        jsonObject.put("method", method);
        renderJson(jsonObject);
    }
}
