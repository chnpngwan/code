package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.XinlibaogaoEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.XinlibaogaoVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.XinlibaogaoView;


/**
 * 心理报告
 *
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
public interface XinlibaogaoService extends IService<XinlibaogaoEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<XinlibaogaoVO> selectListVO(Wrapper<XinlibaogaoEntity> wrapper);
   	
   	XinlibaogaoVO selectVO(@Param("ew") Wrapper<XinlibaogaoEntity> wrapper);
   	
   	List<XinlibaogaoView> selectListView(Wrapper<XinlibaogaoEntity> wrapper);
   	
   	XinlibaogaoView selectView(@Param("ew") Wrapper<XinlibaogaoEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<XinlibaogaoEntity> wrapper);
   	

}

