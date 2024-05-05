/**
 * @Author 老刘
 * @Description 关注全网ID：@老刘大数据
 * @Mail 692000825@qq.com
 */
public class Person {

    private Integer id;
    private String name;

    // TODO 构造方法重载

    public Person() {

        System.out.println("我是无参构造方法，我生来无名无份，一切都要靠后天奋斗...");
    }

    public Person(Integer id, String name) {

        System.out.println("我是有参构造方法，我生来有名有份，前路不愁...");

        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

class Main {
    public static void main(String[] args) {

        // TODO 对比两个对象创建和赋值过程的异同

        Person person1 = new Person();
        person1.setId(1);
        person1.setName("Matthew");
        System.out.println(person1.getId() + " " + person1.getName());

        Person person2 = new Person(2, "老刘");
        System.out.println(person2.getId() + " " + person2.getName());
    }
}