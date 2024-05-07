package com.dao;

import com.entity.XinlibaogaoEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.XinlibaogaoVO;
import com.entity.view.XinlibaogaoView;


/**
 * 心理报告
 * 
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
public interface XinlibaogaoDao extends BaseMapper<XinlibaogaoEntity> {
	
	List<XinlibaogaoVO> selectListVO(@Param("ew") Wrapper<XinlibaogaoEntity> wrapper);
	
	XinlibaogaoVO selectVO(@Param("ew") Wrapper<XinlibaogaoEntity> wrapper);
	
	List<XinlibaogaoView> selectListView(@Param("ew") Wrapper<XinlibaogaoEntity> wrapper);

	List<XinlibaogaoView> selectListView(Pagination page,@Param("ew") Wrapper<XinlibaogaoEntity> wrapper);
	
	XinlibaogaoView selectView(@Param("ew") Wrapper<XinlibaogaoEntity> wrapper);
	

}
