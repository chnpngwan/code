package com.kafka.producer;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

import java.util.HashMap;
import java.util.Map;

public class ProducerTransaction {
    public static void main(String[] args) {

        // TODO 生产者事务处理
        //      1. 必须开启幂等性操作: ACK应答级别甚至为-1，增加重试操作
        //      2. 增加事务ID
        //      3. 完成事务操作
        //         3.1 事务初始化
        //         3.2 开启事务
        //         3.3 提交事务
        //         3.4 中止事务

        Map<String, Object> configMap = new HashMap<String, Object>();
        configMap.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "hadoop102:9092,hadoop103:9092,hadoop104:9092");
        configMap.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        configMap.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringSerializer");
        configMap.put(ProducerConfig.ENABLE_IDEMPOTENCE_CONFIG, true);
        configMap.put(ProducerConfig.ACKS_CONFIG, "-1");
        configMap.put(ProducerConfig.RETRIES_CONFIG, 5);
        configMap.put(ProducerConfig.TRANSACTIONAL_ID_CONFIG, "atguigu-tx-id");

        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(configMap);

        // TODO 事务初始化
        producer.initTransactions();

        try {

            // TODO 开启事务
            producer.beginTransaction();

            String topic = "atguigu"; // 主题名称
            String key = "test";   // 数据KV中K
            String value = "test"; // 数据KV中V
            ProducerRecord<String, String> record = new ProducerRecord<String, String>( topic, key, value );

            producer.send(record);

            // TODO 提交事务
            producer.commitTransaction();
        } catch ( Exception e ) {
            e.printStackTrace();
            // TODO 中止事务
            producer.abortTransaction();
        }





        producer.close();
    }
}
