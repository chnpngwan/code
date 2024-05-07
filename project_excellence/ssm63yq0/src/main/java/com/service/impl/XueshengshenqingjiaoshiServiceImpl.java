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


import com.dao.XueshengshenqingjiaoshiDao;
import com.entity.XueshengshenqingjiaoshiEntity;
import com.service.XueshengshenqingjiaoshiService;
import com.entity.vo.XueshengshenqingjiaoshiVO;
import com.entity.view.XueshengshenqingjiaoshiView;

@Service("xueshengshenqingjiaoshiService")
public class XueshengshenqingjiaoshiServiceImpl extends ServiceImpl<XueshengshenqingjiaoshiDao, XueshengshenqingjiaoshiEntity> implements XueshengshenqingjiaoshiService {
	

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<XueshengshenqingjiaoshiEntity> page = this.selectPage(
                new Query<XueshengshenqingjiaoshiEntity>(params).getPage(),
                new EntityWrapper<XueshengshenqingjiaoshiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<XueshengshenqingjiaoshiEntity> wrapper) {
		  Page<XueshengshenqingjiaoshiView> page =new Query<XueshengshenqingjiaoshiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<XueshengshenqingjiaoshiVO> selectListVO(Wrapper<XueshengshenqingjiaoshiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public XueshengshenqingjiaoshiVO selectVO(Wrapper<XueshengshenqingjiaoshiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<XueshengshenqingjiaoshiView> selectListView(Wrapper<XueshengshenqingjiaoshiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public XueshengshenqingjiaoshiView selectView(Wrapper<XueshengshenqingjiaoshiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
