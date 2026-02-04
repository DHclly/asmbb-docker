# /usr/bin/sh
# encoding=utf-8

# background start asmb
echo "[asmbb] start asmbb..."
cd /asmbb
chmod +x ./engine
./engine &
echo "[asmbb] start asmbb success"

# start nginx
echo "[asmbb] start nginx..."
nginx -g "daemon off;"
