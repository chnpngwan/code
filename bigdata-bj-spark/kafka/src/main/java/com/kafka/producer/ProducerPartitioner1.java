package com.kafka.producer;

import org.apache.kafka.clients.producer.*;
import org.apache.kafka.common.serialization.StringSerializer;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Future;

public class ProducerPartitioner1 {
    public static void main(String[] args) throws Exception {

        // TODO 发送数据时指定分区

        Map<String, Object> configMap = new HashMap<String, Object>();
        configMap.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "hadoop102:9092,hadoop103:9092,hadoop104:9092");
        configMap.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        configMap.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringSerializer");


        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(configMap);


        String topic = "atguigu";
        String key = "aaa";
        // TODO 分区指定时，必须为分区编号，分区编号从0开始
        //      分区参数取值最好是满足分区编号的设定（0 ~ 分区数量-1）。
        int partition = 2;
        for ( int i = 0; i < 10; i++ ) {
            String value = "test" + i;
            ProducerRecord<String, String> record = new ProducerRecord<String, String>( topic, partition, key, value );
            producer.send(record);
        }


        producer.close();
    }
}
