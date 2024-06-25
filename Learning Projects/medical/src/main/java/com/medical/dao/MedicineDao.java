package com.medical.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.medical.entity.Medicine;
import com.medical.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author XUEW
 * @apiNote
 */
@Repository
public interface MedicineDao extends BaseMapper<Medicine> {

    /**
     * description: 根据疾病查询药物
     * @param  id
     * @return: java.util.List<java.util.Map<java.lang.String,java.lang.Object>>
     * @author bo
     * @date 2022/5/1 2:18 PM
     */
    List<Map<String,Object>> findMedicineList(Integer illnessId);

}
