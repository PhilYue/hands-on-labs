# Dubbo-go 在电商交易背景下分布式事务及AMP监控示例

给个star鼓励一下我们吧： [github.com/apache/dubbo-go](https://github.com/apache/dubbo-go)

## 教程说明
通过该教程，你将会：

- Dubbogo 的基础功能体验
- Seata-golang 的基础功能体验

案例学习时间预计15分钟左右。

点击右下角的"下一步"按钮继续。

## 准备工作
本节，你将通过 git 命令下载程序代码，并启动 Nacos 服务端

### 获取客户端及服务端程序代码
请使用下面的命令获取客户端及服务端程序代码
```bash
git clone https://github.com/PhilYue/shopping-order.git
```

### 启动 Nacos 服务端
通过如下命令启动nacos服务端
```bash
sh ~/prepare.sh
```

----

通过如下命令观察nacos启动日志:
```bash
cat /home/shell/nacos/logs/start.out
```

待出现如下输出时，代表启动完成（如果未完成启动，可以重复执行上一条命令）:
> INFO Tomcat started on port(s): 65000 (http) with context path '/nacos'<br>
> ......<br>
> INFO Nacos started successfully in stand alone mode. use embedded storage

### 安装 Mysql 并初始化数据库

通过如下命令

```bash
sh ~/init_mysql.sh
```

## 修改配置
本节，你将修改代码的一些基本配置，让程序可以运行。<br>
请认真按照本节的引导操作。在完成修改后，一定要记得保存哦。

### 修改服务端配置


### 修改客户端配置


## 修改代码依赖
本节，你将修改代码的注册引用依赖，导入nacos的注册pkg。<br>

由于需要使用nacos作为注册中心，需要import nacos依赖到代码中，方可使用

请认真按照本节的引导操作。在完成修改后，一定要记得保存哦。
### 修改客户端代码依赖

### 修改服务端代码依赖

## 运行程序

本节，你将使用 go 命令来运行上述的代码和配置

### 启动服务端
1. 开启新 console 窗口：<br>
   <tutorial-terminal-open-tab name="服务端">点击我打开</tutorial-terminal-open-tab>

2. 在新窗口中执行命令，进入cmd目录
```bash
cd shopping-order/go-server-order/cmd
```

指定配置文件, 启动服务端
```bash
export CONF_PROVIDER_FILE_PATH=../conf/server.yml && export GOPROXY=https://goproxy.io,direct && go run .
```

看到下面的反馈则表示启动成功<br>
```
 nacos/registry.go:200   update begin, service event: ServiceEvent{Action{add}, Path{dubbo...
```

```bash
cd shopping-order/go-server-product/cmd
```

指定配置文件, 启动服务端
```bash
export CONF_PROVIDER_FILE_PATH=../conf/server.yml && export GOPROXY=https://goproxy.io,direct && go run .
```

看到下面的反馈则表示启动成功<br>
```
 nacos/registry.go:200   update begin, service event: ServiceEvent{Action{add}, Path{dubbo...
```

### 启动客户端
1. 开启新 console 窗口：<br>
   <tutorial-terminal-open-tab name="客户端">点击我打开</tutorial-terminal-open-tab>

2. 在新窗口中执行命令
```bash
cd shopping-order/go-client/cmd
```

指定配置文件, 启动客户端
```bash
export CONF_CONSUMER_FILE_PATH=../conf/client.yml && export GOPROXY=https://goproxy.io,direct && go run .
```

看到下面的反馈则表示调用成功<br>


Dubbo-go 在电商交易背景下分布式事务示例完成～

给个star鼓励一下我们吧： [github.com/apache/dubbo-go](https://github.com/apache/dubbo-go)
