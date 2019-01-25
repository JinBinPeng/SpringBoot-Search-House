# SpringBoot-Search-House
基于慕课网实战课程《BAT大牛亲授 基于ElasticSearch的搜房网实战》升级的SpringBoot2.0搜房网

用到了七牛云图片存储和阿里云短信业务，需要使用的话需要自己去申请账号，在yml配置文件中修改相关配置


### 技术栈
springboot，lombok，mysql，jpa，redis，thymeleaf，springsecurity，kafka，阿里云，七牛云，百度地图




启动项目的前提：启动zookeeper，kafka，Elasticsearch 版本都用最新稳定版应该都没问题

#### 启动项目后需要创建索引，索引名叫xunwu
Elasticsearch可视化工具head和kibana选其一，可以直接在上面创建索引，或者用postman工具

创建的请求方式是PUT   JSON请求体在db包下

一开始自动补全功能可能体现不出来，是因为Elasticsearch上没数据，

需要管理员登录到 http://localhost:8080/admin/center 帐号密码都是admin

然后在房源管理上重新发布房源，这样数据才会上传到Elasticsearch
