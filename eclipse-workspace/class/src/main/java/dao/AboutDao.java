package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.About;
import utile.JDBCUtile;

/**
 * @author ChnpngWng
 *
 * @date   Mar 3, 20238:51:35 AM
 */
public class AboutDao {
	//查简介
		public static List<About> getAbout(){
			String sql="select * from about";
			Connection conn=JDBCUtile.getConnection();
			try {
				PreparedStatement statement=conn.prepareStatement(sql);
				ResultSet result=statement.executeQuery();
				List<About> list=new ArrayList<About>();
				while(result.next()) {
					String title=result.getString("title");
					String content=result.getString("content");
					String image=result.getString("image");
					
					About a=new About(title,content,image);
					list.add(a);
				}
				return list;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
}
