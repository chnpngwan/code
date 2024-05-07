package xyz.hjzyhh.back_end.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;
import xyz.hjzyhh.back_end.pojo.SecurityQuestion;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.service.SecurityQuestionService;
import xyz.hjzyhh.back_end.utils.RandomUtil;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;

import javax.servlet.http.HttpSession;
import java.util.concurrent.TimeUnit;


@RestController
@RequestMapping("/security-questions")
public class SecurityQuestionController {
    private final SecurityQuestionService securityQuestionService;

    @Autowired
    RedisTemplate<String,String> redisTemplate;


    @Autowired
    public SecurityQuestionController(SecurityQuestionService securityQuestionService) {
        this.securityQuestionService = securityQuestionService;
    }

    @GetMapping("/{username}")
    public Result<SecurityQuestion> getSecurityQuestionByUsername(@PathVariable String username) {
        SecurityQuestion securityQuestion = securityQuestionService.getSecurityQuestionByUsername(username);
        if (securityQuestion == null) {
            return ResultUtil.failure(500,"");
        }
        return ResultUtil.success(securityQuestion);
    }


    @PostMapping("")
    public Result<String> createSecurityQuestion(@RequestBody SecurityQuestion securityQuestion, HttpSession session) {
        long userId = (long) session.getAttribute("uid");
        securityQuestion.setUserId(userId);
        boolean created = securityQuestionService.createSecurityQuestion(securityQuestion);
        if (created) {
            return ResultUtil.success("OK");
        }
        return ResultUtil.failure(500,"创建失败");
    }

    @GetMapping("")
    public Result<SecurityQuestion> getSecurityQuestionByUserid(HttpSession session){
        long uid = (long) session.getAttribute("uid");
        SecurityQuestion securityQuestionByUserid = securityQuestionService.getSecurityQuestionByUserid(uid);
        if(securityQuestionByUserid != null){
            return ResultUtil.success(securityQuestionByUserid);
        }
        return ResultUtil.failure(500, "没有");

    }


    @GetMapping("/checkUsername/{username}")
    public Result<UserPO> getUserPoByUsername(@PathVariable("username")String username){
        UserPO userPo = securityQuestionService.getUserpoByUsername(username);
        if(userPo == null){
            return ResultUtil.failure(500,"用户名不存在");
        }
        return ResultUtil.success(userPo);
    }

    @PostMapping("/checkAnswer")
    public Result<String> checkAnswer(@RequestBody SecurityQuestion securityQuestion) {
        // 根据实际逻辑进行安全问题答案校验
        boolean valid = securityQuestionService.checkAnswer(securityQuestion.getUsername(), securityQuestion.getAnswer());
        if (valid) {
            // token
            String token = RandomUtil.randomString(32);
            redisTemplate.opsForValue().set(token, securityQuestion.getUsername());
            redisTemplate.expire(token,3*60, TimeUnit.SECONDS);
            return ResultUtil.success(token);
        } else {
            return ResultUtil.failure(500,"校验失败");
        }
    }

    @PostMapping("/resetPassword")
    public Result<String> resetPassword(@RequestParam("token")String token,@RequestParam("password")String password) {
        String username = redisTemplate.opsForValue().get(token);
        if(username == null){
            return ResultUtil.failure(500,"修改失败");
        }
        redisTemplate.delete(token);
        // 根据实际逻辑进行安全问题答案校验
        boolean valid = securityQuestionService.resetPassword(username, password);
        if (valid) {
            return ResultUtil.success("修改成功");
        } else {
            return ResultUtil.failure(500,"校验失败");
        }
    }

}