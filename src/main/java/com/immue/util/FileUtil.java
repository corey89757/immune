package com.immue.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

import java.io.*;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jian.wu on 7/31/17.
 */
public class FileUtil {

    protected final static Logger logger = Logger.getLogger(FileUtil.class);


    private static String configHome = System.getenv("immune_home");

    public static String makeFilePath(String jobName) {
        //String fileName = jobName + "_" + UUID.randomUUID().toString().replaceAll("-", "");
        String fileName = jobName;
        //System.out.println("configHome:"+configHome);
        String folderPath = configHome + File.separator + "output" + File.separator + fileName;
        //System.out.println("folderPath:"+folderPath);
        createDir(folderPath);

        String path = folderPath + File.separator + "qxf.array.expression.csv";
        logger.info("[FileUtil][makeFilePath] path : " + path);
        return path;
    }

    public static void fileChannelCopy(File s, File t) {

        FileInputStream fi = null;
        FileOutputStream fo = null;
        FileChannel in = null;
        FileChannel out = null;
        try {
            fi = new FileInputStream(s);
            fo = new FileOutputStream(t);
            in = fi.getChannel();// 得到对应的文件通道
            out = fo.getChannel();// 得到对应的文件通道
            in.transferTo(0, in.size(), out);// 连接两个通道，并且从in通道读取，然后写入out通道
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fi.close();
                in.close();
                fo.close();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 创建目录
     *
     * @param destDirName
     * @return
     */
    private static boolean createDir(String destDirName) {
        File dir = new File(destDirName);
        if (dir.exists()) {// 判断目录是否存在
            logger.error("[FileUtil][createDir] dict already exists");
            return false;
        }
        if (!destDirName.endsWith(File.separator)) {// 结尾是否以"/"结束
            destDirName = destDirName + File.separator;
        }
        if (dir.mkdirs()) {// 创建目标目录
            logger.info("[FileUtil][createDir] new dict success : " + destDirName);
            return true;
        } else {
            logger.error("[FileUtil][createDir] new dict failed");
            return false;
        }
    }

    public static JSONArray readTxtFileToJSONArray(String filePath) {
        try {
            JSONArray result = new JSONArray();
            List<String> titleList = new ArrayList<String>();
            titleList.add("");
            String encoding = "UTF-8";
            File file = new File(filePath);
            if (file.isFile() && file.exists()) { //判断文件是否存在
                InputStreamReader read = new InputStreamReader(
                        new FileInputStream(file), encoding);//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;
                String[] lineTxtArray = null;
                while ((lineTxt = bufferedReader.readLine()) != null) {
//                    System.out.println(lineTxt);
                    lineTxtArray = lineTxt.split("\\s");
                    if (titleList.size() == 1) {//获取标题的值
                        for (String title : lineTxtArray) {
                            titleList.add(title);
                        }
                        continue;
                    }
                    //非标题列
                    JSONObject resultItem = new JSONObject();
                    for (int i = 0, totalCount = lineTxtArray.length; i < totalCount; i++) {
                        resultItem.put(titleList.get(i), lineTxtArray[i]);
                    }
                    result.add(resultItem);
                }
                read.close();
                return result;
            } else {
                System.out.println("找不到指定的文件");
                return null;
            }
        } catch (Exception e) {
            System.out.println("读取文件内容出错");
            e.printStackTrace();
            return null;
        }
    }
}
