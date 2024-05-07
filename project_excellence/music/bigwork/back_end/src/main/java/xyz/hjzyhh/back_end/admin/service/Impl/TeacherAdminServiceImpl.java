package xyz.hjzyhh.back_end.admin.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.hjzyhh.back_end.admin.mapper.TeacherAdminMapper;
import xyz.hjzyhh.back_end.admin.service.TeacherAdminService;
import xyz.hjzyhh.back_end.pojo.AuthTeacherPO;
import xyz.hjzyhh.back_end.utils.FileUtils;
import xyz.hjzyhh.back_end.utils.RedisUtil;

import java.util.Arrays;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class TeacherAdminServiceImpl implements TeacherAdminService {

    @Autowired
    TeacherAdminMapper teacherAdminMapper;


    private final int LIMIT = 5;

    private AuthTeacherPO getImages(AuthTeacherPO auth){
        List<String> collect = Arrays.stream(auth.getImgs().split("\n"))
                .map(FileUtils::addContextPath)
                .collect(Collectors.toList());
        auth.setImages(collect);
        return auth;
    }

    @Override
    public List<AuthTeacherPO> get(int aid) {
        List<AuthTeacherPO> checking = teacherAdminMapper.getChecking(aid);
        if (LIMIT - checking.size() != 0) {
            List<AuthTeacherPO> athorChecking = teacherAdminMapper.get(LIMIT - checking.size());
            athorChecking.stream().
                    forEach(authTeacherPO -> teacherAdminMapper.changeChecking(authTeacherPO.getId(),aid));
            checking.addAll(athorChecking);
        }
        checking.stream().forEach(authTeacherPO -> getImages(authTeacherPO));
        return checking;
    }

    @Transactional
    @Override
    public int pass(long id, int aid) {

        int i = teacherAdminMapper.pass(id);

        if (i == 1) {
            AuthTeacherPO auth = teacherAdminMapper.getById(id);
            int i1 = teacherAdminMapper.changeUserRole2Teacher(auth.getUid());
            if(i1 == 1){
                RedisUtil.delUser(String.valueOf(auth.getUid()));
            }
            return i1;
        }
        return i;
    }

    @Override
    public int unpass(long id, int aid) {
        return teacherAdminMapper.unpass(id);
    }

    @Override
    public int exit(int aid) {
        return teacherAdminMapper.changeUnchecking(aid);
    }
}
