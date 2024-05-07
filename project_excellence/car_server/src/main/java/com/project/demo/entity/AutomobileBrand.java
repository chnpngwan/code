package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 *汽车品牌：(AutomobileBrand)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "AutomobileBrand")
public class AutomobileBrand implements Serializable {

    //AutomobileBrand编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "automobile_brand_id")
    private Integer automobile_brand_id;
    // 品牌
    @Basic
    private String brand;

    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
