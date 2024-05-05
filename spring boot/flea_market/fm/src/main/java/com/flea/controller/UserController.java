package com.flea.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flea.common.Result;
import com.flea.dto.UserDto;
import com.flea.entity.User;
import com.flea.service.UserService;
import com.flea.util.JwtUtil;
import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;


/**
 * 用户表 前端控制器
 */
@Slf4j
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户登录
     * @param user
     * @return
     */
    @PostMapping("/login")
    public Result<UserDto> login(@RequestBody User user) {

        //MD5加密
        String password = user.getPassword();
        password = DigestUtils.md5DigestAsHex(password.getBytes());
//        log.info(password);

        //根据用户名查询数据库
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(User::getUsername, user.getUsername());
        User u = userService.getOne(queryWrapper);

        if (u == null){
            return Result.error("用户名错误！");
        }

        if (!u.getPassword().equals(password)){
//            log.info(u.getPassword());
            return Result.error("密码错误！");
        }

        if (u.getStatus() == 0) {
            return Result.error("账号已禁用！");
        }

        //设置token并存到dto中
        String token = JwtUtil.getToken(u);
        UserDto userDto = new UserDto();
        userDto.setUser(u);
        userDto.setToken(token);

        Integer code = 0;
        if (u.getRole().equals(0)){
            code = 201;
        }else if (u.getRole().equals(1)){
            code = 202;
        }

        return Result.success(userDto, code);
    }

    /**
     * 退出登录
     * @return
     */
    @PostMapping("/logout")
    public Result<String> logout() {
        return Result.success("退出登录成功！");
    }

    /**
     * 用户注册
     * @param user
     * @return
     */
    @PostMapping("/register")
    public Result<String> register(@RequestBody User user) {
        log.info("用户注册，注册信息：{}", user);

        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        if (user.getNickname() == null){
            user.setNickname(user.getUsername());
        }
        userService.save(user);

        return Result.success("用户注册成功！");
    }

    /**
     * 新增用户
     * @param user
     * @return
     */
    @PostMapping
    public Result<String> save(@RequestBody User user) {
        log.info("新增用户，用户信息：{}", user.toString());

        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(User::getUsername, user.getUsername());
        if (userService.count(queryWrapper) != 0)
            return Result.error("用户名已存在！", 2);

        //设置初始密码123456进行MD5加密处理
        user.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes()));

        userService.save(user);
        return  Result.success("新增用户成功！");
    }

    /**
     * 根据id修改用户信息
     * @param user
     * @return
     */
    @PutMapping
    public Result<String> update(@RequestBody User user) {
        log.info("修改的用户信息：{}", user.toString());

        if (user.getPassword() == null)
            return Result.error("用户密码不能为空!");
        userService.updateById(user);

        return Result.success("修改用户信息成功！");
    }

    /**
     * 根据id修改密码
     * @param id
     * @param password
     * @return
     */
    @PutMapping("/updatePassword")
    public Result<String> updatePassword(@RequestParam Long id, @RequestParam String password) {
        log.info("修改用户{}的密码：{}", id, password);

        User user = new User();
        user.setId(id);
        user.setPassword(DigestUtils.md5DigestAsHex(password.getBytes()));
        userService.updateById(user);

        return Result.success("修改密码成功，请重新登录！");
    }

    /**
     * 分页模糊查询
     * @param page
     * @param pageSize
     * @param name
     * @return
     */
    @GetMapping("/page")
    public Result<Page> page(int page, int pageSize, String name){
        log.info("page = {}, pageSize = {}, name = {}", page, pageSize, name);

//        Long id = Thread.currentThread().getId();
//        log.info("线程id为：{}",id);

        Page pageInfo = new Page<>(page,pageSize);
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotEmpty(name), User::getUsername, name);

        userService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }

    /**
     * 根据id查询用户信息
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Result<User> getUserById(@PathVariable Long id){
        User user = userService.getById(id);
        if (user != null) {
            return Result.success(user);
        }
        return Result.error("未查询到用户信息！");
    }


}

