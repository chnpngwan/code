package com.demo.mac.address;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.mac.address
 * ClassName:    GetMacAddress
 *
 * @Author chnpngwng
 * @Date 2023 06 03 20 21
 **/
import java.io.IOException;
import java.net.*;
import java.util.Arrays;

public class GetMacAddress {
    public static void main(String[] args) {
        try {
            InetAddress ipAddress = InetAddress.getByName("192.168.3.1"); // 需要获取MAC地址的IP地址
            byte[] ipAddressBytes = ipAddress.getAddress();
            byte[] macAddress = null;
            byte[] broadcastAddressBytes = new byte[ipAddressBytes.length];
            for (int i = 0; i < ipAddressBytes.length; i++) {
                broadcastAddressBytes[i] = (byte) ((ipAddressBytes[i] & 0xFF) | 0x00);
            }
            InetAddress broadcastAddress = InetAddress.getByAddress(broadcastAddressBytes);
            byte[] arpPacket = new byte[28];
            arpPacket[0] = (byte) 0xFF;
            arpPacket[1] = (byte) 0xFF;
            arpPacket[2] = (byte) 0xFF;
            arpPacket[3] = (byte) 0xFF;
            arpPacket[4] = (byte) 0xFF;
            arpPacket[5] = (byte) 0xFF;
            arpPacket[6] = ipAddressBytes[0];
            arpPacket[7] = ipAddressBytes[1];
            arpPacket[8] = ipAddressBytes[2];
            arpPacket[9] = ipAddressBytes[3];
            byte[] hardwareAddress = new byte[6];
            Arrays.fill(hardwareAddress, (byte) 0x00);
            for (int i = 0; i < hardwareAddress.length; i++) {
                arpPacket[i + 10] = hardwareAddress[i];
                arpPacket[i + 16] = hardwareAddress[i];
            }
            arpPacket[14] = (byte) 0x08;
            arpPacket[15] = (byte) 0x06;
            arpPacket[16] = (byte) 0x00;
            arpPacket[17] = (byte) 0x01;
            byte[] buffer = new byte[28];
            DatagramSocket socket = new DatagramSocket();
            socket.setSoTimeout(120000000);
            socket.setBroadcast(true);
            DatagramPacket packet = new DatagramPacket(arpPacket, arpPacket.length, broadcastAddress, 0);
            socket.send(packet);
            packet = new DatagramPacket(buffer, buffer.length);
            System.out.println(packet);
            socket.receive(packet);
            macAddress = new byte[6];
            for (int i = 0; i < macAddress.length; i++) {
                macAddress[i] = buffer[i + 22];
            }
            StringBuilder macAddressBuilder = new StringBuilder();
            for (int i = 0; i < macAddress.length; i++) {
                macAddressBuilder.append(String.format("%02X%s", macAddress[i], (i < macAddress.length - 1) ? "-" : ""));
            }
            System.out.println(macAddressBuilder.toString());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (SocketException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
