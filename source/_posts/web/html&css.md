---
layout: "post"
title: "HTML+CSS"
date: "2019-7-21 14:26:05"
categories: web,html,css
tags: [web,html,css]
---

# 前端基础之HTML+CSS

## 概述

### 超~~~基础概念（各种缩写）
HTML: Hyper Text Markup Language 超文本标记语言；定义网页中有什么
CSS： Cascading Style Sheets 层叠样式表；定义网页中的东西长什么样

VSCode： Visual Studio Code 通用编辑器
MD： MarkDown，文档格式标准

Web： 互联网
W3C: 万维网联盟，非营利性组织: w3.org 为互联网提供各种标准
XML: Extension markup language 可扩展标记语言，用于定义文档结构
MDN： Mozilla Development Network, Mozilla开发者社区

### 什么是HTML

HTML是W3C组织定义的语言标准： 用于描述页面结构的语言

### 什么是CSS
CSS是W3C定义的语言标准： CSS用于描述页面结构的语言

### 执行HTML CSS

HTML&CSS --> 浏览器内核 --> 页面

浏览器：由shell(外壳)和core(内核 JS执行引擎、渲染引擎)组成

常见浏览器(包含自己的内核)： 
1. IE: Trident
2. Firefox: Gecko
3. Chrome: Webkit / Blink
4. Safari: Webkit
5. Opera: Presto(已弃用) / Blink

### 版本和兼容性

HTML5、CSS3

HTML5： 2014年发布，目前浏览器基本都兼容

CSS3： 目前还未定制完成

XHTML： 可以认为是HTML的一种版本，完全符合XML的规范(HTML5发布后，已弃用)

## 第一个页面

Emmet插件： 自动生成Html代码的插件，VSCode自带此插件

快捷键：输入`!`后按`tab`键会自动生成html5代码；输入标签后按`tab`键可补全标签代码

### 代码注释

使用 `<!-- -->` 进行注释，快捷键：`ctrl + /`

### 元素(标签、element)

元素 = 起始标记(begin tag) + 结束标记(end tag) + 元素内容 + 元素属性

1. 空元素： 没有结束标记的元素，如： `<img/>` `<input/>`

2. 元素属性 = 属性名 + 属性值

    属性的分类：

    - 局部属性： 某些元素特有的属性
    - 全局属性： 所有元素通用

### 元素的嵌套

父元素、子元素、祖先元素、后代元素、兄弟元素(拥有同一父元素)

### 标准文档结构

1. 文档声明：告诉浏览器当前文档使用的HTML标准是HTML5。不写文档声明将导致浏览器进入怪异渲染模式

    ```html
    <!DOCTYPE html>
    ```

2. 根元素： 一个页面最多只能有一个，且钙元素是所有元素的父元素或祖先元素。HTML5中没有强制要求写此元素。其中lang属性为全局属性，表示该元素内部使用的文字是那种自然语言。

    `lang="cmn-hans"`表示中国大陆官方简体中文，`lang="zh-CN"`已过时。

    ```html
    <html lang="en">
    </html>
    ```


---

参考视频

 https://www.bilibili.com/video/av57100756?from=search&seid=2646463889570770154 (2019年 HTML+CSS 零基础权威入学宝典【渡一教育】)