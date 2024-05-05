import com.sun.xml.internal.bind.v2.runtime.reflect.opt.TransducedAccessor_method_Boolean;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

import java.util.List;

/**
 * ProjectName:   spring boot
 * PackageName:   PACKAGE_NAME
 * ClassName:     Customer
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 17 09 23
 **/


public class Customer {
    static final Jedis jedis = new Jedis("127.0.0.1",6379);

    public static void main(String[] args) throws InterruptedException {
        //消费十元
        boolean result = transMehtod(10);
        System.out.println("交易结束，事务执行结果"+result);
        //获取值
        int balance = Integer.parseInt(jedis.get("balance"));
        int dep = Integer.parseInt(jedis.get("dep"));
        System.out.println("balance:"+balance+",dep:"+dep);
    }
    //支付操作
    public static boolean transMehtod(int amtToSubtract) throws InterruptedException {
        int balance;
        int dep;
        jedis.set("balance", "100");
        jedis.set("dep","0");
        jedis.watch("balance","dep");
        balance = Integer.parseInt(jedis.get("balance"));
        if (balance<amtToSubtract){
            jedis.unwatch();
            System.out.println("Insuffcicent balance");
            return false;
        }
        Transaction transaction = jedis.multi();
        transaction.decrBy("balance",amtToSubtract);
        Thread.sleep(5000);
        transaction.incrBy("dep",amtToSubtract);
        List<Object> list = transaction.exec();
        return !list.isEmpty();
    }

}
