package com.img.service.impl;

import com.img.mapper.UploadMapper;
import com.img.model.Upload;
import com.img.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.img.service.impl
 * ClassName:     UploadServiceImpl
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 11 19 53
 **/

@Service
public class UploadServiceImpl implements UploadService{
    @Autowired
    private UploadMapper uploadMapper;

    @Override
    public List<Upload> selectAll() {
        return uploadMapper.selectAll();
    }

    @Override
    public int insertUpload(Upload upload) {
        return uploadMapper.insertUpload(upload);
    }
}
