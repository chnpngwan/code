package com.kafka.producer;

import org.apache.kafka.clients.producer.*;
import org.apache.kafka.common.serialization.StringSerializer;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Future;

public class ProducerSyn {
    public static void main(String[] args) throws Exception {

        // TODO 同步发送数据
        //      Kafka采用JDK1.5 以后提供的JUC操作 Future

        Map<String, Object> configMap = new HashMap<String, Object>();
        configMap.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "hadoop102:9092,hadoop103:9092,hadoop104:9092");
        configMap.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        configMap.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringSerializer");


        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(configMap);


        String topic = "atguigu"; // 主题名称
        String key = "aaa";   // 数据KV中K
        for ( int i = 0; i < 10; i++ ) {
            String value = "test" + i; // 数据KV中V
            ProducerRecord<String, String> record = new ProducerRecord<String, String>( topic, key, value );
            final Future<RecordMetadata> sendFuture = producer.send(record, new Callback() {
                @Override
                public void onCompletion(RecordMetadata metadata, Exception exception) {
                    if (exception == null) {
                        // TODO 数据发送成功
                        System.out.println("数据" + metadata.toString() + "发送成功");
                    } else {
                        // TODO 数据发送失败
                        System.out.println(exception.getMessage());
                    }
                }
            });

            System.out.println("发送了数据" + record );
            // Future的get方法可以让线程执行完毕后，再执行另外一个线程。
            sendFuture.get();
        }


        producer.close();
    }
}
