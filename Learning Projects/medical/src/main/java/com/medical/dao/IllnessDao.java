package com.medical.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.medical.entity.Illness;
import com.medical.entity.User;
import org.springframework.stereotype.Repository;

/**
 * @author XUEW
 * @apiNote
 */
@Repository
public interface IllnessDao extends BaseMapper<Illness> {

}
