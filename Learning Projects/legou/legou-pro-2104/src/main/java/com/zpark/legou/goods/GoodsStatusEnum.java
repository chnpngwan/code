package com.zpark.legou.goods;

public enum GoodsStatusEnum {

    下架(0),
    上架(1);

    public Integer status;

    GoodsStatusEnum(Integer status) {
        this.status = status;
    }
}
