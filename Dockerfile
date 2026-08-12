# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 安装 Shellinabox
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置 root 用户的密码为 'root'
RUN echo 'root:frepai' | chpasswd

# 暴露 22 端口
EXPOSE 22

# 启动 Shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]



# FROM alpine:latest
# RUN apk add --no-cache wget tar
# WORKDIR /app
# # 下载 sing-box 官方程序
# RUN wget https://github.com/SagerNet/sing-box/releases/download/v1.10.1/sing-box-1.10.1-linux-amd64.tar.gz && \
#     tar -zxvf sing-box-1.10.1-linux-amd64.tar.gz && \
#     mv sing-box-1.10.1-linux-amd64/sing-box . && \
#     rm -rf sing-box-1.10.1-linux-amd64*
# COPY config.json .
# EXPOSE 8080
# CMD ["./sing-box", "run", "-c", "config.json"]
