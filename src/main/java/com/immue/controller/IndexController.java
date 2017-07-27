package com.immue.controller;

import com.jfinal.core.Controller;
import net.sf.json.JSONObject;

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

        System.out.println("process.........");
        //接收参数


        //处理


        //返回
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("pId", UUID.randomUUID().toString());
        renderJson(jsonObject);
    }

}
