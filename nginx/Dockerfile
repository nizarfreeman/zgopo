FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
COPY demo/index.html /usr/share/nginx/html/index.html
COPY certs /etc/nginx/certs
EXPOSE 443/tcp
