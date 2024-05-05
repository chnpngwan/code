package cn.dao.impl;

import cn.dao.StaffDao;
import cn.pojo.Staff;

import java.util.List;

public class StaffDaoImpl extends BaseDao implements StaffDao {
    @Override
    public int addStaff(Staff staff) {
        String sql = "insert into staff (sid,sname,sex,phone,salary) values(?,?,?,?,?)";
        return update(sql,staff.getSid(),staff.getSname(),staff.getSex(),staff.getPhone(),staff.getSalary());
    }

    @Override
    public int deleteStaff(int sid) {
        String sql = "delete from staff where sid = ?";
        return update(sql,sid);
    }

    @Override
    public int updateStaff(Staff staff) {
        String sql = "update staff set sname=?,sex=?,phone=?,salary=? where sid = ?";
        return update(sql,staff.getSname(),staff.getSex(),staff.getPhone(),staff.getSalary(),staff.getSid());
    }

    @Override
    public Staff queryStaffById(int sid) {
        String sql = "select sid,sname,sex,phone,salary from staff where sid = ?";
        return queryForOne(Staff.class,sql,sid);
    }

    @Override
    public List<Staff> queryStaffs() {
        String sql = "select sid,sname,sex,phone,salary from staff";
        return queryForList(Staff.class,sql);
    }
}
