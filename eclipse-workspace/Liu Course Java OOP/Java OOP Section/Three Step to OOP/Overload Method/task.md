# 想怎么打，就怎么打

---

<br>

## Overload 一般方法重载

一般方法与构造方法重载形式一致，都是**方法名相同，参数列表不同**。一般方法还声明有返回值，要特别注意**方法返回值、访问修饰符和方法实现都与重载无关**。

方法重载的现实意义是，**对象的行为可以根据输入的形式变化而变化**。

在自然语言中也普通存在"方法重载"，比如我们说"打"的时候，打电话、打人、打饭、打赏、打钱、打球、打游戏...不同形式的"打"，其行为也完全不同。

<br>

---

<br>

***- 小CASE -***

**1. （多选题）思考下面几个方法定义哪些符合原方法的 Overload/方法重载？**

原方法：

```java
public void play() {
    //
}
```

(1)
```java
public void play(Integer item) {
    //    
}
```

(2)
```java
public void play(String item, Integer item2) {
    //    
}
```

(3)
```java
public void play2(Integer item) {
    //    
}
```

(4)
```java
public String play(Integer item) {
    //    
}
```

(5)
```java
protected String play() {
    //    
}
```

<div class="hint">

注意方法重载的定义。

</div>

<br>

---

_关注全网ID：**@老刘大数据** 版权所有_

_更多课程资源：692000925@qq.com_