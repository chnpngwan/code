public class Person {

    private Integer id;
    private String name;

    // TODO 观察对比定义 echo 和 hello 方法的不同

    /**
     * Comment 方法注释
     * @param content 输入的内容
     * @return 返回的内容
     */
    public /* 补充定义 echo() 方法 */ {

        System.out.println(content);

        return content;
    }

    public void hello() {

        System.out.println("你好，中国。");
    }

    /**
     * main 方法是程序的入口
     * @param args
     */
    public static void main(String[] args) {

        Person person = new Person();

        String content = "台湾是中国不可分割的一部分！";

        // TODO 完善以下调用方法，对比不同

        /* 补充调用 hello() 方法 */
        /* 补充调用 echo() 方法 */
    }
}