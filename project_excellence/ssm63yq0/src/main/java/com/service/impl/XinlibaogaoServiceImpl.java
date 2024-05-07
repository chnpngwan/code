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


import com.dao.XinlibaogaoDao;
import com.entity.XinlibaogaoEntity;
import com.service.XinlibaogaoService;
import com.entity.vo.XinlibaogaoVO;
import com.entity.view.XinlibaogaoView;

@Service("xinlibaogaoService")
public class XinlibaogaoServiceImpl extends ServiceImpl<XinlibaogaoDao, XinlibaogaoEntity> implements XinlibaogaoService {
	

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<XinlibaogaoEntity> page = this.selectPage(
                new Query<XinlibaogaoEntity>(params).getPage(),
                new EntityWrapper<XinlibaogaoEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<XinlibaogaoEntity> wrapper) {
		  Page<XinlibaogaoView> page =new Query<XinlibaogaoView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<XinlibaogaoVO> selectListVO(Wrapper<XinlibaogaoEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public XinlibaogaoVO selectVO(Wrapper<XinlibaogaoEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<XinlibaogaoView> selectListView(Wrapper<XinlibaogaoEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public XinlibaogaoView selectView(Wrapper<XinlibaogaoEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
