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

import com.entity.JiaoshishenqingjiaoshiEntity;
import com.entity.view.JiaoshishenqingjiaoshiView;

import com.service.JiaoshishenqingjiaoshiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;

/**
 * 教师申请教室
 * 后端接口
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
@RestController
@RequestMapping("/jiaoshishenqingjiaoshi")
public class JiaoshishenqingjiaoshiController {
    @Autowired
    private JiaoshishenqingjiaoshiService jiaoshishenqingjiaoshiService;



    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,JiaoshishenqingjiaoshiEntity jiaoshishenqingjiaoshi, 
		HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("jiaoshi")) {
			jiaoshishenqingjiaoshi.setJiaoshizhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<JiaoshishenqingjiaoshiEntity> ew = new EntityWrapper<JiaoshishenqingjiaoshiEntity>();
		PageUtils page = jiaoshishenqingjiaoshiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiaoshishenqingjiaoshi), params), params));
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,JiaoshishenqingjiaoshiEntity jiaoshishenqingjiaoshi, 
		HttpServletRequest request){
        EntityWrapper<JiaoshishenqingjiaoshiEntity> ew = new EntityWrapper<JiaoshishenqingjiaoshiEntity>();
		PageUtils page = jiaoshishenqingjiaoshiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiaoshishenqingjiaoshi), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( JiaoshishenqingjiaoshiEntity jiaoshishenqingjiaoshi){
       	EntityWrapper<JiaoshishenqingjiaoshiEntity> ew = new EntityWrapper<JiaoshishenqingjiaoshiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( jiaoshishenqingjiaoshi, "jiaoshishenqingjiaoshi")); 
        return R.ok().put("data", jiaoshishenqingjiaoshiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(JiaoshishenqingjiaoshiEntity jiaoshishenqingjiaoshi){
        EntityWrapper< JiaoshishenqingjiaoshiEntity> ew = new EntityWrapper< JiaoshishenqingjiaoshiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( jiaoshishenqingjiaoshi, "jiaoshishenqingjiaoshi")); 
		JiaoshishenqingjiaoshiView jiaoshishenqingjiaoshiView =  jiaoshishenqingjiaoshiService.selectView(ew);
		return R.ok("查询教师申请教室成功").put("data", jiaoshishenqingjiaoshiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        JiaoshishenqingjiaoshiEntity jiaoshishenqingjiaoshi = jiaoshishenqingjiaoshiService.selectById(id);
        return R.ok().put("data", jiaoshishenqingjiaoshi);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        JiaoshishenqingjiaoshiEntity jiaoshishenqingjiaoshi = jiaoshishenqingjiaoshiService.selectById(id);
        return R.ok().put("data", jiaoshishenqingjiaoshi);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody JiaoshishenqingjiaoshiEntity jiaoshishenqingjiaoshi, HttpServletRequest request){
    	jiaoshishenqingjiaoshi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(jiaoshishenqingjiaoshi);

        jiaoshishenqingjiaoshiService.insert(jiaoshishenqingjiaoshi);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
	@IgnoreAuth
    @RequestMapping("/add")
    public R add(@RequestBody JiaoshishenqingjiaoshiEntity jiaoshishenqingjiaoshi, HttpServletRequest request){
    	jiaoshishenqingjiaoshi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(jiaoshishenqingjiaoshi);

        jiaoshishenqingjiaoshiService.insert(jiaoshishenqingjiaoshi);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody JiaoshishenqingjiaoshiEntity jiaoshishenqingjiaoshi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(jiaoshishenqingjiaoshi);
        jiaoshishenqingjiaoshiService.updateById(jiaoshishenqingjiaoshi);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        jiaoshishenqingjiaoshiService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<JiaoshishenqingjiaoshiEntity> wrapper = new EntityWrapper<JiaoshishenqingjiaoshiEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("jiaoshi")) {
			wrapper.eq("jiaoshizhanghao", (String)request.getSession().getAttribute("username"));
		}

		int count = jiaoshishenqingjiaoshiService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	







}
