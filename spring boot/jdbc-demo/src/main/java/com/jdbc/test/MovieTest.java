package com.jdbc.test;

import com.jdbc.bean.Movie;
import com.jdbc.dao.MovieDao;
import com.jdbc.utitl.JDBCutili;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.jdbc.test
 * ClassName:    MovieTest
 *
 * @Author chnpngwng
 * @Date 2023 06 05 20 59
 **/


public class MovieTest {
    public static void main(String[] args) throws SQLException {
        //查询
        /*MovieDao dao=new MovieDao();
        List<Movie> list=dao.select(null);
        for (Movie movie:list) {
            System.out.println(movie);
        }*/

        //模糊查询
        MovieDao dao=new MovieDao();
        List<Movie> list=dao.select("lisi");
        for (Movie movie:list) {
            System.out.println(movie);
        }

        //插入
        Movie movie = new Movie();
        movie.setName("zhangsan");
        movie.setDuration(12);
        movie.setArea("lisi");
        movie.setMoviedate(Date.valueOf("2002-03-04"));
        movie.setPrice(13.0);
        int row = dao.addPersonal(movie);
        if (row>0){
            System.out.println("成功");
        }else {
            System.out.println("失败");
        }

        //删除
        int row1 = dao.deletePersonal(2);
        if (row1>0){
            System.out.println("成功");
        }else {
            System.out.println("失败");
        }
    }
}
