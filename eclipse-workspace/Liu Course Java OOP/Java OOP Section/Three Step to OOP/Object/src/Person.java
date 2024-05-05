/**
 * @Author 老刘
 * @Description 关注全网ID：@老刘大数据
 * @Mail 692000825@qq.com
 */
public class Person extends Object {

    private Integer id;
    private String name;

}

/**
 * Playboy 渣男类继承 Person 人类
 */
class Playboy extends Person {

    public static void main(String[] args) {

        Object object = new Object();
        System.out.println(object.hashCode());
    }
}