# Defining an Interface

---
https://docs.oracle.com/javase/tutorial/java/IandI/interfaceDef.html

<br>

An interface declaration consists of **modifiers, the keyword interface, the interface name, a comma-separated list of parent interfaces (if any), and the interface body**. 

接口定义包括修饰符、`interface`关键字、接口名、用逗号分隔的父接口列表（若有）以及接口体。

For example:

```java
public interface GroupedInterface extends Interface1, Interface2, Interface3 {

    // constant declarations
    
    // base of natural logarithms
    double E = 2.718282;
 
    // method signatures
    void doSomething (int i, double x);
    int doSomethingElse(String s);
}
```

- **The public access specifier indicates that the interface can be used by any class in any package.** 
- If you do not specify that the interface is public, then your interface is accessible only to classes defined in the same package as the interface.
- An interface can extend other interfaces, just as a class subclass or extend another class. 
- However, **whereas a class can extend only one other class, an interface can extend any number of interfaces.** 
- The interface declaration includes a comma-separated list of all the interfaces that it extends.

<div class="hint">

- `public`访问修饰符指明了接口可以被任意包下的任意类访问；
- 如果没有指明接口是`public`，则接口只能被与这个接口在同一包下定义的类所访问；
- 一个接口可以继承其他接口，就像子类继承父类一样；
- 一个类只能继承一个其他类，但一个接口可以继承若干个接口；
- 接口继承多个接口时，用`,`分隔。

</div>

<br>

## The Interface Body

<br>

- The interface body can contain **abstract methods, default methods, and static methods**. An abstract method within an interface is followed by a semicolon, but no braces (an abstract method does not contain an implementation). 
- Default methods are defined with the default modifier, and static methods with the static keyword. 
- All abstract, default, and static methods in an interface are implicitly public, so you can omit the public modifier.
- In addition, an interface can contain constant declarations. All constant values defined in an interface are implicitly **public, static, and final**. Once again, you can omit these modifiers.

<div class="hint">

- 一个接口体可以包含抽象方法、默认方法、静态方法，接口中的抽象方法不含方法实现；
- 使用`default`修饰符定义接口的默认方法，或者`static`定义静态方法；
- 接口中`abstract`、`default`和`static`修饰的方法都默认是`public`级别，可以省略`public`关键字；
- 接口中可以包含常量，所有的常量值被隐式地定义为`public`、`static`和`final`，这些修饰符也可以被省略。

</div>

<br>

---

<br>

***- 小CASE -***

**1. 没有方法体的方法是抽象方法，请你思考抽象方法有什么作用？为什么接口中的方法要抽象？**

<br>

---

_关注全网ID：**@老刘大数据** 版权所有_