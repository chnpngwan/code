package xyz.hjzyhh.back_end.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.mapper.ClassMapper;
import xyz.hjzyhh.back_end.mapper.UserMapper;
import xyz.hjzyhh.back_end.pojo.ClassPO;
import xyz.hjzyhh.back_end.pojo.StuClassPO;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.service.ClassService;
import xyz.hjzyhh.back_end.service.UserService;
import xyz.hjzyhh.back_end.utils.FileUtils;
import xyz.hjzyhh.back_end.utils.RedisUtil;
import xyz.hjzyhh.back_end.utils.VOUtil;
import xyz.hjzyhh.back_end.vo.ClassVO;
import xyz.hjzyhh.back_end.vo.UserInClassVO;
import xyz.hjzyhh.back_end.vo.UserVO;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ClassServiceImpl implements ClassService {
    @Autowired
    ClassMapper classMapper;

    @Autowired
    UserService userService;

    @Autowired
    UserMapper userMapper;

    private final int LIMIT = 100;

    private void authError() {
        throw new RuntimeException("没有权限操作班级信息");
    }

    @Override
    public boolean createClass(MultipartFile avatar, String name, String description, long creator) {
        String avatarUrl = FileUtils.saveAvatar(avatar);
        int class_id = (int) RedisUtil.getId("class_id");
        ClassPO classPO = new ClassPO();
        classPO.setAvatar(avatarUrl);
        classPO.setId(class_id);
        classPO.setName(name);
        classPO.setDescription(description);
        classPO.setCreator(creator);
        UserPO one = userService.findOne(creator);
        userMapper.updateCollections(creator,one.getCollections()+1);
        return classMapper.createClass(classPO) == 1;
    }

    @Override
    public boolean modifyClassInfo(int cid, String name, String desciption, long uid) {
        ClassPO classPO = classMapper.findOne(cid);
        if (classPO.getCreator() == uid) {
            classPO = new ClassPO();
            classPO.setDescription(desciption);
            classPO.setId(cid);
            classPO.setName(name);
            return classMapper.modifyClassInfo(classPO) == 1;
        } else {
            authError();
            return false;
        }
    }

    @Override
    public boolean modifyClassAvatar(int cid, MultipartFile avatar, long uid) {
        ClassPO classPO = classMapper.findOne(cid);
        if (classPO.getCreator() == uid) {
            String avatarurl = FileUtils.saveAvatar(avatar);
            return classMapper.modifyClassAvatar(avatarurl, cid) == 1;
        }
        authError();
        return false;
    }

    @Override
    public boolean modifyClassCreator(int cid, long atheruid, long uid) {
        ClassPO classPO = classMapper.findOne(cid);
        if (classPO.getCreator() == uid) {
            return classMapper.modifyCreator(cid, uid) == 1;
        }
        authError();
        return false;
    }

    private ClassPO findOP(int cid) {
        return classMapper.findOne(cid);
    }

    private void updateCache(ClassPO clazz) {
        return;
    }

    @Override
    public ClassVO findOne(int cid) {
        ClassPO classPO = findOP(cid);
        if(classPO != null) {
            ClassVO classVO = VOUtil.swap(classPO, ClassVO.class);
            UserVO user = VOUtil.swap(userService.findOne(classPO.getCreator()), UserVO.class);
            classVO.setCreator(user);
            List<StuClassPO> stuList = classMapper.getStuList(cid, 10, 0);
            classVO.setStu(getUsersInClass(stuList));
            return classVO;
        }
        return null;

    }

    @Override
    public ClassVO findOne(String name) {
        ClassPO classPO = classMapper.findOneByName(name);
        ClassVO classVO = VOUtil.swap(classPO, ClassVO.class);
        UserVO user = VOUtil.swap(userService.findOne(classPO.getCreator()), UserVO.class);
        classVO.setCreator(user);
        return classVO;
    }

    @Override
    public List<ClassPO> findMyClass(long uid) {
        List<ClassPO> myClass = classMapper.getMyClass(uid);
        myClass.addAll(classMapper.getAddedClass(uid));
        myClass = myClass.stream().distinct().collect(Collectors.toList());
        return myClass.stream().filter(clazz ->{
            if (findOP(clazz.getId())!=null) {
                return true;
            }
            return false;
        }).collect(Collectors.toList());
    }

    @Override
    public List<ClassPO> getByCreator(long uid) {
        return classMapper.getByCreator(uid);
    }

    @Override
    public List<ClassPO> findMyJoinClass(long uid) {
        return classMapper.getMyClass(uid);
    }

    @Override
    public boolean deleteClass(long uid, int cid) {
        ClassPO classPO = classMapper.findOne(cid);
        if (classPO.getCreator() == uid) {
            if (classMapper.deleteClass(cid) == 1) {
                UserPO user = userService.findOne(classPO.getCreator());
                userMapper.updateCollections(user.getId(),user.getCollections() -1);
            }
        }
        authError();
        return false;
    }

    @Transactional
    @Override
    public boolean add2Class(int cid, long uid) {
        StuClassPO stu = classMapper.getStu(uid, cid);
        if(stu != null) throw new RuntimeException("不能重复加入班级");
        ClassPO clazz = findOP(cid);
        if(clazz == null) throw new RuntimeException("班级ID不对");
        int i = classMapper.add2Class(cid, uid);
        if (i == 1) {
            int stuNum = clazz.getStudentNum() + 1;
            int i1 = classMapper.changeStuNum(cid, stuNum);
            if (i1 == 1) {
                clazz.setStudentNum(stuNum);
                updateCache(clazz);
                return true;
            }
        }
        return false;
    }

    @Transactional
    @Override
    public boolean removeFromClass(int cid, long uid, long option_uid) {
        ClassPO clazz = findOP(cid);
        if (clazz.getCreator() == option_uid || option_uid == uid) {
            int i = classMapper.remove2Class(cid, uid);
            if (i == 1) {
                int stuNum = clazz.getStudentNum() - 1;
                int i1 = classMapper.changeStuNum(cid, stuNum);
                if (i1 == 1) {
                    clazz.setStudentNum(stuNum);
                    updateCache(clazz);
                    return true;
                }
            }
        } else {
            throw new RuntimeException("没有权限");
        }
        return false;
    }

    @Override
    public boolean changeRole(int cid, long uid, int role, long option_uid) {
        ClassPO clazz = findOP(cid);
        if (clazz.getCreator() == option_uid) {
            int i = classMapper.changeRole(cid, uid, role);
            if(i == 1){
                return true;
            }
        }
        return false;
    }

    private List<UserInClassVO> getUsersInClass(List<StuClassPO> stuList){
        return stuList.stream().map(stu -> {
            UserPO user = userService.findOne(stu.getUid());
            UserInClassVO userInClass = VOUtil.swap(user, UserInClassVO.class);
            userInClass.setRole(stu.getRole());
            return userInClass;
        }).collect(Collectors.toList());
    }

    @Override
    public List<UserInClassVO> getStuList(int cid, int page) {
        long offset = LIMIT * (page - 1);
        List<StuClassPO> stuList = classMapper.getStuList(cid, LIMIT, offset);
        List<UserInClassVO> students = getUsersInClass(stuList);
        return students;
    }
}
