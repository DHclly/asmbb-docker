# /usr/bin/sh
# encoding=utf-8

# background start asmb
echo "[asmbb] start asmbb..."
cd /asmbb
# 启动 engine 并自动重启
start_engine() {
    while true; do
        # 关键修复：在启动前，先杀掉所有旧的 engine 进程
        # 这样即使程序自己 Fork 到后台导致堆积，也会被清理掉
        pkill -f "./engine" 2>/dev/null || true
        
        echo "[asmbb] starting engine with auto-restart..."
        # 启动程序，并重定向日志
        ./engine >> engine.log 2>&1
        
        # 如果程序退出，会执行到这里
        echo "[asmbb] engine stopped. Restarting in 5 seconds..."
        echo "[asmbb] logs:"
        tail -n 50 engine.log
        sleep 5
    done
}

# 在后台运行这个监控循环
start_engine &
echo "[asmbb] start asmbb success"

# start nginx
echo "[asmbb] start nginx..."
nginx -g "daemon off;"
