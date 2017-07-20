package com.immue.config;

import com.immue.controller.IndexController;
import com.jfinal.config.*;
import com.jfinal.template.Engine;

public class ImmueConfig extends JFinalConfig {
    public void configConstant(Constants me) {
        me.setDevMode(true);
    }

    public void configRoute(Routes me) {
        me.add("/", IndexController.class,"views");
    }

    public void configEngine(Engine engine) {

    }

    public void configPlugin(Plugins plugins) {

    }

    public void configInterceptor(Interceptors interceptors) {

    }

    public void configHandler(Handlers handlers) {

    }

}
