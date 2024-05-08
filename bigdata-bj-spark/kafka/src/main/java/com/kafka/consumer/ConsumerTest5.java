package com.kafka.consumer;

import org.apache.kafka.clients.consumer.*;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.time.Duration;
import java.util.*;

public class ConsumerTest5 {
    public static void main(String[] args) {

        // TODO 使用Kafka的 Consumer API 实现数据消费

        Map<String, Object> configMap = new HashMap<>();
        configMap.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "hadoop102:9092,hadoop103:9092,hadoop104:9092");
        // TODO 反序列化
        configMap.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringDeserializer");
        configMap.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());

        // TODO 消费者是以组为单位进行消费，每一个消费者应该属于一个组
        configMap.put(ConsumerConfig.GROUP_ID_CONFIG, "atguigu2");

        // TODO 禁用自动提交
        configMap.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, false);

        configMap.put(ConsumerConfig.PARTITION_ASSIGNMENT_STRATEGY_CONFIG, Arrays.asList(RangeAssignor.class));

        // TODO 构建消费者对象
        final KafkaConsumer<String, String> consumer = new KafkaConsumer<String, String>(configMap);
        // TODO 消费者需要订阅主题
        List<String> topics = new ArrayList<>();
        topics.add("aaa");
        consumer.subscribe(topics);

        try {
            // TODO 消费数据
            while ( true ) {
                final ConsumerRecords<String, String> datas = consumer.poll(Duration.ofSeconds(1));

                for (ConsumerRecord<String, String> data : datas) {
                    System.out.println(data);
                }

                // TODO Kafka在消费数据的时候会每隔一段时间默认将数据读取的偏移量和消费者组的关系提交给Broker，保存到内部主题中。
                //       如果数据读取完毕并进行了处理后，在提交偏移量的过程中，出现了故障，此时就会出现数据重复读取的情况
                //      解决方案：可以采用手动提交，而不是自动提交，所以需要禁用自动提交。
                // TODO 手动提交
                //     异步提交 ：消费数据 + 提交偏移量
                //consumer.commitAsync();
                //     同步提交 ：消费数据 -> 提交偏移量
                //consumer.commitSync();
            }
        } catch ( Exception e ) {
            // TODO 释放资源
            consumer.close();
        }
    }
}
