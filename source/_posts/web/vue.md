---
layout: "post"
title: "Vue"
date: "2019-6-22 14:47:36"
categories: [web,vue]
tags: [web,vue]
---

# Vue笔记

## `v-for`指令

html代码：

```vue
  <p v-for="item in list"> {{ item }}</p>

```
javascript代码：

```javascript
  <script>
    var vm = new Vue({
      el: '#app',
      data: {
        list: [
          {id : 1, name: zs1},
          {id : 2, name: zs2},
          {id : 3, name: zs3},
          {id : 4, name: zs4},
        ]
      }
    })
  </script>
```
`v-for`指令除了能遍历数组还能遍历对象，遍历对象时，要写成：

`<p v-for="(value, key) in user"> 值是:`{{ value }}` --- 键是`{{ key }}`</p>`

除了value和key之外，在第三个位置还有索引。`v-for`指令中，`in`后面可以是普通数组、对象数组、对象、数字，若为数字时，`count in 10`的`count`从1开始

注意事项： 
1. vue 2.20+ 版本中，使用v-for指令时，需要指定key，保证数据的唯一性
2. key属性只能用number或者String
3. key在使用时必须使用`v-bind`属性的形式绑定

## `v-if`和 `v-show`指令

`v-if` 每次都会重新删除或创建元素，有较高的切换性能消耗
`v-show` 每次不会重新进行DOM的删除和创建操作，只是切换了元素的display:none样式，有较高的初始渲染消耗

如果元素涉及到频繁的切换，最好不要用`v-if`,如果元素可能永远不会被显示出来，则推荐使用`v-if`

## 数组的新方法

`forEach` `some` `filter` `findIndex` 都属于数组的新方法，都会对数组中的每一项进行遍历，执行相关操作 

## 过滤器

### 过滤器调用时的格式

`{{ data | 过滤器的名称 }}`

### 过滤器的定义语法

```javascript
// 过滤器的第一个参数被定死，永远是管道符`|`前面传递过来的数据
Vue.filter('过滤器的名称', function(data) {})
```
`Vue.filter()`定义的是全局的过滤器，所有的vm实例共享

### 私有过滤器

```javascript
var vm = new Vue({
  el: '#xx',
  data: {},
  methods:{},
  filters: {
    // 定义私有过滤器，过滤器两个条件 【过滤器名称和处理函数】
  }
})
```

注： 过滤器调用的时候采用就近原则，如果私有过滤器和全局过滤器名称一致，优先调用私有过滤器

## 按键修饰符

官方文档提供默认的按键修饰符，除此之外还可以自定义按键修饰符(2.x版本)：

```javascript
// Vue.config.keyCodes.自定义名称 = 对应键盘码码值
Vue.config.keyCodes.f2 = 113;
```

## 自定义指令

vue中所有的指令，在调用时都以`v-`开头,自定义指令的时候，指令名称的前面不需要加`v-`前缀，但是调用时必须加上`v-`

```javascript
// 使用v-derective()定义全局的指令
Vue.derective(指令的名称, {
  // 在每个函数中，第一个参数永远是el,表示被绑定了指令的元素，这个el参数是一个原生的JS对象
  bind: function(el) {
    // 每当指令绑定到元素上的时候，会立即执行这个bind函数，只执行一次
    // 和样式相关的可以放在bind中
  },
  inserted: function(el) {
    // 元素插入到DOM中的时候，会执行insert函数，只触发一次
  },
  updated: function(el) {
    // 当VNode更新的时候，会执行updated,可能会触发多次
  }
})
```

更多钩子函数的参数具体可见官方文档: https://cn.vuejs.org/v2/guide/custom-directive.html#%E9%92%A9%E5%AD%90%E5%87%BD%E6%95%B0

### 自定义私有指令

```javascript
var vm = new Vue({
  el: '#xx',
  data: {},
  methods:{},
  directive: {
    // 定义私有指令
    指令名: {
      bind: function(el) {

      }
    }

  }
})
```
### 函数简写

在很多时候，你可能想在 bind 和 update 时触发相同行为，而不关心其它的钩子，可以简写成：

```javascript
Vue.directive('color-swatch', function (el, binding) {
  el.style.backgroundColor = binding.value
})
```

## Vue实例的生命周期

### 概念

生命周期钩子 = 生命周期函数 = 生命周期时间 = Vue实例从创建、运行到销毁期间运行的各种各样的事件

### 分类

创建期间的生命周期函数、运行期间的生命周期函数、销毁创建期间的生命周期函数

![Vue生命周期图解](/data/img/vue/lifecycle.png) 

#### 创建生命周期

第一个生命周期函数: `beforeCreate()`,与`data`和`methods`平级，在实例完全被创建出来之前执行，执行时，`data`和`methods`都还没初始化

第二个生命周期函数： `created()`,与`data`和`methods`平级，此时`data`和`methods`已初始化，可以操作`data`中的数据，也可以调用`methods`中的方法

第三个生命周期函数： `beforeMount()`,表示模板已经在内存中编译完成，但尚未把模板输出到页面中。`beforeMount()`执行时，页面中的元素没有被真正替换过来，只是之前写的一些模板字符，如在`beforeMount()`中打印对应页面中的`{{ msg }}`出现的结果是插值表达式`{{ msg }}`，而不是`data`中定义的`msg`的值

第四个生命周期函数: `mounted()`，表示内存中的模板已经挂载到了页面中，用户可以看到渲染好的页面，在`mounted()`中打印对应页面中的`{{ msg }}`不再是差值表达式，而是`data`中定义的`msg`的值；`mounted()`是实例创建期间的最后一个生命周期函数，当执行完`mounted()`就表示实例已经被完全创建好了，此时组件已经脱离了创建阶段，进入运行阶段。如果要通过某些插件操作页面上的DOM节点，最早要在`mounted()`中进行。

#### 运行期间的生命周期

运行期间的生命周期函数的触发条件是数据被改变

- `beforeUpdate()` 界面还没有被更新，页面上显示的数据还是旧数据，但data中的数据被更新了，此时页面尚未和最新数据保持同步

- `updated()`,执行时，页面和data数据已经保持同步了，都是最新的

#### 销毁阶段的生命周期

- `beforeDestory()` 当执行此钩子函数时，Vue实例已经从运行阶段进入到了销毁阶段，此时所有的`data`和所有的`methods`以及过滤器、指令都处于可用状态，还没有真正执行销毁

- `destoryed()` 此时组件中所有的`data`和所有的`methods`以及过滤器、指令都处于不可用状态

## vue-resource实现get,post,jsonp请求

除了vue-resource之外，还可以使用叫做`axios`的第三方包实现数据的请求。目前使用`axios`比较多，`vue-resource`此部分只做了解，嘿嘿~

### get请求

```javascript
  this.$http.get(请求地址).then(function(result) {
      // 通过result.body拿到服务器返回的成功数据
  });
```
### post请求

```javascript
  this.$http.post(请求地址,请求数据,{ emulateJSON: true }).then(result => {
      // 请求数据不能省略，手动发起的post请求默认没有表单格式，所以有的服务器接收不了
      // 将post的第三个参数 { emulateJSON: true }设置提交内容为普通表达数据格式，防止以上情况发生
  });
```
### jsonp请求

```javascript
  this.$http.jsonp(请求地址).then(result => {});
```

## Vue中的动画(此部分先跳过，用到时再看)

### 使用第三方类实现动画(animate.css)

引入`animate.css`后直接使用

### 动画钩子函数

1. 动画钩子的第一个参数el，表示要执行动画的DOM元素，那个是原生的JS DOM 对象，可认为是通过document.getElementById('')方式获取到的原生Js对象
2. beforeEnter表示动画入场之前，此时，动画尚未开始，可以在beforeEnter中，设置元素开始动画之前的起始样式

## 组件

为了拆分Vue实例的代码量，能以不同的组件来划分不同的功能模块。

>> 组件化和模块化的区别
 - 模块化是从代码逻辑的角度进行划分的，方便代码分层开发，保证每个功能模块的职能单一
 - 组件化是从UI界面的角度进行划分的，方便UI组件的重复利用

### 创建组件的方式

1. 使用`Vue.extend`创建全局Vue组件，通过`template`属性指定组件要展示的html结构

```javascript
// 创建组件模板对象
var com1 = Vue.extend({
  template: '<h3>这是用 Vue.extend 创建的组件</h3>'
});

// 使用Vue.component('组件的名称', 创建出来的组件模板对象)
Vue.component('myCom1', com1);

```

如果要使用组件，直接把组件的名称以HTML标签的形式引用。如果使用`Vue.component`定义全局组件，组件名称使用了驼峰命名，在引用时，需要将大写的驼峰改成小写字母，并加上`-`。
例如： 组件名称`myCom1`,在引用时，页面的标签应为`<my-com1></my-com1>`;组件名称`mycom1`,在引用时，页面的标签应为`<mycom1></mycom1>`

简化写法：

```javascript

Vue.component('myCom1', Vue.extend({
  template: '<h3>这是用 Vue.extend 创建的组件</h3>'
}));

```

2. 使用`Vue.component`注册组件

```javascript

Vue.component('myCom2', {
  template: '<h3>这是用 Vue.extend 创建的组件</h3>'
});

```

### 组件切换

1. 使用 `v-if`、`v-else` 实现组件的切换
2. 使用 `component` 标签控制组件的切换(Vue内置组件： `component` `template` `transition` `transitionGroup`)
3. 使用组件切换动画切换

```javascript


```
### 父子组件传值

#### 父组件向子组件传值(通过属性传值，通过事件绑定`v-on`传递方法)

父组件可以在引用子组件时，通过属性绑定的形式(:)把需要传递给子组件的数据，以属性绑定的形式传递到子组件内部，供子组件使用。

父组件传递的数据放在子组件的`props`数组中，组件中的所有`props`中的数据都是通过父组件传递给子组件的。 

注： 
1. 子组件中的`data`数据并不是通过父组件传递过来的，而是子组件本身私有的，比如子组件通过Ajax请求回来的数据都可以放在data中
2. `data`中的数据都是可读可写的，`props`中的数据都是只读的

父组件传递方法给子组件，使用事件绑定机制`v-on`定义需要传递的方法，子组件通过`this.$emit('传递的方法名'，'参数1'， '参数2'...)`进行调用。

#### 子组件向父组件传值
通过事件回传

## tips

### 填充字符串

ES6中的字符串新方法`String.prototype.padStart(maxLength, filterString= ' ')` 或 `String.prototype.padEnd(maxLength, filterString= ' ')`来填充字符串

- `maxLength` 表示填充完毕的总长度
- `filterString= ' '` 表示填充的字符
- `padStart`表示从前面填充，`padEnd`从后面填充

例如填充时间格式中的月

```javascript
var m = ((new Date()).getMonth() + 1).toString().padStart(2, '0');
```



参考视频: https://www.bilibili.com/video/av27969216/?p=1