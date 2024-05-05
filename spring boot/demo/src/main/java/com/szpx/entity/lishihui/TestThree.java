package com.szpx.entity.lishihui;

import lombok.Data;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Objects;

@Data
@Table(name = "test_three")
public class TestThree {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer id;
    private String x;
    private String y;
    private String z;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TestThree)) return false;
        TestThree testThree = (TestThree) o;
        return id.equals(testThree.id) &&
                x.equals(testThree.x) &&
                y.equals(testThree.y) &&
                z.equals(testThree.z);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, x, y, z);
    }

    @Override
    public String toString() {
        return "TestThree{" +
                "id=" + id +
                ", x='" + x + '\'' +
                ", y='" + y + '\'' +
                ", z='" + z + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public String getY() {
        return y;
    }

    public void setY(String y) {
        this.y = y;
    }

    public String getZ() {
        return z;
    }

    public void setZ(String z) {
        this.z = z;
    }
}
