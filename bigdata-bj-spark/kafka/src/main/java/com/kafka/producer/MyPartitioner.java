package com.kafka.producer;

import org.apache.kafka.clients.producer.Partitioner;
import org.apache.kafka.common.Cluster;

import java.util.Map;

// TODO 自定义分区规则对象（分区器）
//      0. 创建【公共】类
//      1. 实现 org.apache.kafka.clients.producer.Partitioner 接口
//      2. 重写方法
//         close
//         configure
//         partition (重点)
//             方法的返回值就是分区编号
//      3. 配置分区规则
public class MyPartitioner implements Partitioner {
    @Override
    public int partition(String topic, Object key, byte[] keyBytes, Object value, byte[] valueBytes, Cluster cluster) {
        if ( "nba".equals(key) ) {
            return 1;
        } else if ( "wnba".equals( key ) ) {
            return 0;
        } else {
            return 2;
        }
    }

    @Override
    public void close() {

    }

    @Override
    public void configure(Map<String, ?> configs) {

    }
}
