package com.bjsxt.mapper;

import com.bjsxt.pojo.BusCars;

import java.util.List;

public interface BusCarsMapper {
    /*//查询所有车辆(int start,int size：起始页和每页展示数量)
    public List<BusCars> selectAll(int start,int size);
    //查询总条数
    public int getCount();*/

    //使用pageHelper结合mybatis分页查询
    public List<BusCars> selectAll();

    //添加汽车信息
    public int addCars(BusCars busCars);

    //修改信息
    public int update(BusCars busCars);

    //删除一条信息
    public int delete(String carnumber);

    //查询可以出租的车
    public List<BusCars> selectIsRenting();

    //改变被租车的状态
    public int updateCarNum(String carnumber);

    //查询车辆信息
    public   BusCars   selectOne(String carnumber);

    //修改车辆状态
    public int update2(String carnumber);
}
