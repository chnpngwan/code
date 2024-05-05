package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Honour;
import utile.JDBCUtile;

/**
 * @author ChnpngWng
 *
 * @date   Mar 3, 20238:56:18 AM
 */
public class HonourDao {
	//查获得荣誉
			public static List<Honour> getHonour(String keyword){
				String sql="select * from experience";
				if(keyword != null) {
					sql +=" where title like '%"+ keyword+"%';";
				}
				Connection conn=JDBCUtile.getConnection();
				try {
					PreparedStatement statement=conn.prepareStatement(sql);
					ResultSet result=statement.executeQuery();
					List<Honour> list=new ArrayList<Honour>();
					while(result.next()) {
						int id=result.getInt("id");
						String title=result.getString("title");
						String personnel=result.getString("personnel");
						String time=result.getString("time");
						String image=result.getString("image");
						Honour h=new Honour(id,title,personnel,time,image);
						list.add(h);
					}
					return list;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return null;
			}
}
