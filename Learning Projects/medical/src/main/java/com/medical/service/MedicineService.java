package com.medical.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.medical.dao.MedicalNewsDao;
import com.medical.dao.MedicineDao;
import com.medical.entity.Medicine;
import com.medical.utils.Assert;
import com.medical.utils.BeanUtils;
import com.medical.utils.VariableNameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author XUEW
 * @apiNote
 */
@Service
public class MedicineService extends BaseService<Medicine> {

    @Autowired
    protected MedicineDao medicineDao;

    @Override
    public List<Medicine> query(Medicine o) {
        QueryWrapper<Medicine> wrapper = new QueryWrapper();
        if (Assert.notEmpty(o)) {
            Map<String, Object> bean2Map = BeanUtils.bean2Map(o);
            for (String key : bean2Map.keySet()) {
                if (Assert.isEmpty(bean2Map.get(key))) {
                    continue;
                }
                wrapper.eq(VariableNameUtils.humpToLine(key), bean2Map.get(key));
            }
        }
        return medicineDao.selectList(wrapper);
    }

    @Override
    public List<Medicine> all() {
        return query(null);
    }

    @Override
    public Medicine save(Medicine o) {
        if (Assert.isEmpty(o.getId())) {
            medicineDao.insert(o);
        } else {
            medicineDao.updateById(o);
        }
        return medicineDao.selectById(o.getId());
    }

    @Override
    public Medicine get(Serializable id) {
        return medicineDao.selectById(id);
    }

    @Override
    public int delete(Serializable id) {
        return medicineDao.deleteById(id);
    }

    public Map<String,Object> getMedicineList(String nameValue,Integer page) {

        List<Medicine> medicineList = null;
        Map<String,Object> map = new HashMap<>(4);
        if (Assert.notEmpty(nameValue)){
             medicineList = medicineDao.selectList(new QueryWrapper<Medicine>().
                    like("medicine_name", nameValue)
                    .or().like("keyword", nameValue)
                     .or().like("medicine_effect",nameValue)
                    .last("limit " + (page - 1) * 9 + "," + page * 9));
        }else {
            medicineList = medicineDao.selectList(new QueryWrapper<Medicine>()
                    .last("limit " + (page - 1) * 9 + "," + page * 9));
        }

        map.put("medicineList",medicineList);
        map.put("size",medicineList.size()<9?1:medicineList.size()/9+1);
        return map;
    }
}