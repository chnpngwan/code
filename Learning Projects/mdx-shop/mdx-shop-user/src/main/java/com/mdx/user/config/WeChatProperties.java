package com.mdx.user.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Component;

/**
 * @author : jiagang
 * @date : Created in 2022/7/22 17:06
 */
@ConfigurationProperties(prefix = "wechat.public")
@Component
@Data
@RefreshScope
public class WeChatProperties {

    private String appId;

    private String appSecret;

    private String callBackUrl;

    private String orderTemplateId;
}
