# 龙生九子各不同

---

<br>

多态性是建立继承性之上的概念，我们不能单纯地解释多态是什么。一个类的子代可以有不同的行为，这些行为可以横向地分化，也可以一代一代（纵向）地延续，但不论子代变化如何，这些变化总结基于共有的父类展开的。

<br>

在Java的实现级别，常用**父类的引用指向子类的对象**，这种方式就展现了多态思想。

比如：对于

`Playboy playboy = new Playboy();`

因为已知的继承关系

`class Playboy extends Person // ... `

我们常倾向于使用

`Person person = new Playboy();`

这样的声明对象方式体现了多态性。

因为，对于`Person person`的引用，不仅可以指向`new Playboy()`对象，如果有需要替代的情况，也可以指向`new NiceGirl()`对象，使得对象对其引用之间灵活切换。

<br>

多态性实现了子类对象的切换，当然进一步实现了子类行为的切换，因为子类封装的行为不同。在接下来的 **Overload 方法重载** 与 **Override 方法重写** 章节中具体讨论。

<br>

***- 小CASE -***

**1. 对比不同的引用类创建过程，注意调用方法时的`play()`出自哪个类，说明什么？**

<div class="hint">

方法调用以实际创建的对象为准，引用仅作为该对象的接收类型。

</div>

**2. （选做）用积累的词汇和对多态性的理解，尝试自主翻译以下段落：**

If one task is performed in different ways, it is known as polymorphism. For example: to convince the customer differently, to draw something, for example, shape, triangle, rectangle, etc.

In Java, we use method overloading and method overriding to achieve polymorphism.

Another example can be to speak something; for example, a cat speaks meow, dog barks woof, etc.

Ref：https://www.javatpoint.com/java-oops-concepts

<div class="hint">

如果一项任务以不同的方式呈现，则称之为多态性。比如（用不同的方式）说服不同的顾客，再比如画一些图形，三角形、正方形之类。

在Java中，我们使用方法重载和方法重写来实现多态。

另一个例子，比如：小动物的叫声，小猫"喵喵"、小狗"汪汪"等等。

</div>

<br>

---

_关注全网ID：**@老刘大数据** 版权所有_

_更多课程资源：692000925@qq.com_