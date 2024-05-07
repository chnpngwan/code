package com.project.demo.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 *租赁合同：(LeaseContract)表实体类
 *
 */
@TableName("`lease_contract`")
@Data
@EqualsAndHashCode(callSuper = false)
public class LeaseContract implements Serializable {

    //LeaseContract编号
    @TableId(value = "lease_contract_id", type = IdType.AUTO)
    private Integer lease_contract_id;
    // 用户名
    @TableField(value = "`user_name`")
    private Integer user_name;
    // 姓名
    @TableField(value = "`full_name`")
    private String full_name;
    // 联系方式
    @TableField(value = "`contact_information`")
    private String contact_information;
    // 合同名称
    @TableField(value = "`contract_name`")
    private String contract_name;
    // 合同文件
    @TableField(value = "`contract_documents`")
    private String contract_documents;
    // 合同内容
    @TableField(value = "`contract_content`")
    private String contract_content;


    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
