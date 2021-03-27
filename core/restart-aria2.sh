#!/data/data/com.termux/files/usr/bin/bash

check_installed_status
check_pid
[[ -n ${PID} ]] && kill -9 "${PID}"
check_storage
blue "[*] 尝试开启唤醒锁……"
termux-wake-lock
green "[√] 所有步骤执行完毕，开始启动..."
$PREFIX/bin/aria2c "$(grep -v '#' "$HOME/.aria2/aria2.conf" | sed '/^$/d' | sed "s/^/--&/g" | sed ':label;N;s/\n/ /;b label')" -D
[[ -z ${PID} ]] && red "[!] Aria2 启动失败，请检查日志！" && return 1
