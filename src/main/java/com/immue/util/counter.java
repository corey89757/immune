package com.immue.util;


import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class counter {
    // 访问计数器Map<IP地址, 次数>
    private static ConcurrentHashMap<String, AtomicInteger> visitCounterMap
            = new ConcurrentHashMap<String, AtomicInteger>();

    // 增加并获取最新的访问次数
    private static int incrementCounter(String clientIp) {
        //
        AtomicInteger visitCounter = visitCounterMap.get(clientIp);
        if (null == visitCounter) {
            visitCounter = new AtomicInteger();
            AtomicInteger oldValue = visitCounterMap.putIfAbsent(clientIp, visitCounter);
            if (null != oldValue) {
                // 使用 putIfAbsent 时注意: 判断是否有并发导致的原有值。
                visitCounter = oldValue;
            }
        }
        // 先增加, 再返回
        int count = visitCounter.incrementAndGet();
        return count;
    }

    // 清除某个IP的访问次数
    private static int clearCounter(String clientIp) {
        visitCounterMap.remove(clientIp);
        return 0;
    }

    //
    private static final String CONST_PARAM_NAME_ACTION = "action";
    private static final String CONST_ACTION_VALUE_CLEAR = "clear";
    //
    private static final String CONST_PARAM_NAME_FORMAT = "format";
    private static final String CONST_FORMAT_VALUE_JSON = "json";
    //
    private static final String CONST_ATTR_NAME_CLIENTIP = "clientIp";
    private static final String CONST_ATTR_NAME_VISITCOUNT = "visitCount";


}
