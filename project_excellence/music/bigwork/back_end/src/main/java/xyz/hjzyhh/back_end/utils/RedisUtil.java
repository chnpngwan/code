package xyz.hjzyhh.back_end.utils;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import xyz.hjzyhh.back_end.pojo.CommentPO;
import xyz.hjzyhh.back_end.pojo.HistroyPO;
import xyz.hjzyhh.back_end.pojo.UserPO;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Component
public class RedisUtil {
    public RedisUtil(RedisTemplate<String, Object> redisTemplate) {
        RedisUtil.redisTemplate = redisTemplate;
    }

    public static final String PREFIX = "video_";
    private static RedisTemplate<String, Object> redisTemplate;

    public static int getVideoCount() {
        return (int) redisTemplate.opsForValue().get(PREFIX + "videoId");
    }

    public static long getId(String key) {
        return redisTemplate.opsForValue().increment(PREFIX + key);
    }

    public static <T extends UserPO> void setUser(String key, T user) {
        setObj("user_" + key, user);
    }

    public static <T extends UserPO> T getUser(String key) {
        return (T) getObj("user_" + key);
    }

    public static void delUser(String key) {
        delObj("user_" + key);
    }

    public static <T> void setVideo(String key, T video) {
        setObj("video_" + key, video);
    }

    public static <T> T getVideo(String key) {
        return (T) getObj("video_" + key);
    }

    public static void delVideo(String key){delObj("video_"+key);}

    private static <T> void setObj(String key, T obj) {
        setObj(key,obj,5*60);
    }


    private static <T> T getObj(String key) {
        return (T) redisTemplate.opsForValue().get(PREFIX + key);
    }

    private static void delObj(String key) {
        redisTemplate.delete(PREFIX + key);
    }

    /**
     * 添加对象时设置过期时间
     * @param key 键
     * @param obj 值
     * @param time 过期时间:秒
     */
    private static void setObj(String key,Object obj,int time){
        redisTemplate.opsForValue().set(PREFIX + key, obj, time, TimeUnit.SECONDS);
    }

//    private static Map<String,String> getMapByObj(Object obj){
//        Class<?> aClass = obj.getClass();
//        Field[] fields = aClass.getDeclaredFields();
//        Map<String,String> map = new HashMap<>();
//        Arrays.stream(fields).forEach(field -> {
//            try {
//                map.put(field.getName(), (String) field.get(obj));
//            } catch (IllegalAccessException e) {
//                e.printStackTrace();
//            }
//        });
//        return map;
//    }
//
//    private static void hsetObj(String key,Object obj,int time){
//        redisTemplate.opsForHash().putAll(PREFIX +key,getMapByObj(obj));
//        redisTemplate.expire(PREFIX + key,time,TimeUnit.SECONDS);
//    }
//
//    private static Map<Object, Object> hgetObj(String key){
//        return redisTemplate.opsForHash().entries(PREFIX +key);
//    }

    public static void setVerifiCode2Class(int cid,String verifiCode,int time){
        setObj(String.valueOf(cid),verifiCode,time);
        setObj(verifiCode,cid,time);
    }

    public static String getVerifyCode(int cid){
        return getObj(String.valueOf(cid));
    }

    public static int getCidByCode(String code){
        return (int)getObj(code);
    }

    public static class CommentUtils{
        private static String COMMENT_PREFIX = "comment_";
        public static void setComment(long key,CommentPO comment){
            String s = COMMENT_PREFIX+String.valueOf(key);
            setObj(s,comment);
        }

        public static CommentPO getComment(long key){
            String s = COMMENT_PREFIX+String.valueOf(key);
            Object obj = getObj(s);
            if(obj != null)
                return (CommentPO) obj;
            return null;
        }
    }

    public static class HistoryUtils{
        public static String PREFIX = "history_";
        public static void setHistory(long key, HistroyPO history){
            String s = PREFIX+String.valueOf(key);
            setObj(s,history,2*60);
        }

        public static HistroyPO getHistory(long key){
            String s = PREFIX+String.valueOf(key);
            Object obj = getObj(s);
            if(obj != null)
                return (HistroyPO) obj;
            return null;
        }
        public static void delHistory(long key){
            String s = PREFIX+String.valueOf(key);
            delObj(s);
        }
    }
}
