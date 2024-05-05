package cn.service.impl;

import cn.dao.StaffDao;
import cn.dao.impl.StaffDaoImpl;
import cn.pojo.Staff;
import cn.service.StaffService;

import java.util.List;

public class StaffServiceImpl implements StaffService {

    private StaffDao staffDao = new StaffDaoImpl();

    @Override
    public void addStaff(Staff staff) {
        staffDao.addStaff(staff);
    }

    @Override
    public void deleteStaffById(int sid) {
        staffDao.deleteStaff(sid);
    }

    @Override
    public void updateStaff(Staff staff) {
        staffDao.updateStaff(staff);
    }

    @Override
    public Staff queryStaffById(int sid) {
        return staffDao.queryStaffById(sid);
    }

    @Override
    public List<Staff> queryStaffs() {
        return staffDao.queryStaffs();
    }
}
