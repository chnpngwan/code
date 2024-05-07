package xyz.hjzyhh.back_end.service;

import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.pojo.AuthTeacherPO;

public interface TeacherService {
    int send2Check(MultipartFile[] imgs,String description,long uid);
    AuthTeacherPO getAuth(long uid);
    AuthTeacherPO getAuthById(long id);
    int modify(MultipartFile[] imgs, String description, long uid);
    int drop(long uid);
}
