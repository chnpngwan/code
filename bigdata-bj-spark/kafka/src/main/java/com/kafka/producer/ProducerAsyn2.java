package com.kafka.producer;

import org.apache.kafka.clients.producer.*;
import org.apache.kafka.common.serialization.StringSerializer;

import java.util.HashMap;
import java.util.Map;

public class ProducerAsyn2 {
    public static void main(String[] args) {

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
            // TODO send方法不表示将数据发送到Kafka集群
            //      仅仅表示数据发送到缓冲区, 会由Sender线程将缓冲区的数据获取后发送到kafka集群，这个过程是异步完成的。
            // producer.send(record);
            // TODO 如果想要确定数据是否发送成功，可以在send方法中传递第二个参数
            producer.send(record, new Callback() {
                @Override
                public void onCompletion(RecordMetadata metadata, Exception exception) {
                    if ( exception == null ) {
                        // TODO 数据发送成功
                        System.out.println("数据" + metadata.toString() + "发送成功");
                    } else {
                        // TODO 数据发送失败
                        System.out.println(exception.getMessage());
                    }
                }
            });
            System.out.println("发送了数据" + record );
        }


        producer.close();
    }
}
