package com.kafka.producer;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

import java.util.HashMap;
import java.util.Map;

public class ProducerAsyn3 {
    public static void main(String[] args) {

        // TODO 使用Kafka的 Producer API 实现数据生产

        // TODO 配置参数
        //      服务器地址，数据的序列化对象
        Map<String, Object> configMap = new HashMap<String, Object>();
        configMap.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "hadoop102:9092,hadoop103:9092,hadoop104:9092");
        configMap.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        configMap.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringSerializer");
        configMap.put(ProducerConfig.BATCH_SIZE_CONFIG, 100);

        // TODO 1. 构建Kafka Producer对象
        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(configMap);

        // TODO 2. 准备数据
        String topic = "test1"; // 主题名称
        for ( int i = 0; i < 5; i++ ) {
            String key = "test" + i;   // 数据KV中K
            String value = "test" + i; // 数据KV中V
            ProducerRecord<String, String> record = new ProducerRecord<String, String>( topic, key, value );

            // TODO 3. 发送数据
            producer.send(record);
        }


        // TODO 4. 释放资源
        producer.close();
    }
}
