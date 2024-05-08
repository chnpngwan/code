package test;

import java.util.*;

public class Test1 {
    public static void main(String[] args) {

        // TODO 泛型和类型有什么区别？
        //      泛型不可变
        //      ArrayList是数据容器吗？不是数据容器，是数据操作的工具对象
        List<String> stringList = new ArrayList<String>();
        String name = "abc";

        //String[] ss = new String[3];

        // TODO 多态和泛型无关，只和类型相关
        //      袋子（水果） -> 袋子（榴莲）
        test(stringList);
    }
    public static void test( Collection<String> objs ) {
        System.out.println(objs);
    }
}
class Outer<T> {
    public T inner;
}