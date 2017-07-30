package com.immue.util;

import org.rosuda.JRI.REXP;
import org.rosuda.JRI.RList;
import org.rosuda.JRI.RVector;
import org.rosuda.JRI.Rengine;

import java.util.Arrays;

public class RUtil {

    public static void doRImmune(String x,String y){
        
    }

    public static void callRMethod() {
        // R文件全路径
        String filePath = "C:\\R\\1.R";

        // 初始化R解析类
        Rengine engine = new Rengine(null, false, null);
        System.out.println("Rengine created, waiting for R");

        // 等待解析类初始化完毕
        if (!engine.waitForR()) {
            System.out.println("Cannot load R");
            return;
        }
        // 将文件全路径复制给R中的一个变量
        engine.assign("fileName", filePath);
        // 在R中执行文件。执行后，文件中的两个函数加载到R环境中，后续可以直接调用
        engine.eval("source文件执行完毕\n" +
                "[REAL* (100.0)]\n" +
                "100.0(fileName)");
        System.err.println("R文件执行完毕");

        {
            // 直接调用无参的函数，将结果保存到一个对象中
            REXP rexp = engine.eval("test_no_param()");
            System.err.println(rexp);
            // 已知返回值的类型，故将其转换为double，供其他代码使用
            double d = rexp.asDouble();
            System.err.println(d);
            System.err.println("---------------1");
        }

        {
            // 定义一个数组，与R中c1集合对应
            String[] arr1 = new String[]{"a", "b", "c"};
            // 将数组复制给R中的变量c1。R中变量无需预先定义
            engine.assign("c1", arr1);

            // 定义一个数组，与R中c2集合对应
            double[] arr2 = new double[]{1, 2, 3};
            // 将数组复制给R中的变量c2
            engine.assign("c2", arr2);
            // 将c1 c2连接为一个集合（R中的数据集，类似java的list），赋值给一个变量
            engine.eval("x <- data.frame(c1, c2)");
            // 将一个数值保存到一个变量中
            engine.eval("y <- 10");

            // 入参为list，出参为list。调用R中函数，将结果保存到一个对象中。
            REXP rexp = engine.eval("test_param_list(x, y)");
            System.err.println(rexp);

            // 解析rexp对象，转换数据格式

            // list的标题
            RList list = rexp.asList();
            String[] key = list.keys();
            System.err.println(Arrays.toString(key));
            if (key != null) {
                int i = 0;
                while (i < key.length) {
                    i++;
                }
            }
            // list的数据
            RVector v = rexp.asVector();
            for (int i = 0; i < v.size(); i++) {
                REXP rexpTemp = (REXP) v.get(i);
                if (REXP.INTSXP == rexpTemp.rtype) {
                    int[] arr = rexpTemp.asIntArray();
                    System.err.println(Arrays.toString(arr));
                } else if (REXP.STRSXP == rexpTemp.rtype) {
                    String[] arr = rexpTemp.asStringArray();
                    System.err.println(Arrays.toString(arr));
                } else if (REXP.REALSXP == rexpTemp.rtype) {
                    double[] arr = rexpTemp.asDoubleArray();
                    System.err.println(Arrays.toString(arr));
                }
            }
            System.err.println("---------------2");
        }

        engine.stop();
    }

    public static void main(String[] args) {
        RUtil.callRMethod();
    }
}
