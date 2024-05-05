package com.source.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.source.entity.Source;

public interface SourceMapper {
	//查询
	public List<Source> queryInfo(@Param("name") String name);
	//添加
	public int addSourceInfo(Source source);
	//删除
	public int delSourceById(int id);
    //修改
	public int updateSource(Source source);
	//单条数据查询
	public Source findSourceById(int id);
	
	//分页查询
	List<Source> getSourceLimit(Map<String,Integer> map);
	//总记录数查询
	public int countTotal();
	
}
