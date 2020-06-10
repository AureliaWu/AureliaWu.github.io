---
layout: "post"
title: "Java基础知识"
date: "2020-5-3 16:53"
categories: javase
tags: [Computer Language, javase]
---

# JDK12

面向对象

函数式编程 

JVM： Java Virtual Machine

虚拟的用于执行bytecode字节码的计算机

JDK： Java Development Kit

JRE: Java Runtime Environment

## 安装与配置环境变量

- 安装包地址 

    链接：https://pan.baidu.com/s/19j-EKoXEQP_BnWTcu1fmiw

    提取码：9ys5

- JDK12安装完成后不再自动生成`jre`文件夹，需要在JDK12安装目录下自行运行命令生成

    命令行输入： `bin\jlink.exe --module-path jmods --add-modules java.desktop --output jre`

- JDK 9版本之前类和资源文件存储在`lib/rt.jar`、`tools.jar`中，JDK 9版本开始 `lib/dt.jar` 和其他各种内部JAR文件都存储在一个更有效的格式在实现特定的文件lib目录。
因此`CLASS PATH`变量中不再需要配置`lib/rt.jar`、`tools.jar`






---
参考资料：

Java零基础后端工程师【马士兵教育】