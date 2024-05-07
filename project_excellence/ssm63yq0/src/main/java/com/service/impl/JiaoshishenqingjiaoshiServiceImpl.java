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


import com.dao.JiaoshishenqingjiaoshiDao;
import com.entity.JiaoshishenqingjiaoshiEntity;
import com.service.JiaoshishenqingjiaoshiService;
import com.entity.vo.JiaoshishenqingjiaoshiVO;
import com.entity.view.JiaoshishenqingjiaoshiView;

@Service("jiaoshishenqingjiaoshiService")
public class JiaoshishenqingjiaoshiServiceImpl extends ServiceImpl<JiaoshishenqingjiaoshiDao, JiaoshishenqingjiaoshiEntity> implements JiaoshishenqingjiaoshiService {
	

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<JiaoshishenqingjiaoshiEntity> page = this.selectPage(
                new Query<JiaoshishenqingjiaoshiEntity>(params).getPage(),
                new EntityWrapper<JiaoshishenqingjiaoshiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<JiaoshishenqingjiaoshiEntity> wrapper) {
		  Page<JiaoshishenqingjiaoshiView> page =new Query<JiaoshishenqingjiaoshiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<JiaoshishenqingjiaoshiVO> selectListVO(Wrapper<JiaoshishenqingjiaoshiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public JiaoshishenqingjiaoshiVO selectVO(Wrapper<JiaoshishenqingjiaoshiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<JiaoshishenqingjiaoshiView> selectListView(Wrapper<JiaoshishenqingjiaoshiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public JiaoshishenqingjiaoshiView selectView(Wrapper<JiaoshishenqingjiaoshiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
