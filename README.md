##  在线答题系统

> 知识答题系统是一个网上答题系统，本系统设计可供为学习或娱乐。系统设计的题目题型目前只支持选择题。系统设计的题目类型多样，可以支持文本类型题目、图片类型题目、视频类型题目以及音频类型题目，用户在答题后会显示正确答案以及解题过程或者是理论概念。为了方便用户使用，系统除了Web端以外还开发了微信网页端，让用户可以随时使用微信进行答题学习。

- 系统
  - 分为客户端，管理端，微信端
- 技术框架
  - 使用SSM+Vue的形式来实现，SSM框架用于处理后台的数据逻辑，Vue框架用于前端的数据显示
  - 使用git和maven管理项目
- 注意事项
  - 数据库文件在一级目录下，命名为answerWeb.sql，部署时，需要在answerWeb/config/dbconfig.properties配置文件中配置好数据库
  - 管理端用户表为‘admins’表
  - 客户端用户表为‘user’表，用户端登录页登录帐号为邮箱
  - 管理端，在创建题目时，在选择完图片后，图片会立即上传到百度云BOS对象存储中（需要在util包的BOSUtil工具类你的BOS对象存储），未点击添加题目时，此时试题的资源（图片，视频）是在BOS的临时文件夹下（在QuestionController类定义路径），当点击添加题目后，会把此试题的资源添加到目标文件夹下（在QuestionController类定义路径），临时文件夹下的东西可以设置任务调度器进行定时删除，防止浪费BOS存储空间。
  - 微信端是利用公众号的形式进行开发，如果需要使用到微信端，需要提前申请公众号
  - 项目的jar包除了用maven管理外，有一部分jar需要手动导入（answerWeb/WebRoot/WEB-INF/lib）
  
- 部分页面
  - 登录页
![](https://malizhi-blog-1252037601.cos.ap-guangzhou.myqcloud.com/AnswerWeb-README/%E7%99%BB%E5%BD%95%E9%A1%B5.png)
  - 首页
![](https://malizhi-blog-1252037601.cos.ap-guangzhou.myqcloud.com/AnswerWeb-README/%E9%A6%96%E9%A1%B5.png)
  - 答题页
![](https://malizhi-blog-1252037601.cos.ap-guangzhou.myqcloud.com/AnswerWeb-README/%E7%AD%94%E9%A2%98%E9%A1%B5%E9%9D%A2%E4%B8%80.png)
![](https://malizhi-blog-1252037601.cos.ap-guangzhou.myqcloud.com/AnswerWeb-README/%E7%AD%94%E9%A2%98%E9%A1%B5%E9%9D%A2%E4%BA%8C.png)
  - 管理端编辑试题页面
![](https://malizhi-blog-1252037601.cos.ap-guangzhou.myqcloud.com/AnswerWeb-README/%E7%AE%A1%E7%90%86%E7%AB%AF%E7%BC%96%E8%BE%91%E8%AF%95%E9%A2%98%E9%A1%B5%E9%9D%A2.png)
  - 微信页
  
  ![](https://malizhi-blog-1252037601.cos.ap-guangzhou.myqcloud.com/AnswerWeb-README/%E5%BE%AE%E4%BF%A1%E7%AB%AF%E7%AD%94%E9%A2%98%E9%A1%B5%E9%9D%A2%E4%B8%80.png)
  ![](https://malizhi-blog-1252037601.cos.ap-guangzhou.myqcloud.com/AnswerWeb-README/%E5%BE%AE%E4%BF%A1%E7%AB%AF%E7%AD%94%E9%A2%98%E9%A1%B5%E9%9D%A2%E4%BA%8C.png)