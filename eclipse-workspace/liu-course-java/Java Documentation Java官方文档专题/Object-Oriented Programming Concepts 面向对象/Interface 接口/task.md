# What Is an Interface?

---
https://docs.oracle.com/javase/tutorial/java/concepts/interface.html

<br>

## 接口定义

As you've already learned, **objects define their interaction with the outside world through the methods that they expose.** 

Methods form the object's interface with the outside world; the buttons on the front of your television set, for example, are the interface between you and the electrical wiring on the other side of its plastic casing. 
You press the "power" button to turn the television on and off.

In its most common form, **an interface is a group of related methods with empty bodies.** 

A bicycle's behavior, if specified as an interface, might appear as follows:

```java
interface Bicycle {

    //  wheel revolutions per minute
    void changeCadence(int newValue);

    void changeGear(int newValue);

    void speedUp(int increment);

    void applyBrakes(int decrement);
}
```

<br>

## 接口实现

To implement this interface, the name of your class would change (to a particular brand of bicycle, for example, such as ACMEBicycle), and you'd use the `implements` keyword in the class declaration:

```java
class ACMEBicycle implements Bicycle {

    int cadence = 0;
    int speed = 0;
    int gear = 1;

    // The compiler will now require that methods
    // changeCadence, changeGear, speedUp, and applyBrakes
    // all be implemented. Compilation will fail if those
    // methods are missing from this class.

    void changeCadence(int newValue) {
         cadence = newValue;
    }

    void changeGear(int newValue) {
         gear = newValue;
    }

    void speedUp(int increment) {
         speed = speed + increment;   
    }

    void applyBrakes(int decrement) {
         speed = speed - decrement;
    }

    void printStates() {
         System.out.println("cadence:" + cadence + " speed:" + speed + " gear:" + gear);
    }
}
```

<br>

- Implementing an interface allows a class to become more formal about the behavior it promises to provide. 
- Interfaces form a contract between the class and the outside world, and this contract is enforced at build time by the compiler. 
- If your class claims to implement an interface, all methods defined by that interface must appear in its source code before the class will successfully compile.

<div class="hint">

- 实现一个接口使得类对它所要提供的行为更加形式化
- 接口更加形式化地连接类与外部世界，这种联系在编译器构建阶段就必须产生
- 如果一个类声明实现一个接口，所有由接口定义的方法必须在源码组别全部实现（方法重写），否则编译不通过

</div>

_Note: To actually compile the ACMEBicycle class, you'll need to add the public keyword to the beginning of the implemented interface methods. 
You'll learn the reasons for this later in the lessons on Classes and Objects and Interfaces and Inheritance._

<br>

---

<br>

***- 小CASE -***

**1. 想一想现实世界中还那在哪些接口与实现的案例，并总结接口是一个普遍还是罕见的概念？**

<br>

---

_关注全网ID：**@老刘大数据** 版权所有_