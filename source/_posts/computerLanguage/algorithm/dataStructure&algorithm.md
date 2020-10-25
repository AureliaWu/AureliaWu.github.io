---
layout: "post"
title: "数据结构与算法基础"
date: "2020-08-18 15:47"
categories: algorithm
tags: [Computer Language, algorithm, basic]
---

# 链表结构、栈、队列、递归行为、哈希表
## 链表结构

- 单向链表节点结构(可以实现成范型)

    ```java

    public class Node {
        public int value;
        public Node next;

        public Node(int data) {
            value = data;
        }
    }

    ```

- 双向链表节点结构
  
  ```java
  public class DoubleNode {
      public int value;
      public DoubleNode last;
      public DoubleNode next;

      public DoubleNode(int data) {
          value = data;
      }
  }

  ```

### 单向链表和双向链表最简单的练习

  - 单链表和双链表如何反转

    ```java
    public class Code_ReverseList {
        /* 单向链表单反转 */
        // 1. 定义单向链表
        class Node {
            public int value;
            public Node next;

            public Node(int data) {
                value = date;
            }
        }

        // 2. 反转单向链表
        public Node reverseLinkedList(Node head) {
            Node pre = null;
            Node next = null;

            while(head != null) {
                next = head.next;
                head.next = pre;
                pre = head;
                head = next;
            }
        }

        /*双向链表反转*/
        // 1. 定义双向链表
        class DoubleNode {
            public int value;
            public DoubleNode last;
            public DoubleNode next;

            public DoubleNode(int data) {
                value = data;
            }
        }

        // 2. 反转双向链表
        public DoubleNode reverseDoubleList(DoubleNode head) {
            DoubleNode pre = null;
            DoubleNode next = null;
            while(head != null) {
                next = head.next;
                head.next = pre;
                head.last = next;
                pre = head;
                head = next;
            }
            return pre;
        }
    }


    ```

- 删除给定值
  
  ```java
    /**
    * 指定删除head中值为num的节点
    */
  public Node removeValue(Node head, int num) {
      // 首次遍历，过滤头节点为num的情况
      // 找到第一个不需要删的位置
      while(head != null) {
          if(head.value != num) {
              break;
          }else {
              head = head.next;
          }
      }

      Node pre = head;
      Node cur = head;

      while(cur != null) {
          if(cur.value == num) {
              // 当前值为num,将当前值的下一位赋于pre.next
              pre.next = cur.next;
          }else {
              // 当前值保留,记录当前值
              pre = cur;
          }
          cur = cur.next;
      }
      return head;
  }

  ```

## 栈和队列

### 逻辑概念

- 栈： 先进后出
  
- 堆： 先进先出
  
### 实际实现
  
- 双向链表实现
  
- 数组实现

### 常见面试题

1. 怎么用数组实现不超过固定大小的队列和栈
   
   栈： 正常使用

   队列： 环形数组

2. 实现一个特殊的栈，在基本功能的基础上再实现返回栈中最小元素的功能





 