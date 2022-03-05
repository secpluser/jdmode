#!/bin/sh

# diysh
if [[ $CUSTOM_SHELL_FILE != "" ]]; then
    echo $CUSTOM_SHELL_FILE | grep -qE "^http" && wget --no-cache --no-check-certificate -qO /jd/config/tmp_shell_script_mod.sh $CUSTOM_SHELL_FILE || cp -rf $CUSTOM_SHELL_FILE /jd/config/tmp_shell_script_mod.sh
fi
if [[ -s /jd/config/tmp_shell_script_mod.sh ]]; then
    touch /jd/config/shell_script_mod.sh
    cmp -s /jd/config/tmp_shell_script_mod.sh /jd/config/shell_script_mod.sh && echo $CUSTOM_SHELL_FILE 更新前后一致 || echo $CUSTOM_SHELL_FILE 更新成功
    cp -f /jd/config/tmp_shell_script_mod.sh /jd/config/shell_script_mod.sh
    chmod +x /jd/config/shell_script_mod.sh
    ln -sf /jd/config/shell_script_mod.sh /usr/local/bin/upup
    upup
    echo upup 执行完毕
else
    echo $CUSTOM_SHELL_FILE 获取失败
fi

# crond
echo $1 | grep -qE "crond" && echo start crond... && crond -f