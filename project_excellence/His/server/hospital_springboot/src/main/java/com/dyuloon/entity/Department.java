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
 * @since 2023-06-06
 */
@Data
  @EqualsAndHashCode(callSuper = false)
    public class Department implements Serializable {

    private static final long serialVersionUID=1L;

      /**
     * 科室编号
     */
        @TableId(value = "department_id", type = IdType.AUTO)
      private Integer departmentId;

      /**
     * 科室名称
     */
        private String departmentName;


}
