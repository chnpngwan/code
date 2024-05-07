package com.dao;

import com.entity.JiangchengdengjiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.JiangchengdengjiVO;
import com.entity.view.JiangchengdengjiView;


/**
 * 奖惩登记
 * 
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
public interface JiangchengdengjiDao extends BaseMapper<JiangchengdengjiEntity> {
	
	List<JiangchengdengjiVO> selectListVO(@Param("ew") Wrapper<JiangchengdengjiEntity> wrapper);
	
	JiangchengdengjiVO selectVO(@Param("ew") Wrapper<JiangchengdengjiEntity> wrapper);
	
	List<JiangchengdengjiView> selectListView(@Param("ew") Wrapper<JiangchengdengjiEntity> wrapper);

	List<JiangchengdengjiView> selectListView(Pagination page,@Param("ew") Wrapper<JiangchengdengjiEntity> wrapper);
	
	JiangchengdengjiView selectView(@Param("ew") Wrapper<JiangchengdengjiEntity> wrapper);
	

}
