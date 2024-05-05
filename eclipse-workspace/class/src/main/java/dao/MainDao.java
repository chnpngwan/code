package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Main;
import utile.JDBCUtile;

/**
 * @author ChnpngWng
 *
 * @date   Mar 3, 20238:50:08 AM
 */
public class MainDao {
	//查主页
			public static List<Main> getMain(){
				String sql="select * from main;";
				Connection conn=JDBCUtile.getConnection();
				try {
					PreparedStatement statement=conn.prepareStatement(sql);
					ResultSet result=statement.executeQuery();
					List<Main> list=new ArrayList<Main>();
					while(result.next()) {
						String title=result.getString("title");
						String image=result.getString("image");
						Main m=new Main(title,image);
						list.add(m);
					}
					return list;
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return null;
			}
}
