package com.immue.controller;

import com.jfinal.core.Controller;

public class IndexController extends Controller {

    public void index(){
        renderJsp("index.jsp");
    }

    public void home(){
        System.out.printf("home...........");
        renderJsp("home.jsp");
    }

    public void analysis(){
        System.out.printf("analysis...........");
        renderJsp("analysis.jsp");
    }
}
