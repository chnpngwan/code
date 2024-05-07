package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.JiaoshishenqingjiaoshiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.JiaoshishenqingjiaoshiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.JiaoshishenqingjiaoshiView;


/**
 * 教师申请教室
 *
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
public interface JiaoshishenqingjiaoshiService extends IService<JiaoshishenqingjiaoshiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<JiaoshishenqingjiaoshiVO> selectListVO(Wrapper<JiaoshishenqingjiaoshiEntity> wrapper);
   	
   	JiaoshishenqingjiaoshiVO selectVO(@Param("ew") Wrapper<JiaoshishenqingjiaoshiEntity> wrapper);
   	
   	List<JiaoshishenqingjiaoshiView> selectListView(Wrapper<JiaoshishenqingjiaoshiEntity> wrapper);
   	
   	JiaoshishenqingjiaoshiView selectView(@Param("ew") Wrapper<JiaoshishenqingjiaoshiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<JiaoshishenqingjiaoshiEntity> wrapper);
   	

}

