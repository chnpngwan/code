package xyz.hjzyhh.back_end.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.hjzyhh.back_end.mapper.SecurityQuestionMapper;
import xyz.hjzyhh.back_end.mapper.UserMapper;
import xyz.hjzyhh.back_end.pojo.SecurityQuestion;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.utils.RandomUtil;

@Service
public class SecurityQuestionService {
    private final SecurityQuestionMapper securityQuestionMapper;

    @Autowired
    private UserService userService;

    @Autowired
    private UserMapper userMapper;


    @Autowired
    public SecurityQuestionService(SecurityQuestionMapper securityQuestionMapper) {
        this.securityQuestionMapper = securityQuestionMapper;
    }

    public SecurityQuestion getSecurityQuestionByUsername(String username) {
        return securityQuestionMapper.getSecurityQuestionByUsername(username);
    }

    public SecurityQuestion getSecurityQuestionByUserid(long userid) {
        return securityQuestionMapper.getSecurityQuestionByUserid(userid);
    }

    public boolean createSecurityQuestion(SecurityQuestion securityQuestion) {
        UserPO user = userService.findOne(securityQuestion.getUserId());
        securityQuestion.setUsername(user.getUsername());
        SecurityQuestion existingQuestion = securityQuestionMapper.getSecurityQuestionByUsername(securityQuestion.getUsername());
        if (existingQuestion != null) {
            return false; // 安全问题已存在，不创建新的安全问题
        }
        securityQuestionMapper.insertSecurityQuestion(securityQuestion);
        return true;
    }

    public UserPO getUserpoByUsername(String username){
        return userMapper.findByUsername(username);
    }

    public boolean checkAnswer(String username, String answer){
        SecurityQuestion securityQuestion = securityQuestionMapper.getSecurityQuestionByUsername(username);
        if(securityQuestion!=null){
            return securityQuestion.getAnswer().equals(answer);
        }
        return false;
    }

    public boolean resetPassword(String username, String password){
        UserPO user = userMapper.findByUsername(username);
        String salt = RandomUtil.randomString(6);

        return userMapper.modifyPassword(user.getId(),userService.getScurityPassword(password,salt),salt) == 1;
    }
}
