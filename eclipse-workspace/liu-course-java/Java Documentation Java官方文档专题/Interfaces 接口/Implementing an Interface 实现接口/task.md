# Implementing an Interface

---
https://docs.oracle.com/javase/tutorial/java/IandI/usinginterface.html

<br>

## A Sample Interface, Relatable

<br>

- To declare a class that implements an interface, you include an implements clause in the class declaration. 
- Your class can implement more than one interface, so the implements keyword is followed by a comma-separated list of the interfaces implemented by the class. 
- By convention, the implements clause follows the extends clause, if there is one.


<div class="hint">

- 声明一个实现接口的类，在定义类的时候使用`implements`语句
- 一个类可以实现多个接口，所以`implements`关键字可以接一个接口列表，用`,`分隔
- 按照惯例，`implements`语句跟在`extends`语句之后

</div>

<br>

A Sample Interface, Relatable
Consider an interface that defines how to compare the size of objects.

```java
public interface Relatable {

    // this (object calling isLargerThan)
    // and other must be instances of 
    // the same class returns 1, 0, -1 
    // if this is greater than, 
    // equal to, or less than other
    public int isLargerThan(Relatable other);
}
```

If you want to be able to compare the size of similar objects, no matter what they are, the class that instantiates them should implement Relatable.

Any class can implement Relatable if there is some way to compare the relative "size" of objects instantiated from the class. For strings, it could be number of characters; for books, it could be number of pages; for students, it could be weight; and so forth. For planar geometric objects, area would be a good choice (see the RectanglePlus class that follows), while volume would work for three-dimensional geometric objects. All such classes can implement the isLargerThan() method.

If you know that a class implements Relatable, then you know that you can compare the size of the objects instantiated from that class.

<br>

## Implementing the Relatable Interface

<br>

Here is the Rectangle class that was presented in the Creating Objects section, rewritten to implement Relatable.

```java
public class RectanglePlus
implements Relatable {
public int width = 0;
public int height = 0;
public Point origin;

    // four constructors
    public RectanglePlus() {
        origin = new Point(0, 0);
    }
    public RectanglePlus(Point p) {
        origin = p;
    }
    public RectanglePlus(int w, int h) {
        origin = new Point(0, 0);
        width = w;
        height = h;
    }
    public RectanglePlus(Point p, int w, int h) {
        origin = p;
        width = w;
        height = h;
    }

    // a method for moving the rectangle
    public void move(int x, int y) {
        origin.x = x;
        origin.y = y;
    }

    // a method for computing
    // the area of the rectangle
    public int getArea() {
        return width * height;
    }
    
    // a method required to implement
    // the Relatable interface
    public int isLargerThan(Relatable other) {
        RectanglePlus otherRect 
            = (RectanglePlus)other;
        if (this.getArea() < otherRect.getArea())
            return -1;
        else if (this.getArea() > otherRect.getArea())
            return 1;
        else
            return 0;               
    }
}
```

Because RectanglePlus implements Relatable, the size of any two RectanglePlus objects can be compared.

_Note: The isLargerThan method, as defined in the Relatable interface, takes an object of type Relatable. The line of code, shown in bold in the previous example, casts other to a RectanglePlus instance. Type casting tells the compiler what the object really is. Invoking getArea directly on the other instance (other.getArea()) would fail to compile because the compiler does not understand that other is actually an instance of RectanglePlus._

<br>

---

<br>

***- 菜鸟TIPS -***

一段提示

<br>

***- 小CASE -***

**1. 回答题**

<div class="hint">

提示内容

</div>

<br>

---

_关注全网ID：**@老刘大数据** 版权所有_