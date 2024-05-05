package com.house.mapper;

import com.house.model.House;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * ProjectName:  ssm
 * PackageName:  com.house.mapper
 * ClassName:    HouseMapper
 *
 * @Author chnpngwng
 * @Date 2023 06 19 16 05
 **/
public interface HouseMapper {
    
	//查询
	public List<House> query(@Param("location") String location, @Param("min")Double min, @Param("max")Double max);
	
	//删除
	public int deleteById(int id);
}
