package com.mdx.user.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : jiagang
 * @date : Created in 2022/2/11 17:21
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginVo {

    private String userId;

    private String userName;

    private String token;
}
