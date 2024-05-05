import redis.clients.jedis.Jedis;

/**
 * ProjectName:   spring boot
 * PackageName:   PACKAGE_NAME
 * ClassName:     JedisDemo1
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 16 18 26
 **/


public class JedisDemo1 {
    public static void main(String[] args) {
        Jedis jedis = new Jedis("127.0.0.1",6379);
        System.out.println(jedis.ping());
    }
}
