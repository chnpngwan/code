## 狗眼-影院购票系统介绍

<p align="center">
   基于Springboot2.7.0 + Vue2 开发的影院购票系统
</p>

<p align="center">
   <a target="_blank" href="https://gitee.com/cxhisapig">
      <img src="https://img.shields.io/badge/JDK-8-green"/>
      <img src="https://img.shields.io/badge/springboot-2.7.0-green"/>
      <img src="https://img.shields.io/badge/vue-2.x-green"/>
      <img src="https://img.shields.io/badge/mysql-8.0.27-green"/>
      <img src="https://img.shields.io/badge/redis-6.2.6-green"/>
   </a>
</p>

## 本地运行

1. MySQL版本为`8.0.27`，npm版本为`8.19.4`，node版本为`v16.20.0`
2. SQL 文件位于SQL目录下的`cinema.sql`，将其中的数据导入到自己本地数据库中
3. 修改后端配置文件中的数据库连接信息、邮箱信息、Minio信息和支付宝沙箱信息
4. 项目启动后，使用`admin`管理员账号登录后台，密码为`123456`

## 项目特点

- 后台管理基于若依二次开发，含有侧边栏，历史标签，面包屑等
- 采用 RABC 权限模型，使用 Spring Security进行权限管理
- 支持动态权限修改、动态菜单和路由
- 实现日志管理、定时任务管理、在线用户和下线用户
- 采用 Restful 风格的 API，注释完善，代码遵循阿里巴巴开发规范，有利于开发者学习

## 技术介绍

**前端：** Vue2 + Vuex + Vue Router + JavaScript + Axios + Element UI + Echarts

**后端：** SpringBoot + Mysql + Redis + Spring Security + Swagger2 + MyBatisPlus

**其他：** 支付宝沙箱支付、邮箱验证码

## 开发环境

| 开发工具 | 说明               |
| -------- | ------------------ |
| IDEA     | Java 开发工具 IDE  |
| WebStorm | Vue 开发工具 IDE   |
| Navicat  | MySQL 远程连接工具 |

| 开发环境 | 版本   |
| -------- | ------ |
| OpenJDK  | 8      |
| MySQL    | 8.0.27 |
| Redis    | 6.2.6  |

## 项目总结

该项目是本人的毕业设计系统，由于Gitee和Github上没有很好的用于毕业设计的影院购票系统，故参考猫眼电影设计了一个狗眼电影，该项目相比起鸣谢项目中的狗眼电影有以下改进点：

1. 前端使用ES6规范开发，后端遵循阿里巴巴开发规范，更易阅读
2. 集成了支付宝沙箱，模拟了真实的影院购票系统的支付流程，并保证了幂等性
3. 排片不再固定时间，而是通过开始时间和影片时长计算并处理时间区间冲突
4. 使用Redis作为缓存，加快接口响应速度
5. 集成邮箱，实现注册以及忘记密码的验证码接收功能
6. 采用定时任务，释放15分钟后未支付的订单占有的座位信息
7. 后台首页使用Echarts实现数据可视化功能

鸣谢项目：

- [**华雨欣-狗眼电影在线售票系统**](https://gitee.com/chaos-chou/gouyan)