package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.JiangchengdengjiDao;
import com.entity.JiangchengdengjiEntity;
import com.service.JiangchengdengjiService;
import com.entity.vo.JiangchengdengjiVO;
import com.entity.view.JiangchengdengjiView;

@Service("jiangchengdengjiService")
public class JiangchengdengjiServiceImpl extends ServiceImpl<JiangchengdengjiDao, JiangchengdengjiEntity> implements JiangchengdengjiService {
	

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<JiangchengdengjiEntity> page = this.selectPage(
                new Query<JiangchengdengjiEntity>(params).getPage(),
                new EntityWrapper<JiangchengdengjiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<JiangchengdengjiEntity> wrapper) {
		  Page<JiangchengdengjiView> page =new Query<JiangchengdengjiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<JiangchengdengjiVO> selectListVO(Wrapper<JiangchengdengjiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public JiangchengdengjiVO selectVO(Wrapper<JiangchengdengjiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<JiangchengdengjiView> selectListView(Wrapper<JiangchengdengjiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public JiangchengdengjiView selectView(Wrapper<JiangchengdengjiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
