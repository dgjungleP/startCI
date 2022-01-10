#基础镜像
FROM node:12-alpine
#在容器中创建目录
RUN mkdir -p /usr/src/app

#指定工作空间
WORKDIR /usr/src/app
#拷贝 pakage.json
COPY  package.json /usr/src/app
#安装依赖
RUN npm i -g vite
RUN npm install
#拷贝其他文件到容器(排除 ignore文件中的文件)
COPY  . /usr/src/app
#build
# RUN npm run build
#暴露端口
EXPOSE 33597
#运行容器启动时的指令
CMD ["npm","run","dev"]