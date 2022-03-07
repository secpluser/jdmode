> DIY IS BEST
  
#### 部署
* docker docker-compose安装
```bash
apt update && apt install -y python3-pip curl vim git moreutils; curl -sSL get.docker.com | sh; pip3 install --upgrade pip; pip install docker-compose
```
* 扫码获取cookie,按一行一个的格式填入 /jdmode/config/config.sh, 后续更新cookie也是编辑此文件
```bash
mkdir -p /jdmode
wget --no-check-certificate -qO /jdmode/docker-compose.yml https://raw.githubusercontent.com/tdcnull/jdmode/main/docker-compose.yml
cd /jdmode && docker-compose up -d
echo 等待10秒 && sleep 10
docker exec -it jdmode /bin/sh -c 'node /jd/scripts/getJDCookie.js'
vim /jdmode/config/config.sh
```
* 按需修改 [jd_docker支持的其它变量](https://github.com/Aaron-lv/sync/blob/jd_scripts/githubAction.md) 后重启 jdmode | 配置TG通知参数等
```bash
cd /jdmode
vim /jdmode/docker-compose.yml
重要：fork 后修改jd.sh脚本中function getcknode 自定义变量 内置助力码,否则可能会助力到我和内置基础仓库的作者
重要：fork 后修改 CUSTOM_SHELL_FILE 值为你自己DIY后的 jd.sh 代码地址,否则可能会助力到我和内置基础仓库的作者
docker-compose up -d
```
* 常用指令
```bash
docker exec -it jdmode /bin/sh
docker exec -it jdmode /bin/sh -c 'crontab -l'
docker exec -it jdmode /bin/sh -c 'node /jd/scripts/getJDCookie.js'
docker exec -it jdmode /bin/sh -c 'docker_entrypoint.sh'
docker exec -it jdmode /bin/sh -c 'cknode 1@99999 /jd/scripts/jd_bean_change.js'
cd /jdmode && docker-compose restart jdmode
```
  
#### Tips:
* [jd.sh](https://github.com/tdcnull/jdmode/blob/main/jd.sh) 脚本仅供参考,修改cknode部分 自定义变量 内置助力码 后再使用即可助力自己账号
* 目前内置基础仓库为：https://github.com/Aaron-lv/sync
* 如项目中有侵犯到你的合法权益的代码,请发[issues]((https://dashboard.heroku.com/new?template=https://github.com/secpluser/jdmode))要求删除  
  
#### Thanks:
* [lxk0301/jd_docker](https://gitee.com/lxk0301/jd_docker)
* [iouAkira](https://github.com/iouAkira/someDockerfile/tree/master/dd_scripts)
* [Aaron-lv](https://github.com/Aaron-lv/sync)
* [cdle](https://github.com/cdle/carry)
* 其它脚本中涉及到的作者

