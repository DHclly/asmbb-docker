FROM nginx/nginx:1.28.1-alpine-slim AS base

COPY docker/build/linux-amd64/app-context/asmbb /asmbb
COPY docker/build/linux-amd64/app-context/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY docker/build/linux-amd64/app-context/asmbb-start.sh /asmbb-start.sh
RUN chmod +x /asmbb-start.sh
CMD [ "/asmbb-start.sh" ]
