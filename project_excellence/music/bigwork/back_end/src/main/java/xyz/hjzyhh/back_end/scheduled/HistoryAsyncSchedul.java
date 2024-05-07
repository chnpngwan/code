package xyz.hjzyhh.back_end.scheduled;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import xyz.hjzyhh.back_end.mapper.HistoryMapper;
import xyz.hjzyhh.back_end.pojo.HistroyPO;
import xyz.hjzyhh.back_end.utils.RedisUtil;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

@Component
public class HistoryAsyncSchedul {
    @Autowired
    RedisTemplate<String, Object> redisTemplate;

    @Autowired
    HistoryMapper historyMapper;

    public Set<Long> historyKeys = new HashSet<>();

    //    @Scheduled(cron = "0/5 * * * * *")
    public void demo() {
        System.out.println("log" + (System.currentTimeMillis() / 1000) + redisTemplate);
    }

    /**
     * 一分钟从redis中同步一次history数据
     */
    @Scheduled(cron = "0 0/3 * * * *")
    public void asyncHistory() {
        Iterator<Long> iterator = historyKeys.iterator();
        while (iterator.hasNext()) {
            long element = iterator.next();
            String key = RedisUtil.PREFIX + RedisUtil.HistoryUtils.PREFIX + element;
            HistroyPO histroy = (HistroyPO) redisTemplate.opsForValue().get(key);
            if (histroy != null)
                historyMapper.updateHistoryTime(histroy.getId(), histroy.getTime(), histroy.getCreateTime());
            iterator.remove(); // 通过迭代器安全删除元素
        }
    }
}
