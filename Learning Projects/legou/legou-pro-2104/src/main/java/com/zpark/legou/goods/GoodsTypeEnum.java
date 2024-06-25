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
