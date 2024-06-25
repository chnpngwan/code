package com.example.cinema.config;

import com.alipay.api.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AlipayClientConfig {
    @Value("${ali-pay.app-id}")
    private String appId;
    @Value("${ali-pay.private-key}")
    private String privateKey;
    @Value("${ali-pay.public-key}")
    private String publicKey;
    @Value("${ali-pay.gateway-url}")
    private String gatewayUrl;

    @Bean
    public AlipayClient alipayClient() throws AlipayApiException {
        AlipayConfig alipayConfig=new AlipayConfig();
        //设置appId
        alipayConfig.setAppId(appId);
        //设置商户私钥
        alipayConfig.setPrivateKey(privateKey);
        //设置支付宝公钥
        alipayConfig.setAlipayPublicKey(publicKey);
        //设置支付宝网关
        alipayConfig.setServerUrl(gatewayUrl);
        //设置请求格式,固定值json.
        alipayConfig.setFormat(AlipayConstants.FORMAT_JSON);
        //设置字符集
        alipayConfig.setCharset(AlipayConstants.CHARSET_UTF8);
        //设置签名类型
        alipayConfig.setSignType(AlipayConstants.SIGN_TYPE_RSA2);
        //构造client
        return new DefaultAlipayClient(alipayConfig);
    }
}
