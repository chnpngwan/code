package com.house.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.mapper.HouseMapper;
import com.house.model.HouseInfo;

@Service
public class HouseServiceImpl implements HouseService{
	@Autowired
	private HouseMapper houseMapper;
	@Override
	public int deteleHouseById(int id) {
		return houseMapper.deteleHouseById(id);
	}

	@Override
	public List<HouseInfo> queryHouses(String location, Double min, Double max) {
		return houseMapper.queryHouses(location, min, max);
	}
}
