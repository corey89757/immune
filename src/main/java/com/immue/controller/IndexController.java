package com.immue.controller;

import com.immue.util.FileUtil;
import com.immue.util.RUtil;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;
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
        renderJsp("result.jsp");
    }

    public void manual() {
        System.out.printf("manual...........");
        renderJsp("manual.jsp");
    }


    public void process() {
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
        try {
            File t = new File(FileUtil.makeFilePath(jobName));
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
        RUtil.callRMethod();

        //返回
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("pId", UUID.randomUUID().toString());
        renderJson(jsonObject);
    }

}
