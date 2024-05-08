package com.kafka.producer;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

import java.util.HashMap;
import java.util.Map;

public class ProducerAsyn4 {
    public static void main(String[] args) {

        // TODO 使用Kafka的 Producer API 实现数据生产

        // TODO 配置参数
        //      服务器地址，数据的序列化对象
        Map<String, Object> configMap = new HashMap<String, Object>();
        configMap.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "hadoop102:9092,hadoop103:9092,hadoop104:9092");
        configMap.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        configMap.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringSerializer");

        // TODO 1. 构建Kafka Producer对象
        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(configMap);

        // TODO 2. 准备数据
        String topic = "aaa"; // 主题名称
        int i = 0;
        try {
            while ( true ) {
                i ++;
                String key = "test100";   // 数据KV中K
                String value = "test100"; // 数据KV中V
                ProducerRecord<String, String> record = new ProducerRecord<String, String>( topic, i % 7, key, value );
                // TODO 3. 发送数据
                producer.send(record);
                Thread.sleep(1000);
                System.out.println("发送数据成功");
            }
        } catch ( Exception e ) {
            e.printStackTrace();
        } finally {
            // TODO 4. 释放资源
            producer.close();
        }



    }
}
