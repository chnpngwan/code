package test;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.function.Consumer;

public class Test3 {
    public static void main(String[] args) {

        List<String> names = Arrays.asList("zhangsan", "lisi", "wangwu");
//
//        for ( int i = 0; i < names.size(); i++ ) {
//            System.out.println(names.get(i));
//        }
        //----------------------------------------
//        for (String name : names) {
//            System.out.println(name);
//        }
//
//        final Iterator<String> iterator = names.iterator();
//        while ( iterator.hasNext() ) {
//            final String next = iterator.next();
//            System.out.println(next);
//        }
        // -----------------------------------------
//        names.forEach(new Consumer<String>() {
//            @Override
//            public void accept(String s) {
//                System.out.println(s);
//            }
//        });
        // TODO forEach方法是JDK1.8后出现的方法
        //      如果数据处理过程中的接口操作使用了注解：FunctionalInterface，那么说明这个数据的处理可以简化为lambda表达式
        //      所谓的lambda表达式其实就来自于scala语法函数式语法 : IN -> Out
//        names.forEach(
//                (s) -> {
//                    System.out.println(s);
//                }
//        );
        // TODO 1. 如果函数的逻辑代码只有一行，那么大括号可以省略
        //           大括号可以和分号同时省略
//        names.forEach(
//                (s) ->  System.out.println(s)
//        );
        // TODO 2. 如果输入的参数列表中的参数个数只有一个，那么小括号可以省略
//        names.forEach(
//                s ->  System.out.println(s)
//        );
        // TODO 3. 如果输入参数在逻辑代码中只使用了一次，那么参数和箭头可以省略
        names.forEach(System.out::println);

    }
}
