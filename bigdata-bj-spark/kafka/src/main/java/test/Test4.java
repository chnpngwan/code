package test;

import java.util.Arrays;
import java.util.List;

public class Test4 {
    public static void main(String[] args) {

        // TODO IN: zhangsan, lisi, wangwu
        // TODO Out : Zhangsan, Lisi, Wangwu
        final List<String> names = Arrays.asList("zhangsan", "lisi", "wangwu");
        for (String name : names) {
            String newName = headerUpper1(name);
            System.out.println(newName);
        }
    }
    private static String headerUpper1( String name ) {

        final String s1 = name.substring(0, 1);
        final String s2 = s1.toUpperCase();
        final String s3 = name.substring(1);

        return s2 + s3;
//
//
//        return name.substring(0, 1).toUpperCase() + name.substring(1);
    }
//    private static String headerUpper2( RDD name ) {
//
//        final RDD s1 = name.substring(0, 1);
//        final RDD s2 = s1.toUpperCase();
//        final RDD s3 = name.substring(1);
//
//        return s2 + s3;
////
////
////        return name.substring(0, 1).toUpperCase() + name.substring(1);
//    }
}
