package com.example.cinema.service.impl;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.constant.RedisPreFixConstant;
import com.example.cinema.dto.*;
import com.example.cinema.entity.Role;
import com.example.cinema.entity.User;
import com.example.cinema.entity.UserRole;
import com.example.cinema.mapper.RoleMapper;
import com.example.cinema.mapper.UserMapper;
import com.example.cinema.mapper.UserRoleMapper;
import com.example.cinema.service.RedisService;
import com.example.cinema.service.UserService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private SessionRegistry sessionRegistry;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private RedisService redisService;

    @Override
    public PageResult<UserBackVO> getUserList(String keywords) {
        Page<User> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<User> userPage = baseMapper.selectPage(page, new LambdaQueryWrapper<User>()
                .like(!StrUtil.isEmpty(keywords), User::getNickname, keywords));
        List<UserBackVO> userBackVOList = BeanCopyUtil.copyList(userPage.getRecords(), UserBackVO.class);
        userBackVOList.forEach(userBackVO -> {
            List<UserRole> userRoleList = userRoleMapper.selectList(new LambdaQueryWrapper<UserRole>()
                    .eq(UserRole::getUserId, userBackVO.getId()));
            List<Integer> roleIdList = userRoleList.stream()
                    .map(UserRole::getRoleId)
                    .collect(Collectors.toList());
            if (!CollectionUtils.isEmpty(roleIdList)) {
                List<Role> roleList = roleMapper.selectBatchIds(roleIdList);
                userBackVO.setRoleList(BeanCopyUtil.copyList(roleList, UserRoleVO.class));
            }
        });
        return new PageResult<>(userBackVOList, userPage.getTotal());
    }

    @Override
    public UserInfoVO getUserInfo(Integer userId) {
        User user = baseMapper.selectById(userId);
        return BeanCopyUtil.copyObject(user, UserInfoVO.class);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean saveOrUpdateUser(UserDTO userDTO) {
        User user = BeanCopyUtil.copyObject(userDTO, User.class);
        this.saveOrUpdate(user);
        List<Integer> roleIdList = userDTO.getRoleIdList();
        if (CollectionUtils.isEmpty(roleIdList)) {
            return true;
        }
        userRoleMapper.delete(new LambdaQueryWrapper<UserRole>()
                .eq(UserRole::getUserId, user.getId()));
        roleIdList.forEach(roleId -> {
            UserRole userRole = UserRole.builder()
                    .userId(user.getId())
                    .roleId(roleId)
                    .build();
            userRoleMapper.insert(userRole);
        });
        return true;
    }

    @Override
    public PageResult<UserOnlineVO> onlineUserList(String keywords) {
        // 获取security在线session
        List<UserOnlineVO> userOnlineVOList = sessionRegistry.getAllPrincipals().stream()
                .filter(item -> sessionRegistry.getAllSessions(item, false).size() > 0)
                .map(item -> JSON.parseObject(JSON.toJSONString(item), UserOnlineVO.class))
                .filter(item -> StringUtils.isBlank(keywords) || item.getNickname().contains(keywords))
                .collect(Collectors.toList());
        // 执行分页
        int fromIndex = PageUtil.getLimitCurrent().intValue();
        int size = PageUtil.getSize().intValue();
        int toIndex = userOnlineVOList.size() - fromIndex > size ? fromIndex + size : userOnlineVOList.size();
        List<UserOnlineVO> userOnlineList = userOnlineVOList.subList(fromIndex, toIndex);
        return new PageResult<>(userOnlineList, (long) userOnlineVOList.size());
    }

    @Override
    public Boolean removeOnlineUser(List<Integer> userIdList) {
        // 获取用户session
        userIdList.forEach(userId -> {
            List<Object> userInfoList = sessionRegistry.getAllPrincipals().stream().filter(item -> {
                UserDetailVO userDetailVO = (UserDetailVO) item;
                return userDetailVO.getId().equals(userId);
            }).collect(Collectors.toList());
            List<SessionInformation> allSessions = new ArrayList<>();
            userInfoList.forEach(item -> allSessions.addAll(sessionRegistry.getAllSessions(item, false)));
            // 注销session
            allSessions.forEach(SessionInformation::expireNow);
        });
        return true;
    }

    @Override
    public Boolean updateUserAble(UserAbleDTO userAbleDTO) {
        List<User> userList = baseMapper.selectBatchIds(userAbleDTO.getUserIdList());
        userList.forEach(user -> user.setAbleFlag(userAbleDTO.getAbleFlag()));
        return this.updateBatchById(userList);
    }

    @Override
    public Boolean updatePassword(UserPasswordDTO userPasswordDTO) {
        User user = baseMapper.selectById(userPasswordDTO.getUserId());
        String encode = passwordEncoder.encode(userPasswordDTO.getOldPassword());
        if (!passwordEncoder.matches(userPasswordDTO.getOldPassword(), user.getPassword())) {
            throw new RuntimeException("旧密码错误");
        }
        if (!userPasswordDTO.getNewPassword().equals(userPasswordDTO.getCheckPassword())) {
            throw new RuntimeException("确认密码有误");
        }
        user.setPassword(passwordEncoder.encode(userPasswordDTO.getNewPassword()));
        return baseMapper.updateById(user) == 1;
    }

    @Override
    public Boolean register(UserRegisterDTO userRegisterDTO) {
        if (!userRegisterDTO.getPassword().equals(userRegisterDTO.getCheckPassword())) {
            throw new RuntimeException("前后密码输入不一致");
        }
        String code = (String) redisService.get(RedisPreFixConstant.REGISTER + ":" + userRegisterDTO.getEmail());
        if (Objects.isNull(code)) {
            throw new RuntimeException("验证码已过期");
        }
        if (!code.equals(userRegisterDTO.getCode())) {
            throw new RuntimeException("验证码错误");
        }
        User user = BeanCopyUtil.copyObject(userRegisterDTO, User.class);
        user.setAbleFlag(true);
        user.setNickname(user.getUsername());
        user.setAvatar("http://8.142.27.217:39000/cinema/09388d33-06fc-4f70-b356-e3b7872e9c23.jpg");
        user.setIntro("这个人很懒，什么都没有留下。");
        user.setPassword(passwordEncoder.encode(userRegisterDTO.getPassword()));
        if (baseMapper.insert(user) == 1) {
            redisService.delete(RedisPreFixConstant.REGISTER + ":" + userRegisterDTO.getEmail());
        }
        return true;
    }

    @Override
    public Boolean forget(ForgetPasswordDTO forgetPasswordDTO) {
        String code = (String) redisService.get(RedisPreFixConstant.FORGET + ":" + forgetPasswordDTO.getEmail());
        if (Objects.isNull(code)) {
            throw new RuntimeException("验证码已过期或未获取验证码");
        }
        if (!code.equals(forgetPasswordDTO.getCode())) {
            throw new RuntimeException("验证码错误");
        }
        User user = baseMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getEmail, forgetPasswordDTO.getEmail()));
        if (Objects.isNull(user)) {
            throw new RuntimeException("用户不存在");
        }
        if (!forgetPasswordDTO.getPassword().equals(forgetPasswordDTO.getCheckPassword())) {
            throw new RuntimeException("前后密码不一致");
        }
        user.setPassword(passwordEncoder.encode(forgetPasswordDTO.getPassword()));
        if (baseMapper.updateById(user) == 1) {
            redisService.delete(RedisPreFixConstant.FORGET + ":" + forgetPasswordDTO.getEmail());
        }
        return true;
    }
}
