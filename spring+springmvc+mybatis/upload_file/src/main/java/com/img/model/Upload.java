package com.img.model;

/**
 * ProjectName:   ssm
 * PackageName:   com.img.model
 * ClassName:     Upload
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 11 19 52
 **/


public class Upload {
    private String id;
    private String name;
    private String imgPath;

    public Upload() {
        super();
    }

    @Override
    public String toString() {
        return "Upload{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", imgPath='" + imgPath + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
}
