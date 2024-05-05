package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Student;
import utile.JDBCUtile;

/**
 * @author ChnpngWng
 *
 * @date   Mar 3, 20238:56:57 AM
 */
public class StudentDao {
	//查班级成员
			public static List<Student> getStudent(String keyword){
				String sql="select * from student";
				if(keyword != null) {
					sql +=" where name like '%"+ keyword+"%';";
				}
				Connection conn=JDBCUtile.getConnection();
				try {
					PreparedStatement statement=conn.prepareStatement(sql);
					ResultSet result=statement.executeQuery();
					List<Student> list=new ArrayList<Student>();
					while(result.next()) {
						String id=result.getString("id");
						String name=result.getString("name");
						String sex=result.getString("sex");
						String signature=result.getString("signature");
						String image=result.getString("image");
						Student s=new Student(id,name,sex,signature,image);
						list.add(s);
					}
					return list;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return null;
			}
}
