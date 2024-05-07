package xyz.hjzyhh.back_end.utils;

import xyz.hjzyhh.back_end.annotation.ConvertIgnore;
import xyz.hjzyhh.back_end.annotation.NoSample;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.vo.UserVO;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

// PO转化为VO的工具类
public class VOUtil {
    private VOUtil() {
    }

    public static UserVO of(UserPO user) {
        if(user == null) return null;
        return swap(user,UserVO.class);
    }

    private static Field getFiledByName(Field[] fields, String fieldName){
        String key = fieldName.toUpperCase();
        for(Field field : fields){
            String name = field.getName();
            if (name.replace("_","").toUpperCase().equals(key)) {
                return field;
            }
        }
        return null;
    }

    public static <IN, OUT> OUT swap(IN in, Class<OUT> clazz) {
        OUT out = null;
        try {
            out = clazz.newInstance();
            Field[] fields = clazz.getDeclaredFields();
            Field[] outFields = in.getClass().getDeclaredFields();
            for (Field field : fields) {
                if(field.getAnnotation(ConvertIgnore.class) != null){
                    continue;
                }
                String name = field.getName();
                Field outField = getFiledByName(outFields, name);
                if(outField == null){
                    continue;
                }
                if(outField.getAnnotation(ConvertIgnore.class) != null){
                    continue;
                }
                NoSample typeCon = outField.getAnnotation(NoSample.class);
                NoSample noSample = field.getAnnotation(NoSample.class);
                if((typeCon==null && noSample != null) || (typeCon!=null && noSample == null)){
                    continue;
                }

                outField.setAccessible(true);
                field.setAccessible(true);
                Object value = outField.get(in);

                if(typeCon!=null){
                    if(value == null){
                        continue;
                    }
                    Class<?> aClass = field.getType();
                    if (aClass.equals(outField.getType())) {
                        field.set(out,value);
                    }else {
                        value = swap(value, aClass);
                    }
                }
                field.set(out,value);
            }
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return out;
    }


}
