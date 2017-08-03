package com.immue.controller;

import com.immue.util.FileUtil;
import com.immue.util.RUtil;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class IndexController extends Controller {

    public void index() {
        renderJsp("index.jsp");
    }

    public void analysis() {
        System.out.printf("analysis...........");
        renderJsp("analysis.jsp");
    }

    public void result() {
        System.out.printf("result...........");
        String pId = getPara("pId");
        System.out.println("[result] pId : " + pId);
        String method = getPara("method");
        System.out.println("[result] method : " + method);

        String workHome = RUtil.configHome + File.separator + "output" + File.separator + pId;

        String txtFile = null;
        String csvFile = null;
        String jpegFile = null;
        String pdfFile = null;

        if (method.equals("SVR")){
            txtFile = workHome + File.separator + "result.svr" + ".txt";
            csvFile = pId + File.separator + "result.svr" + ".csv";
            jpegFile = pId + File.separator + "Bar plot of resultusingsvr" + ".jpeg";
            pdfFile = pId + File.separator + "Bar plot of resultusingsvr" + ".pdf";
        }
        else if (method.equals("LLSR")){
            txtFile = workHome + File.separator + "result.llsr" + ".txt";
            csvFile = pId + File.separator + "result.llsr" + ".csv";
            jpegFile = pId + File.separator + "Bar plot of resultusingllsr" + ".jpeg";
            pdfFile = pId + File.separator + "Bar plot of resultusingllsr" + ".pdf";
        }

        System.out.println("[result] txtFile : " + txtFile +
                "\ncsvFile : " + csvFile +
                "\njpegFile : " + jpegFile +
                "\npdfFile : " + pdfFile);
        JSONArray formData = FileUtil.readTxtFileToJSONArray(txtFile);
        if (method.equals("SVR")) {
            txtFile = pId + File.separator + "result.svr" + ".txt";
        }else if(method.equals("LLSR")){
            txtFile = pId + File.separator + "result.llsr" + ".txt";
        }
        System.out.println(formData);
        setAttr("formData", formData);
        setAttr("txtFile", txtFile);
        setAttr("csvFile", csvFile);
        setAttr("jpegFile", jpegFile);
        setAttr("pdfFile", pdfFile);
        renderJsp("result.jsp");
    }


    public void download() {
        String path = getPara("path");
        String filePath = RUtil.configHome + File.separator + "output" + File.separator + path;
        File file = new File(filePath);
        renderFile(file);
    }

    public void manual() {
        System.out.printf("manual...........");
        renderJsp("manual.jsp");
    }


    public void process() throws IOException, InterruptedException {
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
        File file = uploadFile.getFile();

        System.out.println("[process] type : " + type
                + "\nsunType : " + subType
                + "\nmethod : " + method
                + "\njobName : " + jobName
                + "\nfile : " + file.getName());

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

        //处理
        //RUtil.callRMethod();
        RUtil.doRImmune(type, subType, method, jobName + pId);

        //返回
        JSONObject jsonObject = new JSONObject();
        //jsonObject.put("pId", UUID.randomUUID().toString());
        jsonObject.put("pId", jobName + pId);
        jsonObject.put("method", method);
        renderJson(jsonObject);
    }
}
