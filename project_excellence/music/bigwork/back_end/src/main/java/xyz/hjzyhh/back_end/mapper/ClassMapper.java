package xyz.hjzyhh.back_end.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.pojo.ClassPO;
import xyz.hjzyhh.back_end.pojo.StuClassPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;

import java.util.List;

/**
 * 班级的一些操作
 */
@Mapper
public interface ClassMapper {
    int createClass(@Param("class") ClassPO Clazz);

    int modifyClassInfo(@Param("class") ClassPO obj);

    int modifyClassAvatar(@Param("avatar") String avatar, @Param("cid") int cid);

    int modifyCreator(@Param("cid") int cid, @Param("uid") long uid);

    int deleteClass(@Param("cid") int cid);

    ClassPO findOne(@Param("cid") int cid);

    ClassPO findOneByName(@Param("name") String name);

    List<ClassPO> getMyClass(@Param("uid") long uid);

    List<ClassPO> getAddedClass(@Param("uid") long uid);

    List<ClassPO> getByCreator(@Param("uid") long uid);

    //
    int add2Class(@Param("cid") int cid, @Param("uid") long uid);

    // 退出班级
    int remove2Class(@Param("cid") int cid, @Param("uid") long uid);

    int changeStuNum(@Param("cid") int cid, @Param("stuNum") int stuNum);

    // 更改角色
    int changeRole(@Param("cid") int cid, @Param("uid") long uid, @Param("role") int role);


    List<StuClassPO> getStuList(@Param("cid") int cid, @Param("limit") int limit, @Param("offset") long offset);

    StuClassPO getStu(@Param("uid") long uid, @Param("cid") int cid);

    Integer checkInClass(@Param("cid")int cid,@Param("uid")long uid);
}
