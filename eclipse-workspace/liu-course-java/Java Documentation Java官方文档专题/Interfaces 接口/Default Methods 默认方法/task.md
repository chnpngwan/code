# Default Methods

---
https://docs.oracle.com/javase/tutorial/java/IandI/defaultmethods.html

<br>

## 默认方法

<br>

The section Interfaces describes an example that involves manufacturers of computer-controlled cars who publish industry-standard interfaces that describe which methods can be invoked to operate their cars. 

What if those computer-controlled car manufacturers add new functionality, such as flight, to their cars? These manufacturers would need to specify new methods to enable other companies (such as electronic guidance instrument manufacturers) to adapt their software to flying cars. Where would these car manufacturers declare these new flight-related methods? If they add them to their original interfaces, then programmers who have implemented those interfaces would have to rewrite their implementations. If they add them as static methods, then programmers would regard them as utility methods, not as essential, core methods.

<br>

- ### Default methods enable you to add new functionality to the interfaces of your libraries and ensure binary compatibility with code written for older versions of those interfaces.
- ### `default`默认方法允许给接口添加新的功能，编写这些代码可以保证兼容低版本接口的已经编译的二进制文件。

<br>

Consider the following interface, TimeClient, as described in Answers to Questions and Exercises: Interfaces:

```java
import java.time.*;

public interface TimeClient {
    void setTime(int hour, int minute, int second);
    void setDate(int day, int month, int year);
    void setDateAndTime(int day, int month, int year,
    int hour, int minute, int second);
    LocalDateTime getLocalDateTime();
}
```

The following class, SimpleTimeClient, implements TimeClient:

```java
package defaultmethods;

import java.time.*;
import java.lang.*;
import java.util.*;

public class SimpleTimeClient implements TimeClient {

    private LocalDateTime dateAndTime;
    
    public SimpleTimeClient() {
        dateAndTime = LocalDateTime.now();
    }
    
    public void setTime(int hour, int minute, int second) {
        LocalDate currentDate = LocalDate.from(dateAndTime);
        LocalTime timeToSet = LocalTime.of(hour, minute, second);
        dateAndTime = LocalDateTime.of(currentDate, timeToSet);
    }
    
    public void setDate(int day, int month, int year) {
        LocalDate dateToSet = LocalDate.of(day, month, year);
        LocalTime currentTime = LocalTime.from(dateAndTime);
        dateAndTime = LocalDateTime.of(dateToSet, currentTime);
    }
    
    public void setDateAndTime(int day, int month, int year,
                               int hour, int minute, int second) {
        LocalDate dateToSet = LocalDate.of(day, month, year);
        LocalTime timeToSet = LocalTime.of(hour, minute, second); 
        dateAndTime = LocalDateTime.of(dateToSet, timeToSet);
    }
    
    public LocalDateTime getLocalDateTime() {
        return dateAndTime;
    }
    
    public String toString() {
        return dateAndTime.toString();
    }
    
    public static void main(String... args) {
        TimeClient myTimeClient = new SimpleTimeClient();
        System.out.println(myTimeClient.toString());
    }
}
```

Suppose that you want to add new functionality to the TimeClient interface, such as the ability to specify a time zone through a ZonedDateTime object (which is like a LocalDateTime object except that it stores time zone information):

```java
public interface TimeClient {
    void setTime(int hour, int minute, int second);
    void setDate(int day, int month, int year);
    void setDateAndTime(int day, int month, int year,
    int hour, int minute, int second);
    LocalDateTime getLocalDateTime();                           
    ZonedDateTime getZonedDateTime(String zoneString);
}
```

Following this modification to the TimeClient interface, you would also have to modify the class SimpleTimeClient and implement the method getZonedDateTime. However, rather than leaving getZonedDateTime as abstract (as in the previous example), you can instead define a default implementation. (Remember that an abstract method is a method declared without an implementation.)

```java
package defaultmethods;

import java.time.*;

public interface TimeClient {
    void setTime(int hour, int minute, int second);
    void setDate(int day, int month, int year);
    void setDateAndTime(int day, int month, int year,
    int hour, int minute, int second);
    LocalDateTime getLocalDateTime();

    static ZoneId getZoneId (String zoneString) {
        try {
            return ZoneId.of(zoneString);
        } catch (DateTimeException e) {
            System.err.println("Invalid time zone: " + zoneString +
                "; using default time zone instead.");
            return ZoneId.systemDefault();
        }
    }
        
    default ZonedDateTime getZonedDateTime(String zoneString) {
        return ZonedDateTime.of(getLocalDateTime(), getZoneId(zoneString));
    }
}
```

You specify that a method definition in an interface is a default method with the default keyword at the beginning of the method signature. **All method declarations in an interface, including default methods, are implicitly public, so you can omit the public modifier.**

With this interface, you do not have to modify the class SimpleTimeClient, and this class (and any class that implements the interface TimeClient), will have the method getZonedDateTime already defined. The following example, TestSimpleTimeClient, invokes the method getZonedDateTime from an instance of SimpleTimeClient:


```java
package defaultmethods;

import java.time.*;
import java.lang.*;
import java.util.*;

public class TestSimpleTimeClient {
    public static void main(String... args) {
    TimeClient myTimeClient = new SimpleTimeClient();
    System.out.println("Current time: " + myTimeClient.toString());
    System.out.println("Time in California: " +
    myTimeClient.getZonedDateTime("Blah blah").toString());
    }
}
```

<br>

---

<br>

***- 小CASE -***

**1. 理解本节的案例，在编译器中自主写一遍，体会程序的实现过程。**

<br>

---

_关注全网ID：**@老刘大数据** 版权所有_