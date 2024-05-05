/**
 * @Author 老刘
 * @Description 关注全网ID：@老刘大数据
 * @Mail 692000825@qq.com
 */
public class Person {

    private Integer id;
    private String name;

    // TODO 一般方法重载
    public void play() {
        System.out.println("重载 play() 方法，没有参数，不知道做什么。");
    }

    public void play(String item) {
        System.out.println("重载 play(String item) 方法，一个String参数：" + item);
    }

    public void play(String item1, String item2) {
        System.out.println("重载 play(String item) 方法，两个String参数：" + item1 + "和" + item2);
    }
}

class Main {
    public static void main(String[] args) {

        Person person = new Person();
        person.play();
        person.play("游戏");
        person.play("游戏", "钓鱼");
    }
}

