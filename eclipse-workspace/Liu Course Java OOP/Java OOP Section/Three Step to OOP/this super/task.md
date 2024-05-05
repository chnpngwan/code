# 我是`this`，我爸是`super`！

---

<br>

**`this`和`super`的功能一致，相当于一个具体对象，可以直接调用属性和方法，只是指代的类不同。**

<br>

## `this` 关键字

- 用于在当前类中指代**本类的对象**

<br>

## `super` 关键字

- 用于在当前类中指代**本类的父类的对象**
- `super`有特殊作用，当父类存在多个构造方法时，可以使用`super();`指定调用某一个父类的构造方法

<br>

---

<br>

***- 菜鸟TIPS -***

`this`和`super`是相对的指代，需要和上下文相关，具体表示什么要看在哪个类中。如果跳出当前类，便失去了在本类的作用和意义。

<br>

***- 小CASE -***

**1. `Playboy`类中的`this`指`Playboy`的对象，`super`指`Playboy`的父类`Person`对象；如果在`Person`中，`this`和`super`分别指代什么？**

**2. 思考在`Playboy`构造方法中对`this.id`的访问能否生效？为什么？应该如何处理？**

<div class="hint">

注意对象的属性的修饰符`private`的含义，意味着什么？

</div>

<br>

---

_关注全网ID：**@老刘大数据** 版权所有_

_更多课程资源：692000925@qq.com_