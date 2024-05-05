package com.house.service.impl;

import com.house.mapper.HouseMapper;
import com.house.model.House;
import com.house.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * ProjectName:  ssm
 * PackageName:  com.house.service.impl
 * ClassName:    HouseServiceImpl
 *
 * @Author chnpngwng
 * @Date 2023 06 19 16 05
 **/
@Service
public class HouseServiceImpl implements HouseService {
   //调用Dao
	@Autowired
	private HouseMapper houseMapper;
	
	@Override
	public List<House> query(String location, Double min, Double max) {
		return houseMapper.query(location,min,max);
	}

	@Override
	public int deleteById(int id) {
		return houseMapper.deleteById(id);
	}

}
