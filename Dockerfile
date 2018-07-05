FROM nginx:1.13.3-alpine

RUN cat /etc/passwd

## Copy our nginx configc
COPY nginx/ /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

RUN chmod -R 777 /var/log/nginx /var/cache/nginx/ \
    && chmod 644 /etc/nginx/*

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
