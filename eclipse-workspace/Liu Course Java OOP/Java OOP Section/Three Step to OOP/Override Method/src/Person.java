/**
 * @Author 老刘
 * @Description 关注全网ID：@老刘大数据
 * @Mail 692000825@qq.com
 */
public class Person {

    public void play() {

        System.out.println("Person 类的 play() 方法：\n普通人的业余活动");
    }

}

class Playboy extends Person {

    // @Override 由编译器生成的注解，仅作标识，无实际作用
    @Override
    public void play() {

        System.out.println("Playboy 类的 play() 方法：\n渣男的业余活动：泡8喝9搞10情");
    }

}

class NiceGirl extends Person {

    // TODO 在好女孩类中重写 play 方法，姐妹们业余都做点什么呢？

}

class Main {

    public static void main(String[] args) {

        Person person = new Person();
        person.play();

        // TODO 子类分别调用重写后的方法

        Playboy playboy = new Playboy();
        playboy.play();

        NiceGirl niceGirl = new NiceGirl();
        niceGirl.play();

    }
}