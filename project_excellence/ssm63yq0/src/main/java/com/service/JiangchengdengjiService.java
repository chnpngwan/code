package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.JiangchengdengjiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.JiangchengdengjiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.JiangchengdengjiView;


/**
 * 奖惩登记
 *
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
public interface JiangchengdengjiService extends IService<JiangchengdengjiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<JiangchengdengjiVO> selectListVO(Wrapper<JiangchengdengjiEntity> wrapper);
   	
   	JiangchengdengjiVO selectVO(@Param("ew") Wrapper<JiangchengdengjiEntity> wrapper);
   	
   	List<JiangchengdengjiView> selectListView(Wrapper<JiangchengdengjiEntity> wrapper);
   	
   	JiangchengdengjiView selectView(@Param("ew") Wrapper<JiangchengdengjiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<JiangchengdengjiEntity> wrapper);
   	

}

