package com.mdx.user;

import com.mdx.user.service.UserService;
import com.mdx.user.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.concurrent.ThreadPoolExecutor;
import java.util.function.Consumer;

/**
 * @author : jiagang
 * @date : Created in 2023/7/18 10:58
 */

@SpringBootTest
public class JsonTest {


    public class People{
        private String name;

        private int age = 12;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getAge() {
            return age;
        }

        public void setAge(int age) {
            this.age = age;
        }
    }

    public class Man extends People {

    }

    public static void modifyTheValue3(Man t, Consumer<? super People> consumer) {
        consumer.accept(t);
    }

    public void main(String[] args) {
        Man man = new Man();
        People people = new People();

        modifyTheValue3(man,People::getAge);

        //UserService userService = new UserServiceImpl();µ

        Runnable runnable = new Runnable() {
            @Override
            public void run() {
                System.out.println("1234");
            }
        };
        runnable.run();


        // -> 右侧相当于重写了 ran方法  也就是函数式接口为什么只能有一个抽象方法
        Runnable runnable1 = () -> System.out.println("123");
        runnable1.run();

        Runnable runnable2 = () -> {
            System.out.println("123");
        };
        runnable2.run();

        Thread thread = new Thread();
        thread.run();


    }

}

