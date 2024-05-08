package com.kafka.producer;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

import java.util.HashMap;
import java.util.Map;

public class ProducerPartitioner3 {
    public static void main(String[] args) throws Exception {

        // TODO 将数据按照指定的规则发送到指定分区

        Map<String, Object> configMap = new HashMap<String, Object>();
        configMap.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "hadoop102:9092,hadoop103:9092,hadoop104:9092");
        configMap.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        configMap.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringSerializer");
        configMap.put(ProducerConfig.PARTITIONER_CLASS_CONFIG, MyPartitioner.class.getName());


        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(configMap);

        // TODO 需要创建一个分区对象（分区器），Kafka提供了一个默认的分区对象


        String topic = "atguigu";

        String value = "test";
        ProducerRecord<String, String> record = new ProducerRecord<String, String>( topic, "nba", value );
        producer.send(record);

        ProducerRecord<String, String> record1 = new ProducerRecord<String, String>( topic, "wnba", value );
        producer.send(record1);

        ProducerRecord<String, String> record2 = new ProducerRecord<String, String>( topic, "nba", value );
        producer.send(record2);

        ProducerRecord<String, String> record3 = new ProducerRecord<String, String>( topic, "cba", value );
        producer.send(record3);

        ProducerRecord<String, String> record4 = new ProducerRecord<String, String>( topic, "cba", value );
        producer.send(record4);

        producer.close();
    }
}

