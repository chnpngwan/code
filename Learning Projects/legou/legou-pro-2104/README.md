# legou

## 电子商务模式



- B2C模式：企业与消费者之间的电子商务

- B2B模式：企业与企业之间的电子商务

- C2C模式：消费者与消费者之间的电子商务

- C2B模式：消费者与企业之间的电子商务

- O2O模式（Online to Offline）：线上与线下相结合的电子商务

- B2B2C模式：企业对企业(B2B)对消费者(B2C)

- B2B2B模式：企业对企业(B2B)对企业(B2B)

  

  

## 技术选型



==业务模块==

商品模块

用户模块

收藏模块

购物车模块

订单模块

支付模块

评价模块



==技术选型==

MySQL 8.0

Spring Boot 3.2.5

mybatis 3.5.4

Redis 5

ELK 8.12.2

Vue3

... ...





## 缓存方案



传统关系型数据库（MySQL）、缓存（Redis）、搜索引擎（Elasticsearch） 如何抉择？



MySQL 数据存储于 硬盘里

内存比机械硬盘 IO 快 400倍

比固态硬盘 快 30-100 倍



QPS： 每秒有多少次请求



mysql：

1. 硬盘，IO性能差，一台 mysql QPS 4000-5000
2. 主库负责写，从库（个位数）负责读； 分库分表，ACID
3. 关系型数据库，你应该用来做数据持久化



Redis：

1. 内存，IO 性能非常好。
2. 一般先在 MySQL 前 去查询 Redis， 查不到或没命中时，才去查 mysql
3. key-value
4. 缓存时间，额外的去维护key的缓存时间。维护缓存与数据库的一致性
5. 内存有限
6. 缓存指标：命中率。
7. 缓存雪崩、缓存击穿、缓存穿透。。。数据预热。。。本地缓存\集中缓存....



elasticsearch:

1. 使用场景很多：网易新闻搜索、京东养车-门店列表
2. 还支持经纬度计算
3. es 支持结果排序
4. ELK 日志收集



es 成本：

1. 内存 + 硬盘





mysql 存储数据

es 做商品搜索、logstash 数据同步

redis 存热门数据、用户搜索历史... ... 验证码





## 01. 环境搭建



创建 legou-pro 后端项目



### 1.1 依赖项



- **pom.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.5</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>com.zpark</groupId>
    <artifactId>legou-pro</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>legou-pro</name>
    <description>legou-pro</description>
    <properties>
        <java.version>17</java.version>
    </properties>
    <dependencies>
        <!--web环境-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <!--mysql驱动-->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.33</version>
        </dependency>

        <!--mybatis数据持久层框架-->
        <dependency>
            <groupId>org.mybatis.spring.boot</groupId>
            <artifactId>mybatis-spring-boot-starter</artifactId>
            <version>3.0.3</version>
        </dependency>

        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
        </dependency>

        <!--test测试环境-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>

        <!--生成项目接口文档-->
        <dependency>
            <groupId>org.springdoc</groupId>
            <artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
            <version>2.1.0</version>
        </dependency>

    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>

</project>
```



### 1.2 配置文件



- **application.properties**

```properties
spring.application.name=legou-pro

#mysql
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://127.0.0.1:3306/legou-2104?serverTimezone=Asia/Shanghai
spring.datasource.username=root
spring.datasource.password=root

#mybatis
mybatis.mapper-locations=classpath:*/mappers/*.xml
```



- **OpenApi 配置类**
- **OpenApiConfig.java**

```java
package com.zpark.legou.conf;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI openAPI(){
        return new OpenAPI()
                .info(new Info()
                        .title("Le-Go")
                        .description("Api Document")
                        .contact(new Contact().name("zting"))
                        .version("v1.0")
                );
    }

}
```

http://localhost:8080/swagger-ui/index.html

### 1.3 工具类



> === 封装 json 转换工具类、结果集工具类



- **Json 工具类**
- **JsonHelper.java**

```java
package com.zpark.legou.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.module.paramnames.ParameterNamesModule;

import java.util.Objects;

public class JsonHelper {

    private JsonHelper(){
        throw new RuntimeException("no com.zpark.legou.utils.JsonHelper instance for you");
    }

    static final ObjectMapper MAPPER = new JsonMapper();

    static {
        MAPPER.registerModule(new Jdk8Module())
                .registerModule(new JavaTimeModule())
                .registerModule(new ParameterNamesModule());
    }

    //对象转 json
    public static String toJSON(Object object){
        Objects.requireNonNull(object);
        try {
            return MAPPER.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    //json 转对象
    public static <T> T toObject(String json, Class<T> clazz){
        Objects.requireNonNull(json);
        Objects.requireNonNull(clazz);
        try {
            return MAPPER.readValue(json, clazz);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

}
```

- **结果集工具类**
- **JsonResult.java**

```java
package com.zpark.legou.utils;

import jakarta.servlet.http.HttpServletResponse;
import lombok.Data;
import org.springframework.http.MediaType;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/**
 * 结果集工具类
 */
@Data
public class JsonResult {

    //信息
    private String msg;
    //状态码
    private Integer code;
    //状态
    private Boolean state;
    //数据
    private Map<String, Object> data;

    private JsonResult(String msg, Integer code, Boolean state, Map<String, Object> data) {
        this.msg = msg;
        this.code = code;
        this.state = state;
        this.data = data;
    }

    public JsonResult(String msg, Integer code, Boolean state) {
        this(msg, code, state, new HashMap<>());
    }
    //封装成功结果集
    public static JsonResult successful(String msg){
        return new JsonResult(msg, 200, true);
    }
    //封装失败结果集
    public static JsonResult failed(String msg){
        return new JsonResult(msg, 500, false);
    }
    //往结果集放数据
    public JsonResult add(String key, Object value){
        this.data.put(key, value);
        return this;
    }

    public void toWebClient(HttpServletResponse response){
        //响应 json
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        // utF-8
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());

        String json = JsonHelper.toJSON(this);

        try {
            response.getWriter().println(json);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
```

## 02. 商品模块



SPU 商品的最小单位， 

SKU 库存进货的最小单位





spu

gid title desc

1   华为手机mate60pro xxx





sku

id  pid  desc  num ...

1   1      5000 100

2   2     baise 99 4999





### 2.1 数据导入



#### 1. 数据库



- 创建 legou-2104 数据库
- 创建 goods 商品表

```sql
CREATE TABLE goods(
	goods_gid int PRIMARY KEY auto_increment COMMENT '商品编号' ,
	good_url VARCHAR(255) COMMENT '商品图片',
	goods_price DOUBLE(10, 2) COMMENT '商品价格',
	goods_title VARCHAR(255) COMMENT '商品名称',
	goods_stock INT COMMENT '商品库存',
	goods_type VARCHAR(50) COMMENT '商品分类',
	goods_status char(1) DEFAULT '1' COMMENT '商品状态',
	goods_update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '商品添加、更新时间'
);
```




#### 2. Elasticsearch 索引



- 创建 legou-es 索引
- 自定义分词

```json
#创建索引
PUT legou-es-2104
{
  "settings": {
    "analysis": {
      "analyzer": {
        "ik_smart_pinyin": {
          "type": "custom",
          "tokenizer": "ik_smart",
          "filter": ["my_pinyin", "word_delimiter"]
        }
      },
      "filter": {
        "my_pinyin": {
          "type": "pinyin",
          "keep_first_letter": true,
          "keep_separate_first_letter":true,
          "keep_full_pinyin": true,
          "keep_original": true,
          "limit_first_letter_length":16, 
          "lowercase":true
        }
      }
    }
  },
  "mappings": {
    "properties": {
      "title": {
        "type": "text",
        "analyzer": "ik_max_word",
        "fields": {
          "keyword":{
            "type": "keyword",
            "null_value": "null"
          },
          "ik_pinyin": {
            "type":"text",
            "analyzer": "ik_smart_pinyin",
            "search_analyzer": "ik_smart_pinyin"
          },
          "pre_sug_name": {
            "type": "completion",
            "analyzer": "ik_smart"
          }
        }
      },
      "url": {
        "type": "keyword"
      },
      "price": {
        "type": "double"
      },
      "type": {
        "type": "keyword"
      }
    }
  }
  
}
```


#### 3. Logstash 同步数据



> === 同步方案：根据时间戳更新 / 同步
>
> === 同步逻辑："上架状态" 的商品才进行 es 同步

- 将  [mysql-connector-j-8.3.0.jar](..\..\..\repo\com\mysql\mysql-connector-j\8.3.0\mysql-connector-j-8.3.0.jar)  拷贝到 logstash-8.12.2\logstash-core\lib\jars\ 下
- logstash-8.12.2\config 下创建 logstash-lego-2104.conf

```json
input {
    jdbc {
        jdbc_driver_class => "com.mysql.cj.jdbc.Driver"
        jdbc_connection_string => "jdbc:mysql://localhost:3306/legou-2104?serverTimezone=Asia/Shanghai"
        jdbc_user => "root"
        jdbc_password => "root"
        #追踪字段的类型，⽬前只有数字(numeric)和时间类型(timestamp)，默认是数字类型
        tracking_column_type => "timestamp"
        #记录最后⼀次运⾏的结果
        #如果为真,将会把上次执行到的 tracking_column 字段的值记录下来,保存到 last_run_metadata_path 指定的文件中
        record_last_run => true
        #上⾯运⾏结果的保存位置
        last_run_metadata_path => "legou-2104.txt"
        statement => "select * from goods where goods_update_time > (select date_add(:sql_last_value, interval 8 hour))"
        #设置监听间隔
        schedule => "*/5 * * * * *"
    }
}
filter {
    if[goods_status] == "0" {
        drop{}
    }
    mutate {
        copy => { "goods_gid" => "[@metadata][_id]" }
        remove_field => ["goods_gid", "goods_stock", "goods_status", "goods_update_time", "@version", "@timestamp"]
        rename => {
            "good_url" => "url"
            "goods_price" => "price"
            "goods_title" => "title"
            "goods_type" => "type"
        }
    }
}
output {
    elasticsearch {
        document_id => "%{[@metadata][_id]}"
        index => "legou-es-2104"
        hosts => ["http://localhost:9200"]
    }
    #  输出详细日志格式显示
    stdout{
        codec => rubydebug
    }
}
```



读取文件运行：

logstash.bat -f D:\elk\logstash-8.12.2\config\logstash-lego-2104.conf


#### 4. Elasticsearch 环境



- **pom.xml**

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-elasticsearch</artifactId>
</dependency>
```





### 2.2 关键词分页查询



> === 查 ES 里的数据（全部都是上架）



- **商品 ES 实体类**
- **GoodsEs.java**

```java
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
```

- **数据层**
- **GoodsEsRepository.java**

```java
package com.zpark.legou.goods;

import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.annotations.Highlight;
import org.springframework.data.elasticsearch.annotations.HighlightField;
import org.springframework.data.elasticsearch.annotations.HighlightParameters;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.SearchPage;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GoodsEsRepository extends ElasticsearchRepository<GoodsEs, String> {

    @Highlight(fields = {
            @HighlightField(name = "title",
                            parameters = @HighlightParameters(preTags = "<span style='color:red;'>",
                                                              postTags = "</span>"))
    })
    SearchPage<GoodsEs> findByTitle(String keywords, Pageable pageable);
}
```

- **业务层**
- **GoodsService.java**

```java
package com.zpark.legou.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchPage;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GoodsService {

    @Autowired
    GoodsEsRepository goodsEsRepository;

    /**
     * 关键词分页查找商品列表
     * @param keywords 关键词
     * @param page 当前页
     * @param pageSize 每页显示条数
     * @return 商品列表、总页数、符合条件的商品总数
     */
    public Map<String, Object> searchGoods(String keywords, int page, int pageSize){

        //分页
        Pageable pageable = Pageable.ofSize(pageSize).withPage(page);
        //获取查询结果 包括分页信息、高亮信息.....
        SearchPage<GoodsEs> searchPage = goodsEsRepository.findByTitle(keywords, pageable);

        List<SearchHit<GoodsEs>> searchHits = searchPage.getContent();

        List<GoodsEs> goodsList = searchHits.stream().map(searchHit -> {
            //获取原始数据
            GoodsEs goodsEs = searchHit.getContent();
            //高亮数据 替换 原始 title
            List<String> highlightTitle = searchHit.getHighlightField("title");
            goodsEs.setTitle(highlightTitle.get(0));
            return goodsEs;
        }).toList();

        //获取分页总数
        int totalPages = searchPage.getTotalPages();
        //获取商品总数
        long totalGoods = searchPage.getTotalElements();

        return Map.of("goodsList", goodsList,
                "totalPages", totalPages,
                "totalGoods", totalGoods);

    }
}
```

- **控制层**
- **GoodsController.java**

```java
package com.zpark.legou.goods;

import com.zpark.legou.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @GetMapping("anonymous/goods")
    public JsonResult searchGoods(String keywords,
                                  @RequestParam(required = false, defaultValue = "0") int page,
                                  @RequestParam(required = false, defaultValue = "15") int pageSize){

        Map<String, Object> map = goodsService.searchGoods(keywords, page, pageSize);

        return JsonResult.successful("查询成功")
                .add("goodsList", map.get("goodsList"))
                .add("totalPages", map.get("totalPages"))
                .add("totalGoods", map.get("totalGoods"))
                .add("keywords", keywords)
                .add("page", page);
    }
}
```

http://localhost:8080/anonymous/goods?keywords=迪奥口红



### 2.3 搜索自动补全



> === 输入框前缀自动补全



```json
#搜索自动补全 迪
GET legou-es-2104/_search
{
  "suggest": {
    "prefix_suggestion": {
      "prefix": "迪",
      "completion": {
        "field": "title.pre_sug_name",
        "skip_duplicates": true,
        "size": 5
      }
    }
  }
}
```

- **业务层**
- **GoodsService.java**

```java
package com.zpark.legou.goods;

import co.elastic.clients.elasticsearch.core.search.CompletionSuggester;
import co.elastic.clients.elasticsearch.core.search.FieldSuggester;
import co.elastic.clients.elasticsearch.core.search.Suggester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.client.elc.NativeQuery;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.SearchPage;
import org.springframework.data.elasticsearch.core.suggest.response.Suggest;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class GoodsService {

    @Autowired
    GoodsEsRepository goodsEsRepository;
    @Autowired
    ElasticsearchOperations elasticsearchOperations;

	//... ...

    /**
     * 搜索自动补全
     * @param prefix 前缀
     * @return 推荐列表
     */
    public List<String> suggestSearch(String prefix){

        CompletionSuggester completionSuggester = new CompletionSuggester.Builder().field("title.pre_sug_name").skipDuplicates(true).size(5).build();

        FieldSuggester fieldSuggester = new FieldSuggester.Builder().prefix(prefix).completion(completionSuggester).build();

        Suggester suggester = new Suggester.Builder().suggesters("prefix_suggestion", fieldSuggester).build();

        NativeQuery nativeQuery = NativeQuery.builder()
                .withSuggester(suggester) 
                .build();

        SearchHits<GoodsEs> searchHits = elasticsearchOperations.search(nativeQuery, GoodsEs.class);

        Suggest suggest = searchHits.getSuggest();

        ArrayList<String> list = new ArrayList<>();

        suggest.getSuggestion("prefix_suggestion")
                .getEntries()
                .forEach(sug -> sug.getOptions().forEach(option -> list.add(option.getText())));

        return list;
    }

}
```

- **控制层**
- **GoodsController.java**

```java
package com.zpark.legou.goods;

import com.zpark.legou.utils.JsonResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@Tag(name = "GoodsController", description = "商品模块")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    //... ...

    //自动补全
    @GetMapping("anonymous/goods/suggest")
    public JsonResult getSuggest(String prefix){
        List<String> suggestList = goodsService.suggestSearch(prefix);
        return JsonResult.successful("查询成功")
                .add("suggestList", suggestList);
    }
}
```

http://localhost:8080/anonymous/goods/suggest?prefix=迪



### 2.4 新增商品



> === 新增商品 mysql, 如果是上架状态，Logstash 会自动同步数据到 es
>
> === 同步方式： Logstash 时间戳



- **商品 mysql 实体类**
- **Goods.java**

```java
package com.zpark.legou.goods;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Goods {

    private String gid;
    private String url;
    private Double price;
    private String title;
    private Integer stock;
    private String type;
    private GoodsStatusEnum status;
    private LocalDateTime updateTime;

}

```

- **商品状态泛型**
- **GoodsStatusEnum.java**

```java
package com.zpark.legou.goods;

/**
 * 商品枚举类
 */
public enum GoodsStatusEnum {

    下架(0),
    上架(1);

    public Integer status;

    GoodsStatusEnum(Integer status) {
        this.status = status;
    }
}
```

- **数据层**
- **GoodsMapper.java**

```java
package com.zpark.legou.goods;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodsMapper {

    int insertGoods(Goods goods);
}
```

- **src/main/resources/mappers/GoodsMapper.xml**

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.zpark.legou.goods.GoodsMapper">

    <resultMap id="baseGoods" type="com.zpark.legou.goods.Goods">
        <id property="gid" column="goods_gid"/>
        <result property="url" column="good_url"/>
        <result property="price" column="goods_price"/>
        <result property="title" column="goods_title"/>
        <result property="stock" column="goods_stock"/>
        <result property="type" column="goods_type"/>
        <result property="status" column="goods_status" typeHandler="org.apache.ibatis.type.EnumOrdinalTypeHandler"/>
        <result property="updateTime" column="goods_update_time"/>
    </resultMap>


    <insert id="insertGoods"
            parameterType="com.zpark.legou.goods.Goods"
            useGeneratedKeys="true"
            keyColumn="goods_gid"
            keyProperty="gid">
        insert into goods(goods_gid,
                          good_url,
                          goods_price,
                          goods_title,
                          goods_stock,
                          goods_type,
                          goods_status,
                          goods_update_time)
        value(null, #{url}, #{price}, #{title}, #{stock}, #{type}, #{status,typeHandler=org.apache.ibatis.type.EnumOrdinalTypeHandler}, NOW())

    </insert>

</mapper>
```

- **业务层**
- **GoodsService.java**

```java
package com.zpark.legou.goods;

import co.elastic.clients.elasticsearch.core.search.CompletionSuggester;
import co.elastic.clients.elasticsearch.core.search.FieldSuggester;
import co.elastic.clients.elasticsearch.core.search.Suggester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.client.elc.NativeQuery;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.SearchPage;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class GoodsService {

    @Autowired
    GoodsEsRepository goodsEsRepository;
    @Autowired
    ElasticsearchOperations elasticsearchOperations;
    @Autowired
    GoodsMapper goodsMapper;

    //... ...

    /**
     * 新增商品
     * @param goods 要新增的商品信息
     * @return 是否新增成功
     */
    public Boolean addGoods(Goods goods){
        return goodsMapper.insertGoods(goods) > 0 ;
    }


}
```

- **控制层**
- **GoodsController.java**

```java
package com.zpark.legou.goods;

import com.zpark.legou.utils.JsonResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@Tag(name = "GoodsController", description = "商品模块")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    // ... ...

    //新增商品
    @PutMapping("admin/goods/add")
    public JsonResult addGoods(Goods goods, MultipartFile file) throws IOException {
        // 获取商品图片名称
        String filename = file.getOriginalFilename();

        System.out.println("goods = " + goods);
        System.out.println("filename = " + filename);

        //商品图片存放路径  legou-123456545653-aa.png
        String pathName = "legou-" + UUID.randomUUID() + "-" + filename;
        //d:\data-2103\legou-123456545653-aa.png
        Files.write(Paths.get("d:\\data-2103\\" + pathName), file.getBytes());
        //http://127.0.0.1:8080/anonymous/data/legou-123456545653-aa.png
        ///anonymous/data   ->  d:\data-2103\
        goods.setUrl("http://127.0.0.1:8080/anonymous/data/" + pathName);

        Boolean flag = goodsService.addGoods(goods);

        return flag ? JsonResult.successful("新增商品成功").add("goods", goods)
                : JsonResult.failed("新增商品失败");
    }
}
```

- **配置 Servlet 文件上传大小不超过 10MB**
- **application.properties**

```properties
#Servlet 文件上传大小限制 默认 1M  改为 10M
spring.servlet.multipart.max-file-size=10MB
spring.servlet.multipart.max-request-size=100MB
```

- **配置磁盘资源映射路径**
- **SpringWebContextConfig.java**

```java
package com.zpark.legou.conf;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SpringWebContextConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // http://127.0.0.1:8080/anonymous/data/legou-123456545653-aa.png
        registry.addResourceHandler("/anonymous/data/**")
                .addResourceLocations("file:D:\\data-2103\\");
    }
}
```

启动项目、启动 Elasticsearch、 启动 Logstash




### 2.5 商品详情查询



> === 从 es 里根据 id 查询商品详情



- **业务层**
- **GoodsService.java**

```java
package com.zpark.legou.goods;

import co.elastic.clients.elasticsearch.core.search.CompletionSuggester;
import co.elastic.clients.elasticsearch.core.search.FieldSuggester;
import co.elastic.clients.elasticsearch.core.search.Suggester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.client.elc.NativeQuery;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.SearchPage;
import org.springframework.data.elasticsearch.core.suggest.response.Suggest;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class GoodsService {

    @Autowired
    GoodsEsRepository goodsEsRepository;
    @Autowired
    ElasticsearchOperations elasticsearchOperations;
    @Autowired
    GoodsMapper goodsMapper;

    //... ...

    //根据 id 查询商品详情
    public GoodsEs findGoodsEsById(String id){
        Optional<GoodsEs> optional = goodsEsRepository.findById(id);
        return optional.orElse(null);
    }

}
```

- **控制层**
- **GoodsController.java**

```java
package com.zpark.legou.goods;

import com.zpark.legou.utils.JsonResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@RestController
@Tag(name = "GoodsController", description = "商品模块")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    //... ...

    //根据 id 去 es查询商品详情
    @GetMapping("goods/{id}")
    public JsonResult getGoods(@PathVariable String id){
        GoodsEs goodsEs = goodsService.findGoodsEsById(id);
        return Objects.nonNull(goodsEs) ? JsonResult.successful("查询成功").add("goods", goodsEs)
                : JsonResult.successful("抱歉，该商品已下架");
    }

}
```



### 2.6 热门商品推荐



> === 热门商品：就是点击量 或 购买量高的商品



> [!TIP]
>
> - 每次 es 查询某个商品详情时，记录一次访问量 到 redis
>
> - 业务逻辑：访问一次 分数+1， 下单一次 分数+3
>
> - redis 1.根据浏览量 2.销量 3.综合（浏览量+销量）  (不重复有序)  zset   [key, goodsId, score]  
>
>   ["view"] 
>
>   1, 10
>
>   2, 9
>
>   7, 6
>
>   ["deal",goodsId score]
>
>   ... ...
>
> - redis 何时更新热门商品？
>
>   方式一：热门商品 key 有效期为一周，使用定时任务删除 热门 key (不建议，redis 有空档期，周末热点曝光时间少)
>
>   方式二： key 永不过期，记录分数时，加入时间分数，如在原有的业务分数上，每隔一小时 分数额外 + 1





2024.1.1   now()



1   10   3000+10 = 3010 + 3010 + 3010

2   10   3001+10 = 3011





- **redis依赖**
- **pom.xml**

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-redis</artifactId>
</dependency>
```

- **Redis配置类**
- **RedisConfig.java**

```java
package com.zpark.legou.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;

@Configuration
public class RedisConfig {

    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory){

        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();
        redisTemplate.setConnectionFactory(factory);

        //key 序列化 string
        redisTemplate.setKeySerializer(RedisSerializer.string());
        redisTemplate.setHashKeySerializer(RedisSerializer.string());
        //value 序列化 json
        redisTemplate.setValueSerializer(RedisSerializer.json());
        redisTemplate.setHashValueSerializer(RedisSerializer.json());

        return redisTemplate;
    }
}
```

- **redis 异步任务类：记录热门分数**
- **RedisRecord.java**

```java
package com.zpark.legou.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.time.LocalDateTime;

/**
 * redis 计数类  [key goodsId score]
 */
@Component
public class RedisRecord {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    //热门商品类型键：
    public static final String VIEWKEY = "goods:view"; //按浏览量
    public static final String DEALKEY = "goods:deal"; //按销量
    public static final String ROUNDKEY = "goods:round"; //综合
    //时间基数
    public static final LocalDateTime TIMEBASE = LocalDateTime.of(2024, 1, 1, 0, 0);

    //根据 id 查询商品时，记录访问量到 redis
    //下单时，根据 id 记录销量到 redis
    @Async //异步任务
    public void _record(String key, String goodsId){

        //业务分数 浏览量 +1  销量 + 3
        long score = switch (key){
            case VIEWKEY -> 1;
            case DEALKEY -> 3;
            default -> 0;
        };
        //时间分数 2024.1.1 ~ now() 有多少小时 每小时 + 1
        long time = Duration.between(TIMEBASE, LocalDateTime.now()).toHours();

        ZSetOperations<String, Object> zSet = redisTemplate.opsForZSet();
        zSet.incrementScore(key, goodsId, time + score); //按浏览量/订单量 累计
        zSet.incrementScore(ROUNDKEY, goodsId, time + score);

    }

}
```

- **项目开启异步注解支持**
- **LegouProApplication.java**

```java
package com.zpark.legou;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync // 开启异步任务注解支持
public class LegouProApplication {

    public static void main(String[] args) {
        SpringApplication.run(LegouProApplication.class, args);
    }

}
```

- **业务层**
- **GoodsService.java**

```java
package com.zpark.legou.goods;

import co.elastic.clients.elasticsearch.core.search.CompletionSuggester;
import co.elastic.clients.elasticsearch.core.search.FieldSuggester;
import co.elastic.clients.elasticsearch.core.search.Suggester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.client.elc.NativeQuery;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.SearchPage;
import org.springframework.data.elasticsearch.core.suggest.response.Suggest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class GoodsService {

    @Autowired
    GoodsEsRepository goodsEsRepository;
    @Autowired
    ElasticsearchOperations elasticsearchOperations;
    @Autowired
    GoodsMapper goodsMapper;
    @Autowired
    RedisTemplate<String, Object> redisTemplate;
    @Autowired
    RedisRecord redisRecord;

    // ... ...


    //根据 id 查询商品详情
    public GoodsEs findGoodsEsById(String id, boolean flag){
        Optional<GoodsEs> optional = goodsEsRepository.findById(id);
        //如果是用户调用 需要记录一次访问量
        if (optional.isPresent()){
            GoodsEs goodsEs = optional.get();
            //根据 flag 决定此次查询是否需要记录访问量到redis
            //如果不是用户 ，代码逻辑上需要调用当前方法，不需要记录访问量
            if (flag) {
                redisRecord._record(RedisRecord.VIEWKEY, id);
            }
            return goodsEs;
        }
        return null;
    }

    /**
     * 获取热门商品数据
     * @param key view 按浏览量 deal 按销量 round 综合
     * @param size 前 size 名
     * @return 热门商品列表
     */
    public List<GoodsEs> getHotGoods(String key, int size){
        key = switch (key){
            case "view" -> RedisRecord.VIEWKEY;
            case "deal" -> RedisRecord.DEALKEY;
            default -> RedisRecord.ROUNDKEY;
        };
        //获取到前 size 名的热门商品 id
        Set<Object> hotGoodsIdSet = redisTemplate.opsForZSet().reverseRange(key, 0, size - 1);
        return hotGoodsIdSet == null ? null
                : hotGoodsIdSet.stream().map(id -> findGoodsEsById((String) id, false)).toList();
    }

}

```



- **控制层**
- **RedisController.java**

```java
package com.zpark.legou.goods;

import com.zpark.legou.utils.JsonResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@RestController
@Tag(name = "GoodsController", description = "商品模块")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    // ... ...

    //获取热门商品列表  view 按浏览量 deal 按销量 round 综合
    @GetMapping("anonymous/goods/hotgoods")
    public JsonResult hotGoods(@RequestParam(required = false, defaultValue = "round") String key,
                               @RequestParam(required = false, defaultValue = "10") Integer size){
        return JsonResult.successful("热门商品已更新")
                .add("goods", goodsService.getHotGoods(key, size));

    }

}
```


### 2.7 根据分类查询商品



> === 从 es 根据分类查询商品列表

- **数据层**
- **GoodsEsRepository.java**

```java
package com.zpark.legou.goods;

import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.annotations.Highlight;
import org.springframework.data.elasticsearch.annotations.HighlightField;
import org.springframework.data.elasticsearch.annotations.HighlightParameters;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.SearchPage;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GoodsEsRepository extends ElasticsearchRepository<GoodsEs, String> {

    // ... ...

    SearchPage<GoodsEs> findByType(String type, Pageable pageable);
}
```

- **业务层**
- **GoodsService.java**

```java
package com.zpark.legou.goods;

import co.elastic.clients.elasticsearch.core.search.CompletionSuggester;
import co.elastic.clients.elasticsearch.core.search.FieldSuggester;
import co.elastic.clients.elasticsearch.core.search.Suggester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.client.elc.NativeQuery;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.SearchPage;
import org.springframework.data.elasticsearch.core.suggest.response.Suggest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class GoodsService {

    @Autowired
    GoodsEsRepository goodsEsRepository;
    @Autowired
    ElasticsearchOperations elasticsearchOperations;
    @Autowired
    GoodsMapper goodsMapper;
    @Autowired
    RedisTemplate<String, Object> redisTemplate;
    @Autowired
    RedisRecord redisRecord;

	//... ...

    /**
     * 根据分类 查询商品列表
     * @param type 商品类型
     * @param page 当前页
     * @param size 每页显示条数
     * @return 商品列表、总页数、总商品数
     */
    public Map<String, Object> searchGoodsByType(String type, int page, int size){
        //分页
        Pageable pageable = Pageable.ofSize(size).withPage(page);
        //查询数据
        SearchPage<GoodsEs> searchPage = goodsEsRepository.findByType(type, pageable);
        //获取查询结果
        List<SearchHit<GoodsEs>> content = searchPage.getContent();
        List<GoodsEs> goodsEsList = content.stream().map(SearchHit::getContent).toList();
        //获取总页数
        int totalPages = searchPage.getTotalPages();
        //总商品数
        long totalElements = searchPage.getTotalElements();

        return Map.of("goodsList", goodsEsList,
                    "totalPages", totalPages,
                    "totalElements", totalElements);
    }


}
```

- **控制层**
- **GoodsController.java**

```java
package com.zpark.legou.goods;

import com.zpark.legou.utils.JsonResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@RestController
@Tag(name = "GoodsController", description = "商品模块")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    // ... ...

    //根据分类去 es 里查询分类商品
    @GetMapping("anonymous/goods/type")
    public JsonResult searchGoodsByType(String type,
                                        @RequestParam(required = false, defaultValue = "0") Integer page,
                                        @RequestParam(required = false, defaultValue = "15") Integer size){

        Map<String, Object> map = goodsService.searchGoodsByType(type, page, size);

        return JsonResult.successful("查询成功")
                .add("type", type)
                .add("page", page)
                .add("size", size)
                .add("goodsList", map.get("goodsList"))
                .add("totalPages", map.get("totalPages"))
                .add("totalGoods", map.get("totalElements"));
    }


}
```





### 2.8 查询所有分类



- **商品类型枚举类**
- **GoodsTypeEnum.java**

```java
package com.zpark.legou.goods;

import lombok.Getter;

@Getter
public enum GoodsTypeEnum {

    TYPE1("美妆个护"),
    TYPE2("手机电脑"),
    TYPE3("家具厨具"),
    TYPE4("礼品鲜花"),
    TYPE5("食品生鲜"),
    TYPE6("图书文娱");


    private String typeName;

    GoodsTypeEnum(String typeName) {
        this.typeName = typeName;
    }
}
```

- **业务层**
- **GoodsService.java**

```java
package com.zpark.legou.goods;

import co.elastic.clients.elasticsearch.core.search.CompletionSuggester;
import co.elastic.clients.elasticsearch.core.search.FieldSuggester;
import co.elastic.clients.elasticsearch.core.search.Suggester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.client.elc.NativeQuery;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.SearchPage;
import org.springframework.data.elasticsearch.core.suggest.response.Suggest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class GoodsService {

    @Autowired
    GoodsEsRepository goodsEsRepository;
    @Autowired
    ElasticsearchOperations elasticsearchOperations;
    @Autowired
    GoodsMapper goodsMapper;
    @Autowired
    RedisTemplate<String, Object> redisTemplate;
    @Autowired
    RedisRecord redisRecord;

    // ... ...

    /**
     * 查询所有分类商品
     * @param page 当前页
     * @param size 每页条数
     * @return
     */
    public Map<String, Object> searchGoodsByAllType(int page, int size){

        GoodsTypeEnum[] goodsTypeEnums = GoodsTypeEnum.values();

        HashMap<String, Object> result = new HashMap<>();

        for (GoodsTypeEnum typeEnum : goodsTypeEnums){
            //分类名称
            String typeName = typeEnum.getTypeName();
            //根据分类名称查询商品列表
            Map<String, Object> map = searchGoodsByType(typeName, page, size);
            result.put(typeName, map.get("goodsList"));
        }
        return result;
    }

}
```

- **控制层**
- **GoodsController.java**

```java
package com.zpark.legou.goods;

import com.zpark.legou.utils.JsonResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@RestController
@Tag(name = "GoodsController", description = "商品模块")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    //... ...

    @GetMapping("anonymous/goodstype")
    public JsonResult searchGoodsByAllType(@RequestParam(required = false, defaultValue = "0") int page,
                                           @RequestParam(required = false, defaultValue = "5") int size){
        Map<String, Object> map = goodsService.searchGoodsByAllType(page, size);
        return JsonResult.successful("查询成功")
                .add("goodsList", map);
    }



}
```




















