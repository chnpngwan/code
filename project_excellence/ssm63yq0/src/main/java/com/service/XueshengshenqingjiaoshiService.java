package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.XueshengshenqingjiaoshiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.XueshengshenqingjiaoshiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.XueshengshenqingjiaoshiView;


/**
 * 学生申请教室
 *
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
public interface XueshengshenqingjiaoshiService extends IService<XueshengshenqingjiaoshiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<XueshengshenqingjiaoshiVO> selectListVO(Wrapper<XueshengshenqingjiaoshiEntity> wrapper);
   	
   	XueshengshenqingjiaoshiVO selectVO(@Param("ew") Wrapper<XueshengshenqingjiaoshiEntity> wrapper);
   	
   	List<XueshengshenqingjiaoshiView> selectListView(Wrapper<XueshengshenqingjiaoshiEntity> wrapper);
   	
   	XueshengshenqingjiaoshiView selectView(@Param("ew") Wrapper<XueshengshenqingjiaoshiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<XueshengshenqingjiaoshiEntity> wrapper);
   	

}

