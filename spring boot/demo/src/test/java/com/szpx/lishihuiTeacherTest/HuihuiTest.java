package com.szpx.lishihuiTeacherTest;

import com.szpx.entity.lishihui.Huihui;
import com.szpx.service.HuihuiService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.List;

@SpringBootTest
public class HuihuiTest {
    @Autowired
    private DataSource dataSource;

    @Autowired
    private HuihuiService huihuiService;
    @Test
    public void  testDataSource() throws Exception{
        System.out.println("数据源:"+dataSource.getClass());
        Connection con = dataSource.getConnection();
        System.out.println("连接对象:"+con);
    }

    @Test
    public void testAllHuihui(){
        List<Huihui>  huihuiList = huihuiService.selectAllHuihui();
        System.out.println(huihuiList.toString());
    }

}
