package com.jdbc.utitl;

import java.sql.*;

/**
 * ProjectName:  spring boot
 * PackageName:  com.jdbc.utitl
 * ClassName:    JDBCutili
 *
 * @Author chnpngwng
 * @Date 2023 06 05 20 05
 **/


public class JDBCutili {
    private static String url="jdbc:mysql:///db_task?characterEncoding=UTF-8";
    private static String userName="root";
    private static String password="123456";
    private static String driver="com.mysql.cj.jdbc.Driver";

    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static Connection getConn() throws SQLException {
        return DriverManager.getConnection(url,userName,password);
    }

    public static void close(Connection con, PreparedStatement smt, ResultSet rs){
        try{
            if (con!=null) {
                con.close();
            }
            if (smt!=null) {
                smt.close();
            }
            if (rs!=null) {
                rs.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) throws SQLException {
        System.out.println(getConn());
    }
}