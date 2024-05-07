package com.bjsxt.pojo;

import java.io.Serializable;

public class Menus implements Serializable {
    private Integer id;
    private Integer pid;
    private String name;
    private String url;
    private Integer open;

    public Menus() {
    }

    public Menus(Integer id, Integer pid, String name, String url, Integer open) {
        this.id = id;
        this.pid = pid;
        this.name = name;
        this.url = url;
        this.open = open;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getOpen() {
        return open;
    }

    public void setOpen(Integer open) {
        this.open = open;
    }

    @Override
    public String toString() {
        return "Menus{" +
                "id=" + id +
                ", pid=" + pid +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", open=" + open +
                '}';
    }
}
