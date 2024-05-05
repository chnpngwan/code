package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.CarDao;
import com.model.Admin;
import com.model.Car;
import com.model.Car1;
import com.model.Car3;
import com.model.Car4;
import com.model.Car5;
import com.model.CarAll;
import com.model.Client;
import com.model.Cont;
import com.model.Driver;

@Service
public class CarServiceImpl implements CarService {

	@Resource
	public  CarDao carDao;
	
	@Override
	public List<Car> selectAllCar() {
		return carDao.selectAllCar();
	}

	@Override
	public List<Car> selectByName(String name) {
		return null;
	}

	@Override
	public List<Car1> selectAllCar1() {
		return carDao.selectAllCar1();
	}

	@Override
	public List<Car3> selectAllCar3() {
		return carDao.selectAllCar3();
	}

	@Override
	public List<Car4> selectAllCar4() {
		return carDao.selectAllCar4();
	}

	@Override
	public List<Car5> selectAllCar5() {
		return carDao.selectAllCar5();
	}

	@Override
	public List<Client> selectSllClient() {
		return carDao.selectSllClient();
	}

	@Override
	public List<Client> selectAllAdminClient() {
		return carDao.selectAllAdminClient();
	}

	@Override
	public List<Driver> selectSAllDriver() {
		return carDao.selectSAllDriver();
	}

	@Override
	public List<Driver> selectAllDriverAdmin() {
		return carDao.selectAllDriverAdmin();
	}

	@Override
	public int insertINtoCont(Cont cont) {
		return carDao.insertINtoCont(cont);
	}

	@Override
	public List<Cont> selectAllCont() {
		return carDao.selectAllCont();
	}

	@Override
	public List<CarAll> selectSAllCarAll() {
		return carDao.selectSAllCarAll();
	}

	
	//管理员登录
	@Override
	public List<Admin> selectByNameAndPwd(String username, String passwor) {
		return carDao.selectByNameAndPwd(username, passwor);
	}

	@Override
	public int deleteByid(String id) {
		return carDao.deleteByid(id);
	}

	@Override
	public List<CarAll> selectCarAllByName(String type) {
		return carDao.selectCarAllByName(type);
	}

	@Override
	public List<CarAll> selectByIdCarall(String id) {
		return carDao.selectByIdCarall(id);
	}

	@Override
	public int updateByIDCarAll(CarAll carAll) {
		return carDao.updateByIDCarAll(carAll);
	}

	@Override
	public Admin selectByNameAndPwd1(Admin admin) {
		return carDao.selectByNameAndPwd1(admin);
	}

}
