package com.demo.redis;

import com.demo.redis.bean.User;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;

import javax.annotation.Resource;

@SpringBootTest
class SpringbootRedisApplicationTests {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Test
    void test1() {
        stringRedisTemplate.opsForValue().set("key1","value1");
        String value = stringRedisTemplate.opsForValue().get("key1");
        System.out.println(value);
    }

    @Test
    void test2() {
        stringRedisTemplate.opsForList().leftPush("keyList","value1");
        stringRedisTemplate.opsForList().leftPush("keyList","value2");
        stringRedisTemplate.opsForList().leftPush("keyList","value3");
        stringRedisTemplate.opsForList().leftPush("keyList","value4");
    }

    @Test
    void test3() {
        stringRedisTemplate.opsForSet().add("keSet","setvalue1","setvalue2","setvalue3");
        stringRedisTemplate.opsForSet().pop("keyset");
    }

    @Resource
    private RedisTemplate configure;
    @Test
    void test4() {
        User user = new User();
        user.setId(1);
        user.setName("lisi");
        user.setGender("boy");
        user.setAge(12);
        user.setBirthdate("2002-03-01");
        configure.opsForValue().set("user01",user);
    }
}
