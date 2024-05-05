package com.img.service;

import com.img.model.Upload;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.img.service
 * ClassName:     UploadService
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 11 19 53
 **/


public interface UploadService {
    //全表查询
    List<Upload> selectAll();
    //新增
    int insertUpload(Upload upload);
}
