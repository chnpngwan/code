# What Is an Object?

---

https://docs.oracle.com/javase/tutorial/java/concepts/object.html

<br>

**Keywords/Phrases:**

- Object
- Object-Oriented Programming
- Characteristic
- state and behavior
- data encapsulation
- Modularity

<div class="hint">

- Object 状态和行为
- Object-Oriented Programming 面向对象编程
- Characteristic 特征
- state and behavior 状态和行为
- data encapsulation 数据封装
- Modularity 模块化

</div>

<br>

## 从现实世界的角度来理解面向对象

<br>

**Objects are key to understanding object-oriented technology.** 

正解理解对象，是进一步理解面向对象的关键。

Look around right now and you'll find many examples of **real-world objects: your dog, your desk, your television set, your bicycle.**

Real-world objects share two characteristics: 

- ### They all have state and behavior. 
- ### 现实世界的对象都拥有两个特征：状态和行为。

Dogs have state (name, color, breed, hungry) and behavior (barking, fetching, wagging tail). Bicycles also have state (current gear, current pedal cadence, current speed) and behavior (changing gear, changing pedal cadence, applying brakes). 

<br>

---

<br>

**Identifying the state and behavior for 1real-world objects is a great way to begin thinking in terms of object-oriented programming.**

Take a minute right now to observe the real-world objects that are in your immediate area. 

For each object that you see, ask yourself two questions: 

- ### "What possible states can this object be in?"

- ### 这个对象可能处于什么状态？

and 

- ### "What possible behavior can this object perform?".

- ### 这个对象可能表现出什么行为？

Make sure to write down your observations. 

As you do, you'll notice that real-world objects vary in complexity; 
your desktop lamp may have only two possible states (on and off) and two possible behaviors (turn on, turn off), but your desktop radio might have additional states (on, off, current volume, current station) and behavior (turn on, turn off, increase volume, decrease volume, seek, scan, and tune). You may also notice that some objects, in turn, will also contain other objects. 

- ### These real-world observations all translate into the world of object-oriented programming.
- ### 对于现实世界的观察都可以转化成OOP/面向对象编程中的术语。

<br>

---

<br>

![](../../../resources/6.gif)
_A software object._

<br>

- ### Software objects are conceptually similar to real-world objects: they too consist of state and related behavior.

- ### 软件中的对象也和现实世界相似：它们都由状态和行为组成。

**An object stores its state in fields (variables in some programming languages) and exposes its behavior through methods (functions in some programming languages).** 

Methods operate on an object's internal state and serve as the primary mechanism for object-to-object communication. 

Hiding internal state and requiring all interaction to be performed through an object's methods is known as **data encapsulation** — a fundamental principle of object-oriented programming.

<br>

Consider a bicycle, for example:

![](../../../resources/7.gif)
_A bicycle modeled as a software object._

<br>

By attributing state (current speed, current pedal cadence, and current gear) and providing methods for changing that state, the object remains in control of how the outside world is allowed to use it. For example, if the bicycle only has 6 gears, a method to change gears could reject any value that is less than 1 or greater than 6.

<br>

**Bundling code into individual software objects provides a number of benefits**, including:

- ### Modularity / 模块化 

The source code for an object can be written and maintained independently of the source code for other objects. 

Once created, an object can be easily **passed around / 传递** inside the system.

- ### Information-hiding / 关键信息隐藏

By interacting only with an object's methods, the details of its internal implementation remain hidden from the outside world.

- ### Code re-use / 代码复用

If an object already exists (perhaps written by another software developer), you can use that object in your program. This allows specialists to implement/test/debug complex, task-specific objects, which you can then trust to run in your own code.

- ### Pluggability and debugging ease / 插件化和代码调试

If a particular object turns out to be problematic, you can simply remove it from your application and plug in a different object as its replacement. This is analogous to fixing mechanical problems in the real world. If a bolt breaks, you replace it, not the entire machine.

<br>

---

<br>

***- 小CASE -***

**1. 用自己的话解释软件"对象"化能带来哪些好处？**

<div class="hint">

从四个方面尝试说明
- Modularity / 模块化
- Information-hiding / 关键信息隐藏
- Code re-use / 代码复用
- Pluggability and debugging ease / 插件化和代码调试

</div>


**2. 尝试翻译以下内容，尽量用自己的话叙述。**

- An object stores its state in fields (variables in some programming languages) and exposes its behavior through methods (functions in some programming languages).
- If an object already exists (perhaps written by another software developer), you can use that object in your program. This allows specialists to implement/test/debug complex, task-specific objects, which you can then trust to run in your own code.

<br>

---

_关注全网ID：**@老刘大数据** 版权所有_