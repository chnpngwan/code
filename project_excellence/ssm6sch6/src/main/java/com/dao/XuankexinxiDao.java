package com.dao;

import com.entity.XuankexinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.XuankexinxiVO;
import com.entity.view.XuankexinxiView;


/**
 * 选课信息
 * 
 * @author 
 * @email 
 * @date 2021-03-06 08:13:27
 */
public interface XuankexinxiDao extends BaseMapper<XuankexinxiEntity> {
	
	List<XuankexinxiVO> selectListVO(@Param("ew") Wrapper<XuankexinxiEntity> wrapper);
	
	XuankexinxiVO selectVO(@Param("ew") Wrapper<XuankexinxiEntity> wrapper);
	
	List<XuankexinxiView> selectListView(@Param("ew") Wrapper<XuankexinxiEntity> wrapper);

	List<XuankexinxiView> selectListView(Pagination page,@Param("ew") Wrapper<XuankexinxiEntity> wrapper);
	
	XuankexinxiView selectView(@Param("ew") Wrapper<XuankexinxiEntity> wrapper);
	
}