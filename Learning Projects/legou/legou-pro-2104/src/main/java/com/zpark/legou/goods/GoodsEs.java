package com.zpark.legou.goods;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;

@Data
//解决索引中字段和实体类属性不对应时引起的json转换异常
@JsonIgnoreProperties(ignoreUnknown = true)
@Document(indexName = "legou-es-2104", createIndex = false)
public class GoodsEs {

    @Id
    private String gid;

    private String url;

    private Double price;

    private String title;

    private String type;

}
