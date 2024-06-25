package com.medical.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.medical.entity.Pageview;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @author xiaobo
 * @date 2022/5/3
 */
@Repository
public interface PageviewDao extends BaseMapper<Pageview> {
}
