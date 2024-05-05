package com.tour.mapper;

import com.tour.model.Tour;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProjectName:  ssm
 * PackageName:  com.tour.mapper
 * ClassName:    TourMapper
 *
 * @Author chnpngwng
 * @Date 2023 06 19 15 46
 **/


public interface TourMapper {

    List<Tour> queryThings(@Param("name") String name,@Param("sex")  String sex,@Param("type")  int type);

    //删除
    @Delete("delete from  tb_tourinfo where id=#{id}")
    public int deleteById(int id);

    //添加
    @Insert("insert into tb_tourinfo(name,sex,id_no,age,type,visit_date) values(#{name},#{sex},#{id_no},#{age},#{type},#{visitDate})")
    public int insertTour(Tour tour);
}
