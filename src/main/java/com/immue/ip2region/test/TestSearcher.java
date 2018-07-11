package com.immue.ip2region.test;

import com.immue.ip2region.DataBlock;
import com.immue.ip2region.DbConfig;
import com.immue.ip2region.DbSearcher;
import org.apache.commons.lang.StringUtils;

import java.lang.reflect.Method;


/**
 * project test script
 *
 * @author chenxin<chenxin619315@gmail.com>
 */
public class TestSearcher {
    public static void main(String[] argv) {
        try {
            String ip = "176.122.138.95";
//            String ip = "58.211.152.245";

            DbConfig config = new DbConfig();
            DbSearcher searcher = new DbSearcher(config, "src/main/resources/ip2region.db");
            Method method = searcher.getClass().getMethod("btreeSearch", String.class);

            DataBlock dataBlock = (DataBlock) method.invoke(searcher, ip);
            System.out.println("total result : " + dataBlock.toString());
            System.out.println("region : " + dataBlock.getRegion());
            System.out.print("country : " + StringUtils.substringBefore(dataBlock.getRegion(), "|"));

            /*total result : 0|美国|0|加利福尼亚|洛杉矶|0|27053
            region : 美国|0|加利福尼亚|洛杉矶|0
            country : 美国*/

            /*total result : 1057|中国|0|江苏省|苏州市|电信|98143
            region : 中国|0|江苏省|苏州市|电信
            country : 中国*/

            searcher.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
