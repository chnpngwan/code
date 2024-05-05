package cn.service;

import cn.pojo.Customer;
import cn.pojo.Staff;

import java.util.List;

public interface StaffService {
    public void addStaff(Staff staff);

    public void deleteStaffById(int sid);

    public void updateStaff(Staff staff);

    public Staff queryStaffById(int sid);

    public List<Staff> queryStaffs();
}
