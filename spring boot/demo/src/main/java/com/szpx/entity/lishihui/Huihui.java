package com.szpx.entity.lishihui;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@Table(name = "hui_hui")
public class Huihui {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer id;
    private String name;
    private String hi;

    @Override
    public String toString() {
        return "Huihui{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", hi='" + hi + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHi() {
        return hi;
    }

    public void setHi(String hi) {
        this.hi = hi;
    }
}
