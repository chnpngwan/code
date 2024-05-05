package com.yzk.student.daoimp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yzk.student.dao.StudentDao;
import com.yzk.student.model.Student;

/**
 * Created by hejjon on 2019/5/25.
 */
public class StudentDaoImo implements StudentDao {

	private final String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost:3306/db_StudentSystem?serverTimezone=UTC";
	private final String userName = "root";
	private final String password = "123456";
	private ArrayList<Student> students;

	@Override
	public int insertStudent(Student student) {
		int n = 0;
		String sql = "insert into Student values (default,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			// 锟斤拷锟斤拷锟斤拷锟斤拷
			Class.forName(jdbcDriver);
			// 锟斤拷取锟斤拷锟斤拷
			conn = DriverManager.getConnection(url, userName, password);
			// 锟斤拷锟斤拷锟结话
			ps = conn.prepareStatement(sql);
			// 锟斤拷锟斤拷 ? 锟斤拷值
			ps.setString(1, student.getName());
			ps.setString(2, student.getGender());
			ps.setInt(3, student.getAge());
			ps.setString(4, student.getClasss());
			ps.setString(5, student.getMajor());
			// 执锟斤拷sql
			n = ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 锟截憋拷锟斤拷锟捷匡拷锟斤拷源
			try {
				if (null != ps) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (null != conn) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return n;
	}

	@Override
	public int deleteStudent(int id) {
		String sql = "delete from Student where id=?";
		int n = 0;
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			// 锟斤拷锟斤拷锟斤拷锟斤拷
			Class.forName(jdbcDriver);
			// 锟斤拷取锟斤拷锟斤拷
			conn = DriverManager.getConnection(url, userName, password);
			// 锟斤拷锟斤拷锟结话
			ps = conn.prepareStatement(sql);
			// 锟斤拷锟斤拷 ? 锟斤拷值
			ps.setInt(1, id);
			// 执锟斤拷sql
			n = ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != ps) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (null != conn) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return n;
	}

	@Override
	public int updateStudent(Student student) {
		String sql = "update Student set name=?, gender=?, age=?, classs=?, major=? where id=?";
		int n = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			// 锟斤拷锟斤拷锟斤拷锟斤拷
			Class.forName(jdbcDriver);
			// 锟斤拷取锟斤拷锟斤拷
			conn = DriverManager.getConnection(url, userName, password);
			// 锟斤拷锟斤拷锟结话
			ps = conn.prepareStatement(sql);
			ps.setString(1, student.getName());
			ps.setString(2, student.getGender());
			ps.setInt(3, student.getAge());
			ps.setString(4, student.getClasss());
			ps.setString(5, student.getMajor());
			ps.setInt(6, student.getId());
			n = ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != ps) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (null != conn) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return n;
	}

	@Override
	public List<Student> selectStudentByName(String name) {
		students = new ArrayList<>();
		for (Student student : selectAllStudent()) {
			if (student.getName().equals(name)) {
				students.add(student);
			}
		}
		return students;
	}

	@Override
	public List<Student> selectAllStudent() {
		String sql = "select * from Student";
		List<Student> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			// 锟斤拷锟斤拷锟斤拷锟斤拷
			Class.forName(jdbcDriver);
			// 锟斤拷取锟斤拷锟斤拷
			conn = DriverManager.getConnection(url, userName, password);
			// 锟斤拷锟斤拷锟结话
			ps = conn.prepareStatement(sql);
			// 锟斤拷取锟斤拷锟斤拷锟�
			rs = ps.executeQuery();
			// 锟斤拷锟斤拷锟斤拷锟斤拷锟�
			while (rs.next()) {
				Student student = new Student(rs.getInt("id"), rs.getString("name"), rs.getString("gender"),
						rs.getInt("age"), rs.getString("classs"), rs.getString("major"));
				list.add(student);
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != ps) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (null != conn) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public Student selectStudentById(int id) {
		for (Student student : selectAllStudent()) {
			if (student.getId() == id) {
				return student;
			}
		}
		return null;
	}

	@Override
	public void delclass(int id) {
		String sql = "update Student set  classs=? where id=?";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			// 锟斤拷锟斤拷锟斤拷锟斤拷
			Class.forName(jdbcDriver);
			// 锟斤拷取锟斤拷锟斤拷
			conn = DriverManager.getConnection(url, userName, password);
			// 锟斤拷锟斤拷锟结话
			ps = conn.prepareStatement(sql);
			ps.setString(1, "");
			ps.setInt(2, id);
			ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != ps) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (null != conn) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}