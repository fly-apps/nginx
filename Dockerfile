FROM nginx:alpine

ADD nginx.conf /etc/nginx/nginx.conf
ENV NGINX_PORT=8080