/**
 * @Author 老刘
 * @Description 关注全网ID：@老刘大数据
 */
abstract public class Person {

    public void play() {

        System.out.println("Person 类的 play() 方法：\n普通人的业余活动");
    }

}

class Main {

    public static void main(String[] args) {

        Person person = new Person();

    }
}