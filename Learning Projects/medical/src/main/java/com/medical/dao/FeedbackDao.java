package com.medical.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.medical.entity.Feedback;
import com.medical.entity.User;
import org.springframework.stereotype.Repository;

/**
 * @author XUEW
 * @apiNote
 */
@Repository
public interface FeedbackDao extends BaseMapper<Feedback> {

}
