/**
 * @Author 老刘
 * @Description 关注全网ID：@老刘大数据
 * @Mail 692000825@qq.com
 */
public class Person {

    private Integer id;
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    // TODO 补充完善name属性的get/set方法

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static void main(String[] args) {

        // TODO 观察创建对象的过程和打印输出

        Person person = new Person();
        person.setId(1);
        person.setName("老刘");

        System.out.println(person.getId() + " " + person.getName());

    }
}

class Animal {

    // TODO 对于这个动物类，尝试编写适当的属性信息和访问方法
}
