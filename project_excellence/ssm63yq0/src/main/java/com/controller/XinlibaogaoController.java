package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.XinlibaogaoEntity;
import com.entity.view.XinlibaogaoView;

import com.service.XinlibaogaoService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;

/**
 * 心理报告
 * 后端接口
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
@RestController
@RequestMapping("/xinlibaogao")
public class XinlibaogaoController {
    @Autowired
    private XinlibaogaoService xinlibaogaoService;



    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,XinlibaogaoEntity xinlibaogao, 
		HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("xuesheng")) {
			xinlibaogao.setXuehao((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("jiaoshi")) {
			xinlibaogao.setJiaoshizhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<XinlibaogaoEntity> ew = new EntityWrapper<XinlibaogaoEntity>();
		PageUtils page = xinlibaogaoService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xinlibaogao), params), params));
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,XinlibaogaoEntity xinlibaogao, 
		HttpServletRequest request){
        EntityWrapper<XinlibaogaoEntity> ew = new EntityWrapper<XinlibaogaoEntity>();
		PageUtils page = xinlibaogaoService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xinlibaogao), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( XinlibaogaoEntity xinlibaogao){
       	EntityWrapper<XinlibaogaoEntity> ew = new EntityWrapper<XinlibaogaoEntity>();
      	ew.allEq(MPUtil.allEQMapPre( xinlibaogao, "xinlibaogao")); 
        return R.ok().put("data", xinlibaogaoService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(XinlibaogaoEntity xinlibaogao){
        EntityWrapper< XinlibaogaoEntity> ew = new EntityWrapper< XinlibaogaoEntity>();
 		ew.allEq(MPUtil.allEQMapPre( xinlibaogao, "xinlibaogao")); 
		XinlibaogaoView xinlibaogaoView =  xinlibaogaoService.selectView(ew);
		return R.ok("查询心理报告成功").put("data", xinlibaogaoView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        XinlibaogaoEntity xinlibaogao = xinlibaogaoService.selectById(id);
        return R.ok().put("data", xinlibaogao);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        XinlibaogaoEntity xinlibaogao = xinlibaogaoService.selectById(id);
        return R.ok().put("data", xinlibaogao);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody XinlibaogaoEntity xinlibaogao, HttpServletRequest request){
    	xinlibaogao.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(xinlibaogao);

        xinlibaogaoService.insert(xinlibaogao);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody XinlibaogaoEntity xinlibaogao, HttpServletRequest request){
    	xinlibaogao.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(xinlibaogao);

        xinlibaogaoService.insert(xinlibaogao);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody XinlibaogaoEntity xinlibaogao, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xinlibaogao);
        xinlibaogaoService.updateById(xinlibaogao);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        xinlibaogaoService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<XinlibaogaoEntity> wrapper = new EntityWrapper<XinlibaogaoEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("xuesheng")) {
			wrapper.eq("xuehao", (String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("jiaoshi")) {
			wrapper.eq("jiaoshizhanghao", (String)request.getSession().getAttribute("username"));
		}

		int count = xinlibaogaoService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	







}
