package com.kafka.consumer;

import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;

import java.time.Duration;
import java.util.*;

public class ConsumerTest {
    public static void main(String[] args) {

        // TODO 使用Kafka的 Consumer API 实现数据消费

        Map<String, Object> configMap = new HashMap<>();
        configMap.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "hadoop102:9092,hadoop103:9092,hadoop104:9092");
        // TODO 反序列化
        configMap.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringDeserializer");
        configMap.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());

        // TODO 消费者是以组为单位进行消费，每一个消费者应该属于一个组
        configMap.put(ConsumerConfig.GROUP_ID_CONFIG, "atguigu");

        // TODO 构建消费者对象
        final KafkaConsumer<String, String> consumer = new KafkaConsumer<String, String>(configMap);
        // TODO 消费者需要订阅主题
        List<String> topics = new ArrayList<>();
        topics.add("atguigu");
        consumer.subscribe(topics);

        // TODO 消费数据
        final ConsumerRecords<String, String> datas = consumer.poll(Duration.ofSeconds(1));

        for (ConsumerRecord<String, String> data : datas) {
            System.out.println(data);
        }

        // TODO 释放资源
        consumer.close();
    }
}
