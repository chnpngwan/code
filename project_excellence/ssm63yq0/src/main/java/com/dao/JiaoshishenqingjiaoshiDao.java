package com.dao;

import com.entity.JiaoshishenqingjiaoshiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.JiaoshishenqingjiaoshiVO;
import com.entity.view.JiaoshishenqingjiaoshiView;


/**
 * 教师申请教室
 * 
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
public interface JiaoshishenqingjiaoshiDao extends BaseMapper<JiaoshishenqingjiaoshiEntity> {
	
	List<JiaoshishenqingjiaoshiVO> selectListVO(@Param("ew") Wrapper<JiaoshishenqingjiaoshiEntity> wrapper);
	
	JiaoshishenqingjiaoshiVO selectVO(@Param("ew") Wrapper<JiaoshishenqingjiaoshiEntity> wrapper);
	
	List<JiaoshishenqingjiaoshiView> selectListView(@Param("ew") Wrapper<JiaoshishenqingjiaoshiEntity> wrapper);

	List<JiaoshishenqingjiaoshiView> selectListView(Pagination page,@Param("ew") Wrapper<JiaoshishenqingjiaoshiEntity> wrapper);
	
	JiaoshishenqingjiaoshiView selectView(@Param("ew") Wrapper<JiaoshishenqingjiaoshiEntity> wrapper);
	

}
