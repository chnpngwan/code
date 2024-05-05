package com.img.mapper;

import com.img.model.Upload;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.img.mapper
 * ClassName:     UploadMapper
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 11 19 53
 **/


public interface UploadMapper {
    //全表查询
    @Select("select * from tb_image")
    List<Upload> selectAll();
    //新增
    @Insert("insert into tb_image(id,name,imgPath) values (#{id},#{name},#{imgPath})")
    int insertUpload(Upload upload);
}
