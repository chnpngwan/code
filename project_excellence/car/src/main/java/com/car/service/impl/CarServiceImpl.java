package com.car.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.car.mapper.CarMapper;
import com.car.model.*;
import com.car.service.CarService;
import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl implements CarService {

	@Resource
	public CarMapper carMapper;
	
	@Override
	public List<Car> selectAllCar() {
		return carMapper.selectAllCar();
	}

	@Override
	public List<Car> selectByName(String name) {
		return carMapper.selectByName(name);
	}

	@Override
	public List<Car1> selectAllCar1() {
		return carMapper.selectAllCar1();
	}

	@Override
	public List<Car3> selectAllCar3() {
		return carMapper.selectAllCar3();
	}

	@Override
	public List<Car4> selectAllCar4() {
		return carMapper.selectAllCar4();
	}

	@Override
	public List<Car5> selectAllCar5() {
		return carMapper.selectAllCar5();
	}

	@Override
	public List<Client> selectSllClient() {
		return carMapper.selectSllClient();
	}

	@Override
	public List<Client> selectAllAdminClient() {
		return carMapper.selectAllAdminClient();
	}

	@Override
	public List<Driver> selectSAllDriver() {
		return carMapper.selectSAllDriver();
	}

	@Override
	public List<Driver> selectAllDriverAdmin() {
		return carMapper.selectAllDriverAdmin();
	}

	@Override
	public int insertINtoCont(Cont cont) {
		return carMapper.insertINtoCont(cont);
	}

	@Override
	public List<Cont> selectAllCont() {
		return carMapper.selectAllCont();
	}

	@Override
	public List<CarAll> selectSAllCarAll() {
		return carMapper.selectSAllCarAll();
	}

	
	//管理员登录
	@Override
	public List<Admin> selectByNameAndPwd(String username, String passwor) {
		return carMapper.selectByNameAndPwd(username, passwor);
	}

	@Override
	public int deleteByid(String id) {
		return carMapper.deleteByid(id);
	}

	@Override
	public List<CarAll> selectCarAllByName(String type) {
		return carMapper.selectCarAllByName(type);
	}

	@Override
	public List<CarAll> selectByIdCarall(String id) {
		return carMapper.selectByIdCarall(id);
	}

	@Override
	public int updateByIDCarAll(CarAll carAll) {
		return carMapper.updateByIDCarAll(carAll);
	}

	@Override
	public Admin selectByNameAndPwd1(Admin admin) {
		return carMapper.selectByNameAndPwd1(admin);
	}

}
