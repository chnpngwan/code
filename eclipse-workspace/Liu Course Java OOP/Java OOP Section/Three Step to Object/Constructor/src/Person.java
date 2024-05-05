/**
 * @Author 老刘
 * @Description 关注全网ID：@老刘大数据
 * @Mail 692000825@qq.com
 */
public class Person {

   private Integer id;
   private String name;

   // TODO 所有类都有一个默认的构造方法，创建对象时默认调用
   //  public Person() {
   //  }

   // TODO 显示声明构造方法
   public Person() {

      System.out.println("// 用无参构造方法 Person() 创建一个人 ");
      System.out.println("// 感谢你创造了我！");
   }

   public static void main(String[] args) {

      Person person = new Person();

      // TODO 执行并观察打印结果
      System.out.println(person);

      // TODO 请继续创造若干个人

   }
}

class Animal {

   // TODO 补充这个类的构造方法
}