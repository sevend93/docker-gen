# docker-gen

1.宿主主机使用 ngixn＋安全狗 统一对访问流量进行过滤

2.创建一个 docker-gen 容器对 dokcer 内的 web 容器进行识别并生成 conf 文件以提供宿主服务器的 nginx 进行反向代理

3.docker 内的 web 容器必须设置变量 VIRTUAL_HOST = www.baidu.com （docker-gen判断web容器和域名的依据）

4.docker-gen 容器必须挂载宿主服务器的 /var/run/docker.sock 到容器 /var/run/docker.sock

5.docker-gen 容器必须挂载宿主服务器的 /data/nginx 到容器 /data ，以便共享存储 conf 文件

6.宿主服务器使用 diff 自动判断 conf 文件的变化并进行 nginx reload

7.感谢 @Jason Wilder
