package xyz.hjzyhh.back_end.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.mapper.TeacherMapper;
import xyz.hjzyhh.back_end.pojo.AuthTeacherPO;
import xyz.hjzyhh.back_end.service.TeacherService;
import xyz.hjzyhh.back_end.utils.FileUtils;

import java.util.Arrays;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    TeacherMapper teacherMapper;

    private String saveImgs(MultipartFile[] imgs){
        StringBuilder imgsUrl = new StringBuilder();
        for(MultipartFile img : imgs) {
            imgsUrl.append(FileUtils.saveAuthImg(img));
            imgsUrl.append("\n");
        }
        return imgsUrl.toString();
    }

    private AuthTeacherPO getImages(AuthTeacherPO auth){
        auth.setImages(Arrays.asList(auth.getImgs().split("\n")));
        return auth;
    }

    @Override
    public int send2Check(MultipartFile[] imgs, String description, long uid) {
        AuthTeacherPO auth = teacherMapper.getByUid(uid);
        if(auth != null){
            throw new RuntimeException("该用户已经提交过申请");
        }

        auth = new AuthTeacherPO();
        auth.setImgs(saveImgs(imgs));
        auth.setDescription(description);
        auth.setUid(uid);
        int i = teacherMapper.send2Check(auth);
        return i;
    }

    @Override
    public AuthTeacherPO getAuth(long uid) {
        AuthTeacherPO auth = teacherMapper.getByUid(uid);
        if(auth == null)return null;
        return getImages(auth);
    }

    @Override
    public AuthTeacherPO getAuthById(long id) {
        return getImages(teacherMapper.getById(id));
    }

    @Override
    public int modify(MultipartFile[] imgs, String description, long uid) {
        AuthTeacherPO auth = teacherMapper.getByUid(uid);
        if(auth == null){
            throw new RuntimeException("用户还未提交申请");
        }
        auth.setImgs(saveImgs(imgs));
        auth.setDescription(description);
        auth.setUid(uid);
        teacherMapper.modifyAuth(auth);
        return 0;
    }

    @Transactional
    @Override
    public int drop(long uid) {
        int i = teacherMapper.dropTeacherRole(uid);
        return teacherMapper.dropAuth(uid);
    }
}
