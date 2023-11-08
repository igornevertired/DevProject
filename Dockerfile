# Используем официальный образ nginx как базовый образ
FROM nginx:latest

# Устанавливаем пакеты, необходимые для установки Certbot
RUN apt-get update && \
    apt-get install -y certbot

# Устанавливаем SSL сертификат для localhost
RUN certbot certonly --standalone -d localhost --agree-tos -n

# Настройка Nginx с поддержкой HTTPS
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Копируем файлы вашего проекта в директорию /usr/share/nginx/html внутри контейнера
COPY index.html /usr/share/nginx/html/index.html

# Перенаправляем трафик с порта 80 на 443 для HTTPS
EXPOSE 80
EXPOSE 443

# Команда для запуска Nginx
CMD ["nginx", "-g", "daemon off;"]