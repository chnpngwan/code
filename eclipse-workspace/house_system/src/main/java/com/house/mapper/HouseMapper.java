package com.house.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.house.model.HouseInfo;

public interface HouseMapper {
	//查询全部数据
	List<HouseInfo> queryHouses(@Param("location") String location,@Param("min") Double min,@Param("max")  Double max);
	//删除
	int deteleHouseById(int id);
}
