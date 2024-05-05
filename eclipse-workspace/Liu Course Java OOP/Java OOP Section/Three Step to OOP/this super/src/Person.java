/**
 * @Author 老刘
 * @Description 关注全网ID：@老刘大数据
 * @Mail 692000825@qq.com
 */
import java.sql.Timestamp;

public class Person {

    private Integer id;
    private String name;

    /**
     * Person 类（父类）构造方法
     */
    public Person() {

        System.out.println("1. 创造了一个人");
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

/**
 * Playboy 渣男类继承 Person 人类
 */
class Playboy extends Person {

    private Timestamp timestamp;

    /**
     * Playboy 类，（子类）构造方法
     */
    public Playboy() {

        // 显示调用父类构造方法的特殊写法
        super();

        // this 调用当前类的属性赋值
        this.timestamp = new Timestamp(System.currentTimeMillis());

        // TODO 对 this.id 的访问能否生效？为什么？应该如何处理？
        // this.id = null;

        System.out.println("id: " + super.getId());
        System.out.println("name: " + super.getName());
        System.out.println("2. 一个普通人成了一个渣男");
    }

    public static void main(String[] args) {

        Playboy playboy = new Playboy();
        playboy.setId(2);
        playboy.setName("罗真香");

        System.out.println("id: " + playboy.getId());
        System.out.println("name: " + playboy.getName());

        // TODO 打印观察对 timestamp 的赋值是否生效
        System.out.println("使用 playboy.timestamp 获取 playboy 的创建时间：" + playboy.timestamp);
        System.out.println("推荐使用 playboy.getTimestamp() 获取 playboy 的创建时间：" + playboy.getTimestamp());
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
}