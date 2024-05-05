package com.jdbc.dao;

import com.jdbc.bean.Movie;
import com.jdbc.utitl.JDBCutili;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.jdbc.dao
 * ClassName:    MovieDao
 *
 * @Author chnpngwng
 * @Date 2023 06 05 20 01
 **/


public class MovieDao {
    Connection connection=null;
    PreparedStatement preparedStatement=null;
    ResultSet resultSet=null;

    //全表查询
/*	public List<Personal> seletteAll() throws SQLException{
 *      //1、建立连接
		connection=BaseDao.getConnect();
		//2、书写sql语句
		String sql="select * from tb_employee";
		//3、创建命令管理器
		preparedStatement=connection.prepareStatement(sql);
		//4、执行sql语句
		resultSet=preparedStatement.executeQuery();
		//5、处理结果集
		List<Personal> list=new ArrayList<Personal>();
		if (resultSet!=null) {
			while (resultSet.next()) {
				Personal personal=new Personal();
				personal.setEmpId(resultSet.getInt("EmpId"));
				personal.setEmpName(resultSet.getString("EmpName"));
				personal.setEmpSex(resultSet.getString("empSex"));
				personal.setEmpPhone(resultSet.getString("empPhone"));
				personal.setEmpAddress(resultSet.getString("empAddress"));
				//将personal对象存储到list里面
				list.add(personal);
			}
			return list;
		}else {
		//6、关闭连接
			BaseDao.close(connection, preparedStatement, resultSet);
		}
		return null;
	}*/

    //查询
    public List<Movie> select(String name) throws SQLException{
        //1、建立连接
        connection=JDBCutili.getConn();
        //2、书写sql语句
        String sql=null;
        if (name!=null) {
            sql = "select * from tb_movie where empName like '%"+name+"%'";
        }else {
            sql = "select * from tb_movie";
        }
//		System.out.println(sql);
        //3、创建命令管理器
        preparedStatement=connection.prepareStatement(sql);
        //4、执行sql语句
        resultSet=preparedStatement.executeQuery();
        //5、处理结果集
        List<Movie> list=new ArrayList<Movie>();
        while (resultSet.next()) {
            Movie movie=new Movie();
            movie.setName(resultSet.getString("name"));
            movie.setDuration(resultSet.getInt("duration"));
            movie.setArea(resultSet.getString("area"));
            movie.setMoviedate(new Date(movie.getMoviedate().getTime()));
            movie.setPrice(resultSet.getDouble("price"));
            //将personal对象存储到list里面
            list.add(movie);
        }
        //6、关闭连接
        JDBCutili.close(connection, preparedStatement, resultSet);
        return list;
    }

    //删除
    public int deletePersonal(int id) throws SQLException{
        //1、建立连接
        connection=JDBCutili.getConn();
        //2、书写sql语句
        String sql="delete from tb_movie where id=?";
        try{
            //3、创建命令管理器
            preparedStatement=connection.prepareStatement(sql);
            //4、给占位符赋值
            preparedStatement.setInt(1, id);
            //5、执行sql语句
            return preparedStatement.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }finally{
            //6、关闭连接
            JDBCutili.close(connection, preparedStatement, resultSet);
        }
        return 0;
    }

    //添加
    public int addPersonal(Movie movie) throws SQLException{
        //1、建立连接
        connection=JDBCutili.getConn();
        //2、书写sql语句
        String sql="insert into tb_movie values(0,?,?,?,?,?)";
        try{
            //3、创建命令管理器
            preparedStatement=connection.prepareStatement(sql);
            //4、给占位符赋值
            preparedStatement.setString(1, movie.getName());
            preparedStatement.setInt(2, movie.getDuration());
            preparedStatement.setString(3, movie.getArea());
            preparedStatement.setDate(4, movie.getMoviedate());
            preparedStatement.setDouble(5,movie.getPrice());
            //5、执行sql语句
            return preparedStatement.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            //6、关闭连接
            JDBCutili.close(connection, preparedStatement, resultSet);
        }
        return 0;
    }

    // 模糊查询
//	public List<Persomal> selete(String name) throws SQLException{
//		connection=BaseDao.getConnect();
//		StringBuilder sb_sql = new StringBuilder("select empId, empName, empSex, empPhone, empAddress from tb_employee");
//		if (name!=null&&!name.trim().isEmpty()) {
//			sb_sql.append(" where empName like '%"+name+"%'");
//		}
//		String sql = sb_sql.toString();
//		System.out.println(sql);
//		preparedStatement=connection.prepareStatement(sql);
//		resultSet=preparedStatement.executeQuery();
//		List<Persomal> list=new ArrayList<Persomal>();
//		if (resultSet!=null) {
//			System.out.println(resultSet.next());
//			while (resultSet.next()) {
//				Persomal personal=new Persomal();
//				personal.setEmpId(resultSet.getInt("empId"));
//				personal.setEmpName(resultSet.getString("empName"));
//				personal.setEmpSex(resultSet.getString("empSex"));
//				personal.setEmpPhone(resultSet.getString("empPhone"));
//				personal.setEmpAddress(resultSet.getString("empAddress"));
//				//将personal对象存储到list里面
//				list.add(personal);
//			}
//	}else {
//		BaseDao.close(connection, preparedStatement, resultSet);
//	}
//		return list;
//	}
}
