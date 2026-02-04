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