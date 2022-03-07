FROM node:lts-alpine3.14

ENV JD_DIR=/jd
ENV CUSTOM_SHELL_FILE=https://raw.githubusercontent.com/secpluser/jdmode/main/jd.sh

RUN apk update \
    && apk add --no-cache bash curl wget unzip grep tzdata git coreutils moreutils openssl jq openssh-client python3 py3-pip caddy \
    && npm install pm2@latest -g \
    && pip install Telethon \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /jd/config /jd/log /jd/tmp \
    && rm -rf /var/cache/apk/* 
    
COPY docker_entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /jd

ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "crond" ]