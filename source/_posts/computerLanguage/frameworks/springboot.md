---
layout: "post"
title: "Springboot"
date: "2020-4-29 17:18"
categories: framework,Springboot
tags: [Computer Language, framework, Springboot]
---

# 实践中报错集锦

## 运行成功并退出

`Process finished with exit code 0`

原因： `Pom.xml`文件缺少依赖

```xml

 <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
  </dependency>

```

## 引入`spring-security`每次调用需要输入登录名密码

解决办法： 关闭验证

1. `springboot 2.0` 之前可通过yml配置关闭验证：

    ```yml

    security.basic.enabled=false
    management.security.enabled=false

    ```

2.  `springboot 2.x`后关闭验证

     `springboot 2.x` 后上述配置被废除，需要在启动类前的 `@SpringBootApplication` 注解中加入 `exclude` 属性 `scurityAutoConfiguration`

     ```java
      @SpringBootApplication(exclude = SecurityAutoConfiguration.class)
     ```

## 数据库连接报错

报错内容: `java.sql.SQLException: The server time zone value '�й���׼ʱ��' is unrecognized or represents more than one time zone. You must configure either the server or JDBC driver (via the 'serverTimezone' configuration property) to use a more specifc time zone value if you want to utilize time zone support.`

报错原因： 数据库连接时区配置问题

解决方法： 数据库配置添加时区配置 `serverTimezone=UTC`

```yml
spring:
  datasource:
    username: ${MYSQL_USER:root}
    password: ${MYSQL_PASSWORD:123456}
    url: jdbc:mysql://${MYSQL_HOST:localhost}:${MYSQL_PORT:3306}/${MYSQL_DATABASE:dbname}?serverTimezone=UTC&useUnicode=true&useSSL=false&characterEncoding=utf8

```










---
参考资料：




