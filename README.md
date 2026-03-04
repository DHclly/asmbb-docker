# asmbb-docker

基于 nginx 构建的 docker 镜像，有英文版和中文版

## 构建命令

先解压 app-context 同级目录下的 asmbb_v3.0.0_cn.tar.gz 或者 asmbb_v3.0.0.tar.gz 到 app-context 下，然后执行构建命令。


```bash
docker build --platform linux/amd64 --pull=false --tag asmbb:v3.0.0-amd64 --file docker/build/linux-amd64/Dockerfile .
```

## 运行命令

```bash
docker run --name=asmbb --publish 8080:80 -d asmbb:v3.0.0-amd64
```

## 最新 docker 镜像

由于不知道的原因，底层的 ./engine 程序会突然挂掉，因此加了检测和重启机制。

```bash
docker pull dhclly/asmbb:20260304A2-v3.0.0-amd64
```

在首次启动后，可以把容器里面的 `/asmbb/board.sqlite` 文件拷贝到物理机上，然后映射进去，避免数据库数据丢失

```bash
docker run --name=asmbb --publish 8080:80 --detach \
-v /data/asmbb/board.sqlite:/asmbb/board.sqlite \
dhclly/asmbb:20260304A2-v3.0.0-amd64
```
