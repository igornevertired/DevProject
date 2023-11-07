FROM nginx:latest

# Копируйте файлы вашего проекта в директорию /usr/share/nginx/html внутри контейнера
COPY index.html /usr/share/nginx/html/index.html

# Копируйте ваш SSL-сертификат и ключ в соответствующие директории
COPY ssl.crt /etc/nginx/ssl.crt
COPY ssl.key /etc/nginx/ssl.key

# Настройка Nginx для HTTPS
RUN sed -i 's/listen 80;/listen 443 ssl;/g' /etc/nginx/conf.d/default.conf
RUN sed -i 's/# Add the certificates.*/ssl_certificate \/etc\/nginx\/ssl.crt\/ssl.crt;/g' /etc/nginx/conf.d/default.conf
RUN sed -i 's/# Add the key.*/ssl_certificate_key \/etc\/nginx\/ssl.key\/ssl.key;/g' /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]