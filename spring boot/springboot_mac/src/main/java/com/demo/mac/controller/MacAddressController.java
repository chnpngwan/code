package com.demo.mac.controller;

import com.demo.mac.address.MACAddress;
import com.demo.mac.address.MacAddressUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.*;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.mac.controller
 * ClassName:    MacAddressController
 *
 * @Author chnpngwng
 * @Date 2023 06 03 19 35
 **/

@RestController
public class MacAddressController {

    /**@RequestMapping("/mac")
    public String machines() throws SocketException, UnknownHostException {
        String macAddress = MacAddressUtil.getMacAddress();
        System.out.println(macAddress);
        return macAddress;
    }*/

    /**@GetMapping("/mac")
    public String getMacAddress(HttpServletRequest request) throws UnknownHostException, SocketException {
        String macAddress = null;
        String remoteAddress = request.getHeader("X-Forwarded-For");
        if (remoteAddress == null || remoteAddress.isEmpty() || "unknown".equalsIgnoreCase(remoteAddress)) {
            remoteAddress = request.getHeader("Proxy-Client-IP");
        }
        if (remoteAddress == null || remoteAddress.isEmpty() || "unknown".equalsIgnoreCase(remoteAddress)) {
            remoteAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (remoteAddress == null || remoteAddress.isEmpty() || "unknown".equalsIgnoreCase(remoteAddress)) {
            remoteAddress = request.getHeader("HTTP_CLIENT_IP");
        }
        if (remoteAddress == null || remoteAddress.isEmpty() || "unknown".equalsIgnoreCase(remoteAddress)) {
            remoteAddress = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (remoteAddress == null || remoteAddress.isEmpty() || "unknown".equalsIgnoreCase(remoteAddress)) {
            remoteAddress = request.getRemoteAddr();
        }
        System.out.println(remoteAddress);
        InetAddress inetAddress = InetAddress.getByName(remoteAddress);
        NetworkInterface networkInterface = NetworkInterface.getByInetAddress(inetAddress);
        if (networkInterface != null) {
            byte[] macAddressBytes = networkInterface.getHardwareAddress();
            if (macAddressBytes != null && macAddressBytes.length > 0) {
                StringBuilder macAddressBuilder = new StringBuilder();
                for (int i = 0; i < macAddressBytes.length; i++) {
                    macAddressBuilder.append(String.format("%02X%s", macAddressBytes[i], (i < macAddressBytes.length - 1) ? "-" : ""));
                }
                macAddress = macAddressBuilder.toString();
                System.out.println(macAddress);
            }
        }
        return macAddress;
    }*/

    /*@GetMapping("/mac")
    public String getMacAddress(HttpServletRequest request) throws IOException {
        String ipAddress = request.getHeader("X-Forwarded-For");
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
        }
        String macAddress = null;
        DhcpSolicitPacket dhcpSolicitPacket = DhcpSolicitPacket.newPacket(new byte[0], 0, Inet4Address.getByName(ipAddress), Inet4Address.getByName("0.0.0.0"), Inet4Address.getByName("255.255.255.255"), InetAddress.getByName("00:00:00:00:00:00"), false, (short) 0, (short) 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
        byte[] dhcpSolicitPacketBytes = dhcpSolicitPacket.build().getPacketData();

        DatagramSocket socket = new DatagramSocket();
        socket.setSoTimeout(3000);
        socket.setBroadcast(true);
        DatagramPacket packet = new DatagramPacket(dhcpSolicitPacketBytes, dhcpSolicitPacketBytes.length, InetAddress.getByName("255.255.255.255"), 67);
        socket.send(packet);

        byte[] buffer = new byte[1024];
        packet = new DatagramPacket(buffer, buffer.length);
        socket.receive(packet);

        DhcpPacket dhcpPacket = DhcpPacket.decode(buffer, 0, packet.getLength());
        if (dhcpPacket instanceof DhcpAckPacket) {
            DhcpAckPacket dhcpAckPacket = (DhcpAckPacket) dhcpPacket;
            macAddress = dhcpAckPacket.getClientHardwareAddress().toString();
        }

        socket.close();
        return macAddress;
    }*/




    @GetMapping("/getIp")
    public String getIp(HttpServletRequest request) throws UnknownHostException {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        // 处理多个IP地址的情况，取第一个非unknown的IP地址作为客户端IP地址
        if (ip != null && ip.indexOf(",") != -1) {
            String[] ips = ip.split(",");
            for (String s : ips) {
                if (!"unknown".equalsIgnoreCase(s)) {
                    ip = s.trim();
                    break;
                }
            }
        }
        return MACAddress.string(ip);
    }
}
