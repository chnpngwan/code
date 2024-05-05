package cn.dao;

import cn.pojo.Customer;
import cn.pojo.Staff;

import java.util.List;

public interface StaffDao {
    public int addStaff(Staff staff);

    public int deleteStaff(int sid);

    public int updateStaff(Staff staff);

    public Staff queryStaffById(int sid);

    public List<Staff> queryStaffs();
}
