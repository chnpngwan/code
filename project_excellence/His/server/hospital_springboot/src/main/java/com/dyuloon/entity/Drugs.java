package com.dyuloon.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
@Data
  @EqualsAndHashCode(callSuper = false)
    public class Drugs implements Serializable {

    private static final long serialVersionUID=1L;

      /**
     * 药品编号
     */
        @TableId(value = "drugs_id", type = IdType.AUTO)
      private Integer drugsId;

      /**
     * 药品类型
     */
      private String drugsType;

      /**
     * 药品名称
     */
      private String drugsName;

      /**
     * 生产地点
     */
      private String productionLocation;

      /**
     * 生产日期
     */
      private LocalDate productionDate;

      /**
     * 有效期
     */
      private LocalDate termValidity;

      /**
     * 治疗功效
     */
      private String therapeuticEfficacy;

      /**
     * 库存数量
     */
      private Integer inventoryNum;

      /**
     * 入库单价
     */
      private Float receiptPrice;

      /**
     * 出库单价
     */
      private Float deliveryPrice;

      /**
     * 药品库存位置
     */
      private String duresPosition;


}
