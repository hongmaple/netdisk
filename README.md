<p align="center">
	<img alt="logo" src="https://oscimg.oschina.net/oscnet/up-d3d0a9303e11d522a06cd263f3079027715.png">
</p>
<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">RuoYi v3.8.7</h1>
<h4 align="center">基于SpringBoot+Vue前后端分离的Java快速开发框架</h4>
<p align="center">
	<a href="https://gitee.com/y_project/RuoYi-Vue/stargazers"><img src="https://gitee.com/y_project/RuoYi-Vue/badge/star.svg?theme=dark"></a>
	<a href="https://gitee.com/y_project/RuoYi-Vue"><img src="https://img.shields.io/badge/RuoYi-v3.8.7-brightgreen.svg"></a>
	<a href="https://gitee.com/y_project/RuoYi-Vue/blob/master/LICENSE"><img src="https://img.shields.io/github/license/mashape/apistatus.svg"></a>
</p>

## 平台简介

在线网盘系统，使用了DFA算法，实现了文件夹的创建与修改，多级目录，很正常的文件夹一样，支持所有文件上传，
并按文件类型分类，支持文件删除，回收站管理，恢复与彻底删除，支持公开分享和私密分享可自动生成提取码，
设置过期时间或永久有效，支持图片，视频文件的预览，支持文件夹及文件的批量压缩下载，未来计划支持更多种类
的文件预览，以及文件夹和文件的移动，层级面包屑的跳转，文件夹及多文件的批量上传分片上传

* 前端采用Vue、Element UI。
* 后端采用Spring Boot、Spring Security、Redis & Jwt。
* 权限认证使用Jwt，支持多终端认证系统。
* 支持加载动态权限菜单，多方式轻松权限控制。
* 高效率开发，使用代码生成器可以一键生成前后端代码。
* 提供了技术栈（[Vue3](https://v3.cn.vuejs.org) [Element Plus](https://element-plus.org/zh-CN) [Vite](https://cn.vitejs.dev)）版本[RuoYi-Vue3](https://github.com/yangzongzhuan/RuoYi-Vue3)，保持同步更新。
* 提供了单应用版本[RuoYi-Vue-fast](https://github.com/yangzongzhuan/RuoYi-Vue-fast)，Oracle版本[RuoYi-Vue-Oracle](https://github.com/yangzongzhuan/RuoYi-Vue-Oracle)，保持同步更新。
* 不分离版本，请移步[RuoYi](https://gitee.com/y_project/RuoYi)，微服务版本，请移步[RuoYi-Cloud](https://gitee.com/y_project/RuoYi-Cloud)
* 特别鸣谢：[element](https://github.com/ElemeFE/element)，[vue-element-admin](https://github.com/PanJiaChen/vue-element-admin)，[eladmin-web](https://github.com/elunez/eladmin-web)。
* 阿里云服务器优惠：[点我进入](https://www.aliyun.com/daily-act/ecs/activity_selection?userCode=yclv4x57)，腾讯云产品优惠：[点我进入](https://curl.qcloud.com/ZHPbMWTl)&nbsp;&nbsp;
* 阿里云618：[点我领取](https://www.aliyun.com/minisite/goods?userCode=yclv4x57)，腾讯云618：[点我领取](https://curl.qcloud.com/6znbHFOM)&nbsp;&nbsp;

## 内置功能

1.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.  部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
3.  岗位管理：配置系统用户所属担任职务。
4.  菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5.  角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7.  参数管理：对系统动态配置常用参数。
8.  通知公告：系统通知公告信息发布维护。
9.  操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
10. 登录日志：系统登录日志记录查询包含登录异常。
11. 在线用户：当前系统中活跃用户状态监控。
12. 定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
13. 代码生成：前后端代码的生成（java、html、xml、sql）支持CRUD下载 。
14. 系统接口：根据业务代码自动生成相关的api接口文档。
15. 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
16. 缓存监控：对系统的缓存信息查询，命令统计等。
17. 在线构建器：拖动表单元素生成相应的HTML代码。
18. 连接池监视：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。

## 在线体验

演示地址：http://47.96.248.176/netdisk/  
自己注册账户登录体验
管理员功能体验，自行本地部署
演示平台上传的文件与作者无关，请不要上传违法违规文件，否则封禁ip

## 演示图

<table>
    <tr>
        <td><img src="https://pic.imgdb.cn/item/66288b0f0ea9cb1403797b20.png"/></td>
        <td><img src="https://pic.imgdb.cn/item/66288f3e0ea9cb1403808877.png"/></td>
    </tr>
    <tr>
        <td><img src="https://pic.imgdb.cn/item/66288f8d0ea9cb140381144b.png"/></td>
        <td><img src="https://pic.imgdb.cn/item/662890360ea9cb1403825ba8.png"/></td>
    </tr>
    <tr>
        <td><img src="https://pic.imgdb.cn/item/662890620ea9cb140382a23f.png"/></td>
        <td><img src="https://pic.imgdb.cn/item/662890ed0ea9cb140383a9bc.png"/></td>
    </tr>
    <tr>
        <td><img src="https://pic.imgdb.cn/item/662891450ea9cb1403845c13.png"/></td>
        <td><img src="https://pic.imgdb.cn/item/662891740ea9cb140384ade9.png"/></td>
    </tr>
    <tr>
        <td><img src="https://pic.imgdb.cn/item/662891a30ea9cb1403850b80.png"/></td>
        <td><img src="https://pic.imgdb.cn/item/662891d50ea9cb140386bc46.png"/></td>
    </tr>
    <tr>
        <td><img src="https://pic.imgdb.cn/item/662892080ea9cb1403882b39.png"/></td>
        <td><img src="https://pic.imgdb.cn/item/662892600ea9cb140388e038.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/cd1f90be5f2684f4560c9519c0f2a232ee8.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/1cbcf0e6f257c7d3a063c0e3f2ff989e4b3.jpg"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-8074972883b5ba0622e13246738ebba237a.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-9f88719cdfca9af2e58b352a20e23d43b12.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-39bf2584ec3a529b0d5a3b70d15c9b37646.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-936ec82d1f4872e1bc980927654b6007307.png"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-b2d62ceb95d2dd9b3fbe157bb70d26001e9.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-d67451d308b7a79ad6819723396f7c3d77a.png"/></td>
    </tr>	 
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/5e8c387724954459291aafd5eb52b456f53.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/644e78da53c2e92a95dfda4f76e6d117c4b.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-8370a0d02977eebf6dbf854c8450293c937.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-49003ed83f60f633e7153609a53a2b644f7.png"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-d4fe726319ece268d4746602c39cffc0621.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-c195234bbcd30be6927f037a6755e6ab69c.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/b6115bc8c31de52951982e509930b20684a.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-5e4daac0bb59612c5038448acbcef235e3a.png"/></td>
    </tr>
   <td>
</td>
</table>

## 联系我，提供部署定制服务
wx: mapleCx331   qq群：[![加入QQ群](https://img.shields.io/badge/628043364-blue.svg)](https://qm.qq.com/q/RuCfOyaOUm)

## 开源不易，谢谢打赏
<table>
 <td>
   <td><img style="height: 150px;width: 100px" src="/image/wxPay.jpg" alt=""/></td>
   <td><img style="height: 150px;width: 100px" src="/image/zfb.jpg" alt=""/></td>
 </td>
</table>
    
