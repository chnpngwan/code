package com.medical.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.crypto.interfaces.PBEKey;
import java.io.Serializable;

/**
 * @author xiaobo
 * @date 2022/5/3
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@TableName("pageview")
public class Pageview implements Serializable {

    /**
     * 浏览量主键id
     */
    private int id;

    /**
     * 浏览量
     */
    private Integer pageviews;


    /**
     * 病的id
     */
    private Integer illnessId;
}
