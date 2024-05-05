# What Is Inheritance?

---
https://docs.oracle.com/javase/tutorial/java/concepts/inheritance.html

<br>

## Inheritance 继承

<br>

- ### Different kinds of objects often have a certain amount in common with each other.
- ### 不同类的对象之前总是包含一些共同之处。

Mountain bikes, road bikes, and tandem bikes, for example, all share the characteristics of bicycles (current speed, current pedal cadence, current gear). Yet each also defines additional features that make them different: tandem bicycles have two seats and two sets of handlebars; road bikes have drop handlebars; some mountain bikes have an additional chain ring, giving them a lower gear ratio.

<br>

- ### Object-oriented programming allows classes to inherit commonly used state and behavior from other classes. 
- ### 面向对象编程允许类延续它来自其他类的共同的状态和行为。

In this example, Bicycle now becomes the superclass of MountainBike, RoadBike, and TandemBike. 

- ### In the Java programming language, each class is allowed to have one direct superclass, and each superclass has the potential for an unlimited number of subclasses:
- ### 在Java中，每个类允许有一个直接的父类（也称基类或超类），每个父类可以延续出任意个数的子类。

![](../../../resources/8.gif)
_A hierarchy of bicycle classes._

<br>

The syntax for creating a subclass is simple. At the beginning of your class declaration, use the `extends` keyword, followed by the name of the class to inherit from:

```java
class MountainBike extends Bicycle {

    // new fields and methods defining 
    // a mountain bike would go here

}
```

This gives MountainBike all the same fields and methods as Bicycle, yet allows its code to focus exclusively on the features that make it unique. 

**This makes code for your subclasses easy to read. However, you must take care to properly document the state and behavior that each superclass defines, since that code will not appear in the source file of each subclass.**

<br>

---

<br>

***- 小CASE -***

**1. 用自主的语言描述继承性在现实生活中的意义。**

**2. 继承性为编程带来哪些便捷之处？**

**3. 在Java中使用`extends`需要注意些什么？**

<br>

---

_关注全网ID：**@老刘大数据** 版权所有_