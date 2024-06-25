package com.medical.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.medical.dao.IllnessDao;
import com.medical.dao.IllnessKindDao;
import com.medical.entity.IllnessKind;
import com.medical.entity.IllnessKind;
import com.medical.utils.Assert;
import com.medical.utils.BeanUtils;
import com.medical.utils.VariableNameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @author XUEW
 * @apiNote
 */
@Service
public class IllnessKindService extends BaseService<IllnessKind> {

    @Autowired
    protected IllnessKindDao illnessKindDao;

    @Override
    public List<IllnessKind> query(IllnessKind o) {
        QueryWrapper<IllnessKind> wrapper = new QueryWrapper();
        if (Assert.notEmpty(o)) {
            Map<String, Object> bean2Map = BeanUtils.bean2Map(o);
            for (String key : bean2Map.keySet()) {
                if (Assert.isEmpty(bean2Map.get(key))) {
                    continue;
                }
                wrapper.eq(VariableNameUtils.humpToLine(key), bean2Map.get(key));
            }
        }
        return illnessKindDao.selectList(wrapper);
    }

    @Override
    public List<IllnessKind> all() {
        return query(null);
    }

    @Override
    public IllnessKind save(IllnessKind o) {
        if (Assert.isEmpty(o.getId())) {
            illnessKindDao.insert(o);
        } else {
            illnessKindDao.updateById(o);
        }
        return illnessKindDao.selectById(o.getId());
    }

    @Override
    public IllnessKind get(Serializable id) {
        return illnessKindDao.selectById(id);
    }

    @Override
    public int delete(Serializable id) {
        return illnessKindDao.deleteById(id);
    }

    public List<IllnessKind> findList(){
        return illnessKindDao.selectList(new QueryWrapper<IllnessKind>());
    }
}