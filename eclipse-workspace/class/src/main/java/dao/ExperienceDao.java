package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Experience;
import utile.JDBCUtile;

/**
 * @author ChnpngWng
 *
 * @date   Mar 3, 20238:55:30 AM
 */
public class ExperienceDao {
	//查特色经历
		public static List<Experience> getExperience(String keyword){
			String sql="select * from experience";
			if(keyword != null) {
				sql +=" where title like '%"+ keyword+"%';";
			}
			Connection conn=JDBCUtile.getConnection();
			try {
				PreparedStatement statement=conn.prepareStatement(sql);
				ResultSet result=statement.executeQuery();
				List<Experience> list=new ArrayList<Experience>();
				while(result.next()) {
					int id=result.getInt("id");
					String title=result.getString("title");
					String content=result.getString("content");
					String image1=result.getString("image1");
					String image2=result.getString("image2");
					String image3=result.getString("image3");
					Experience e=new Experience(id,title,content,image1,image2,image3);
					list.add(e);
				}
				return list;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
}
