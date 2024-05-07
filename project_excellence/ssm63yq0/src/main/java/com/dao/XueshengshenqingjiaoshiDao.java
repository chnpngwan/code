package com.dao;

import com.entity.XueshengshenqingjiaoshiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.XueshengshenqingjiaoshiVO;
import com.entity.view.XueshengshenqingjiaoshiView;


/**
 * 学生申请教室
 * 
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
public interface XueshengshenqingjiaoshiDao extends BaseMapper<XueshengshenqingjiaoshiEntity> {
	
	List<XueshengshenqingjiaoshiVO> selectListVO(@Param("ew") Wrapper<XueshengshenqingjiaoshiEntity> wrapper);
	
	XueshengshenqingjiaoshiVO selectVO(@Param("ew") Wrapper<XueshengshenqingjiaoshiEntity> wrapper);
	
	List<XueshengshenqingjiaoshiView> selectListView(@Param("ew") Wrapper<XueshengshenqingjiaoshiEntity> wrapper);

	List<XueshengshenqingjiaoshiView> selectListView(Pagination page,@Param("ew") Wrapper<XueshengshenqingjiaoshiEntity> wrapper);
	
	XueshengshenqingjiaoshiView selectView(@Param("ew") Wrapper<XueshengshenqingjiaoshiEntity> wrapper);
	

}
