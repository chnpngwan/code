package com.kafka.producer;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

import java.util.HashMap;
import java.util.Map;

public class ProducerPartitioner2 {
    public static void main(String[] args) throws Exception {

        // TODO 发送数据时指定分区

        Map<String, Object> configMap = new HashMap<String, Object>();
        configMap.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "hadoop102:9092,hadoop103:9092,hadoop104:9092");
        configMap.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        configMap.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringSerializer");


        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(configMap);


        String topic = "atguigu";
        String key = "bbb";

        // TODO 如果分区参数不指定。
        //      此时需要考虑数据有没有K存在
        //      1. 如果K存在
        //         1.1 如果分区规则对象（Partitioner）存在,那么会采用对象根据Key计算出数据所在的分区编号
        //               当前Kafka版本不存在分区规则对象Partitioner
        //         1.2 如果分区规则不存在（Partitioner）
        //              key => murmur2算法（Hash算法） => 分区编号(0)
        //              如果开发者想要将数据发送到指定的分区，只要key保持一致即可
        //      2. 如果K不存在
        //          如果满足2的场合，采用优化后的粘性分区策略

        for ( int i = 0; i < 10; i++ ) {
            String value = "test" + i;
            ProducerRecord<String, String> record = new ProducerRecord<String, String>( topic, key, value );
            producer.send(record);
        }


        producer.close();
    }
}
