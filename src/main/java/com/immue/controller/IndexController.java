package com.immue.controller;

import com.jfinal.core.Controller;

public class IndexController extends Controller {

    public void index(){
        renderJsp("index.jsp");
    }

    public void analysis(){
        System.out.printf("analysis...........");
        renderJsp("analysis.jsp");
    }
    public void manual(){
        System.out.printf("manual...........");
        renderJsp("manual.jsp");
    }
}
