FROM daocloud.io/nginx:1.11-alpine

RUN apk --update add curl

EXPOSE 80

HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1

CMD sed -i "s/ContainerID: /ContainerID: "$(hostname)"/g" /usr/share/nginx/html/index.html && nginx -g "daemon off;"

LABEL maintainer="Hailin Tao" \
      io.daocloud.dce.plugin.name="dce-geely-plugin" \
      io.daocloud.dce.plugin.description="模块测试vue项目" \
      io.daocloud.dce.plugin.categories="test" \
      io.daocloud.dce.plugin.vendor="geely" \
      io.daocloud.dce.plugin.required-dce-version=">=2.2.0" \
      io.daocloud.dce.plugin.nano-cpus-limit="500000000" \
      io.daocloud.dce.plugin.memory-bytes-limit="52428800"

COPY ./dist/.  /usr/share/nginx/html
COPY plugin.json  /usr/share/nginx/html
