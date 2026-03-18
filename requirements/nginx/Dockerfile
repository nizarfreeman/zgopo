FROM debian:12
RUN apt-get update && apt-get install -y nginx && apt-get clean
#COPY nginx.conf /etc/nginx/nginx.conf
#COPY demo/index.html /usr/share/nginx/html/index.html
COPY certs /etc/nginx/certs
COPY default /etc/nginx/sites-available/.

EXPOSE 443/tcp
CMD ["nginx", "-g", "daemon off;"]
