/**
 * @Author 老刘
 * @Description 关注全网ID：@老刘大数据
 * @Mail 692000825@qq.com
 */
public class Person {

    public void play() {
        System.out.println("Person 类的 play() 方法");
    }
}

class Playboy extends Person {

    public void play() {
        System.out.println("Playboy 类的 play() 方法");
    }
}

class NiceGirl extends Person {

    public void play() {
        System.out.println("NiceGirl 类的 play() 方法");
    }
}

class Main {

    public static void main(String[] args) {

        Playboy playboy = new Playboy();
        playboy.play();

        // TODO 对比 person1, person2, person3 调用的方法区别

        Person person1 = new Person();
        person1.play();

        Person person2 = new Playboy();
        person2.play();

        Person person3 = new NiceGirl();
        person3.play();
    }
}