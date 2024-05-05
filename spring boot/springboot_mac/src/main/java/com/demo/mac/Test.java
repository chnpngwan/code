package com.demo.mac;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.mac
 * ClassName:    Test
 *
 * @Author chnpngwng
 * @Date 2023 06 04 16 04
 **/


public class Test {
    public static void main(String[] args) throws IOException {
        String macAddr = null;
        Process process = Runtime.getRuntime().exec("ipconfig");
        BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
        Matcher matcher = null;
        Pattern pattern = Pattern.compile("([1-9]|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3}");
        for (String strLine = br.readLine(); strLine != null;
             strLine = br.readLine()) {
            System.out.println(strLine);
            matcher = pattern.matcher(strLine);
            if (matcher.find()) {
                macAddr = matcher.group();
                break;
            }
        }
        System.out.println(macAddr);
    }
}
