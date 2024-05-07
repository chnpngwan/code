package xyz.hjzyhh.back_end.service;

import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.pojo.ClassPO;
import xyz.hjzyhh.back_end.vo.ClassVO;
import xyz.hjzyhh.back_end.vo.UserInClassVO;

import java.util.List;

/**
 * 班级管理的服务层
 */
public interface ClassService {
    boolean createClass(MultipartFile avatar, String name,
                        String description, long creator);
    boolean modifyClassInfo(int cid,String name,String desciption,long uid);
    boolean modifyClassAvatar(int cid,MultipartFile avatar,long uid);
    boolean modifyClassCreator(int cid,long atheruid,long uid);
    ClassVO findOne(int cid);
    ClassVO findOne(String name);
    List<ClassPO> findMyClass(long uid);
    List<ClassPO> getByCreator(long uid);

    public List<ClassPO> findMyJoinClass(long uid);
    boolean deleteClass(long uid,int cid);

    boolean add2Class(int cid,long uid);
    boolean removeFromClass(int cid,long uid,long option_uid);
    boolean changeRole(int cid,long uid,int role,long option_uid);
    List<UserInClassVO> getStuList(int cid,int page);
}
