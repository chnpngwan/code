package com.house.service;

import com.house.model.House;

import java.util.List;
/**
 * ProjectName:  ssm
 * PackageName:  com.house.service
 * ClassName:    HouseService
 *
 * @Author chnpngwng
 * @Date 2023 06 19 16 05
 **/
public interface HouseService {
	//查询
		public List<House> query(String location,Double min, Double max);
		

		//删除
		public int deleteById(int id);
		

}
