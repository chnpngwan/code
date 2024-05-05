package com.house.service;

import java.util.List;
import com.house.model.HouseInfo;

public interface HouseService {
	//查询全部数据
	List<HouseInfo> queryHouses(String location,Double min,Double max);
	//删除
	int deteleHouseById(int id);
}
