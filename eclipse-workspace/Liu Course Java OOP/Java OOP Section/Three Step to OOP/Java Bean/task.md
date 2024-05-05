# Java Bean —— 世界上最好的咖啡豆

---

<br>

## 封装一颗Java Bean

一个小小的Java Bean看起来"简单"，却承载的J2EE企业级开发的基础，从基础的面向对象小CASE，到大型框架（比如SpringMVC、EJB等）应用，可以说Java Bean无处不在。

简而言之，如果一个Java类按照以下特定的方式定义，就说它是一个Bean：

- **类名**：含义是一个相对可描述的实体或者很明确的关系，比如Student/学生类、Course/课程类、CourseSelection/选课类
- **属性**：包含`private`私有化的属性信息
- **访问方法**：包含`public`公共化的访问方法，即`Getter/Setter`
- 通常以一个`public class`独立的类存在，允许类的继承、聚合关系和实现接口

### 用途

- Java Bean处于`MVC/Model-View-Control`开发模式中的`Model`层，有时也被称为Entity/实体
- 一个Java Bean可以映射一张数据库表，对Bean的操作可以反映到数据库中：

| Java Bean | 数据库表 |
|-----------|------|
| 类名        | 表名   |
| 对象        | 行    |
| 属性名       | 列    |
| 属性值       | 列值   |

<br>

---

<br>

***- 小CASE -***

**1. 参考`Student`类，补充`Course`和`CourseSelection`类的定义，并描述它们可能实现了怎样的功能。**

<br>

---

_关注全网ID：**@老刘大数据** 版权所有_

_更多课程资源：692000925@qq.com_