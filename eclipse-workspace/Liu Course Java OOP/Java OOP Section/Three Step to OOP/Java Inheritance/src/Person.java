/**
 * @Author 老刘
 * @Description 关注全网ID：@老刘大数据
 * @Mail 692000825@qq.com
 */
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

    /**
     * Playboy 类，（子类）构造方法
     */
    public Playboy() {

        System.out.println("2. 一个普通人成了一个渣男");
    }

    public static void main(String[] args) {

        Playboy playboy = new Playboy();
        playboy.setId(2);
        playboy.setName("罗真香");

        System.out.println(playboy.getId() + " " + playboy.getName());

    }
}