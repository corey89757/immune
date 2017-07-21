package com.immue.controller;

import com.jfinal.core.Controller;

public class HomeController extends Controller {
    public void index(){
        renderJsp("home.jsp");
    }
}
