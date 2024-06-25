package com.example.cinema.utils;

import cn.hutool.core.util.StrUtil;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import io.minio.RemoveObjectArgs;
import io.minio.errors.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

@Component
public class MinioUtil {
    @Resource
    private MinioClient minioClient;
    @Value("${minio.endpoint}")
    private String endpoint;
    @Value("${minio.bucketName}")
    private String bucketName;

    public String upload(MultipartFile file) {
        if (file == null || file.getSize() == 0) {
            return null;
        }
        String originalFilename = file.getOriginalFilename();
        if (StrUtil.isEmpty(originalFilename)) {
            throw new RuntimeException("由于缺乏文件名，文件上传失败");
        }
        String uuid = UUID.randomUUID().toString();
        String filename = uuid + originalFilename.substring(originalFilename.lastIndexOf("."));
        try {
            InputStream inputStream = file.getInputStream();
            minioClient.putObject(PutObjectArgs.builder()
                    .bucket(bucketName)
                    .object(filename)
                    .stream(inputStream, inputStream.available(), -1)
                    .contentType(file.getContentType())
                    .build());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return endpoint + "/" + bucketName + "/" + filename;
    }

    public boolean deleteFile(String filename) {
        if (StrUtil.isEmpty(filename)) {
            throw new RuntimeException("由于缺乏文件名，文件删除失败");
        }
        try {
            minioClient.removeObject(RemoveObjectArgs.builder()
                    .bucket(bucketName)
                    .object(filename)
                    .build());
        } catch (Exception e) {
            throw new RuntimeException("文件删除失败");
        }
        return true;
    }
}
