package com.mdx.user;

import com.mdx.user.manager.WxMessagesManager;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @author : jiagang
 * @date : Created in 2022/7/26 11:19
 */
@SpringBootTest
public class WxMessagesTest {

    @Autowired
    private WxMessagesManager wxMessagesManager;

    @Test
    public void templateOrder(){
        wxMessagesManager.sendOrderMsg("xxxx","O34456090989787232","迷迭香的小店");
    }
}
