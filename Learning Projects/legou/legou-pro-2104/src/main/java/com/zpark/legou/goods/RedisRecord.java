package com.zpark.legou.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.time.LocalDateTime;

/**
 * redis 计数类  [key goodsId score]
 */
@Component
public class RedisRecord {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    //热门商品类型键：
    public static final String VIEWKEY = "goods:view"; //按浏览量
    public static final String DEALKEY = "goods:deal"; //按销量
    public static final String ROUNDKEY = "goods:round"; //综合
    //时间基数
    public static final LocalDateTime TIMEBASE = LocalDateTime.of(2024, 1, 1, 0, 0);

    //根据 id 查询商品时，记录访问量到 redis
    //下单时，根据 id 记录销量到 redis
    @Async //异步任务
    public void _record(String key, String goodsId){

        //业务分数 浏览量 +1  销量 + 3
        long score = switch (key){
            case VIEWKEY -> 1;
            case DEALKEY -> 3;
            default -> 0;
        };
        //时间分数 2024.1.1 ~ now() 有多少小时 每小时 + 1
        long time = Duration.between(TIMEBASE, LocalDateTime.now()).toHours();

        ZSetOperations<String, Object> zSet = redisTemplate.opsForZSet();
        zSet.incrementScore(key, goodsId, time + score); //按浏览量/订单量 累计
        zSet.incrementScore(ROUNDKEY, goodsId, time + score);

    }



}
