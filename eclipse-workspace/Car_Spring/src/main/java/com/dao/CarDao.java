package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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


public interface CarDao {
	//清表查询
    List<Car> selectAllCar();
    
    //模糊车型
    List<Car> selectByName(@Param("name")String name);   
    
    List<Car1> selectAllCar1();
   
    List<Car3> selectAllCar3();
    
    List<Car4> selectAllCar4();
    
    List<Car5> selectAllCar5();
    
    //客户案例
    List<Client> selectSllClient();
    
    //司机案例
    List<Driver> selectSAllDriver();  
    
    // 用户预约
    int insertINtoCont(Cont cont);
    
    //管理员客户案例
    List<Client> selectAllAdminClient();
    
    //管理员查询司机案例
    List<Driver> selectAllDriverAdmin();
    
    //管理员在线预约查询
    List<Cont> selectAllCont();
    
    //管理员查询所有车辆类型
    List<CarAll> selectSAllCarAll();
    
    //管理员登录
    List<Admin> selectByNameAndPwd(@Param("username") String username,@Param("password") String passwor);
     
    //管理员登录
    Admin selectByNameAndPwd1(Admin admin);
    
    //管理员删除车辆
    int deleteByid(String id);
    
    //管理员模糊车型
    List<CarAll> selectCarAllByName(@Param("type") String type); 
    
    //管理员根据id获取内容
    List<CarAll> selectByIdCarall(String id);
    
    //管理员修改
    int updateByIDCarAll(CarAll carAll);
}
