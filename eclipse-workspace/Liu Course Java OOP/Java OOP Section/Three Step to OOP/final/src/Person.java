/**
 * @Author 老刘
 * @Description 关注全网ID：@老刘大数据
 * @Mail 692000825@qq.com
 */
public class Person {

    /**
     * final 定义常量
     */
    public final static String CLASS_NAME = "Person";

    /**
     * final 定义方法
     */
    final public void breath() {

        System.out.println("Person 类的 breath() 方法：\n人会呼吸。");
    }

    public void play() {

        System.out.println("Person 类的 play() 方法：\n普通人的业余活动");
    }

}

/**
 * final 定义类
 * 渣男类不允许再被继承
 */
final class Playboy extends Person {

    public void breath() {
        // TODO 试图 override breath() 时发生错误，为什么？
    }

    @Override
    public void play() {

        System.out.println("Playboy 类的 play() 方法：\n渣男的业余活动：喝酒、蹦迪、钓鱼");
    }

}

class NiceGirl extends Person {

    // TODO 在好女孩类中重写 play 方法，姐妹们业余都做点什么呢？

}

class Main {

    public static void main(String[] args) {

        Person person = new Person();
        person.breath();
        person.play();

        // TODO 子类分别调用重写后的方法

        Playboy playboy = new Playboy();
        playboy.breath();
        playboy.play();

        NiceGirl niceGirl = new NiceGirl();
        niceGirl.breath();
        niceGirl.play();

    }
}