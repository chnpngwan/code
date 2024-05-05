package com.dyuloon.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author dyuloon
 * @since 2023-07-26
 */
@Data
  @EqualsAndHashCode(callSuper = false)
    public class PrescriptionDrug implements Serializable {

    private static final long serialVersionUID=1L;

      /**
     * 处方药品id
     */
        @TableId(value = "medicine_id", type = IdType.AUTO)
      private Integer medicineId;

      /**
     * 挂号单id
     */
      private Integer registerId;

      /**
     * 药物id
     */
      private Integer drugsId;

      /**
     * 药物数量
     */
      private Integer medicineNum;

      /**
     * 药物备注
     */
      private String medicineNotes;


}
