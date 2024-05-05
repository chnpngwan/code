package com.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.book.model.Book;
import com.book.utils.DBUtils;

public class BookDao {
	Connection conn=null;
	PreparedStatement smt=null;
	ResultSet rs=null;
	
	//����IDɾ���鼮��Ϣ
	public boolean delById(int id) {
		conn = DBUtils.getConn();
		String sql = "delete from book where id=?";
		try {
			smt = conn.prepareStatement(sql);
			smt.setInt(1, id);
			int result = smt.executeUpdate();
			if(result>0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.closeConn(conn, smt, rs);
		}
		return false;		
	}
	
	
	//ȫ���ѯ
	public List<Book> queryAllBook(){
		conn = DBUtils.getConn();
		String sql = "select * from book";
		try {
			smt = conn.prepareStatement(sql);
			rs = smt.executeQuery();
			if(rs!=null) {
				List<Book> bList = new ArrayList<Book>();
				while(rs.next()) {
					Book book = new Book();
					book.setId(rs.getInt("id"));
					book.setName(rs.getString("name"));
					book.setPress(rs.getString("press"));
					book.setAuthor(rs.getString("author"));
					book.setPrice(rs.getDouble("price"));
					bList.add(book);
				}
				return bList;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.closeConn(conn, smt, rs);
		}
		return null;
	}

}
