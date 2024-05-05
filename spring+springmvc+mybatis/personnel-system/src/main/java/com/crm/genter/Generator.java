package com.crm.genter;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.crm.genter
 * ClassName:     Tb_empController
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 10 17
 **/
public class Generator {
    /*
     * targetRuntime="MyBatis3Simple", 不生成Example
     */
    public void generateMyBatis() {
        //MBG执行过程中的警告信息
        List<String> warnings = new ArrayList<String>();
        //当生成的代码重复时，覆盖原代码
        boolean overwrite = true ;
        String generatorFile = "/generatorConfig.xml";
        //String generatorFile = "/generator/generatorConfigExample.xml";
        //读取MBG配置文件
        InputStream is = Generator.class.getResourceAsStream(generatorFile);

        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config;
        try {
            config = cp.parseConfiguration(is);
            DefaultShellCallback callback = new DefaultShellCallback(overwrite);
            //创建MBG
            MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
            //执行生成代码
            myBatisGenerator.generate(null);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (XMLParserException e) {
            e.printStackTrace();
        } catch (InvalidConfigurationException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        for (String warning : warnings) {
            System.out.println(warning);
        }
    }


    public static void main(String[] args) {
        Generator generator = new Generator();
        generator.generateMyBatis();
    }
}
