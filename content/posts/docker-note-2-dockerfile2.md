---
title: "Docker Note 2 - Makefile commands part2"
date: 2020-11-09T12:55:28+08:00
draft: false
---

# ARG

ARG 所设置的构建环境的环境变量，在将来容器运行时是不会存在这些环境变量的


Dockerfile 中的 ARG 指令是定义参数名称，以及定义其默认值。该默认值可以在构建命令 docker build 中用 --build-arg <参数名>=<值> 来覆盖。

ARG 指令有生效范围，如果在 FROM 指令之前指定，那么只能用于 FROM 指令中。


# VOLUME

这里的 /data 目录就会在运行时自动挂载为匿名卷，任何向 /data 中写入的信息都不会记录进容器存储层，从而保证了容器存储层的无状态化。当然，运行时可以覆盖这个挂载设置。

# EXPOSE

要将 EXPOSE 和在运行时使用 -p <宿主端口>:<容器端口> 区分开来。-p，是映射宿主端口和容器端口，换句话说，就是将容器的对应端口服务公开给外界访问，而 EXPOSE 仅仅是声明容器打算使用什么端口而已，并不会自动在宿主进行端口映射。

# WORKDIR

每一个 RUN 都是启动一个容器、执行命令、然后提交存储层文件变更

# ONBUILD

ONBUILD 是一个特殊的指令，它后面跟的是其它指令，比如 RUN, COPY 等，而这些指令，在当前镜像构建时并不会被执行。只有当以当前镜像为基础镜像，去构建下一级镜像的时候才会被执行。