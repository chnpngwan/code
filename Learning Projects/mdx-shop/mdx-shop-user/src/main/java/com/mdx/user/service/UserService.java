package com.mdx.user.service;

import com.mdx.user.dto.MdxUserDTO;
import com.mdx.user.vo.LoginVo;

import javax.servlet.http.HttpServletRequest;

/**
 * @author : jiagang
 * @date : Created in 2022/7/4 10:48
 */
public interface UserService {

    String getOrderNo(String userId, String tenantId , HttpServletRequest request);

    /**
     * 登录
     * @param mdxUserDTO
     * @return
     */
    LoginVo login(MdxUserDTO mdxUserDTO);
}
