# Используем официальный образ nginx как базовый образ
FROM nginx:latest


RUN apt-get update && apt-get install -y openssl

# Настройка Nginx с поддержкой HTTPS
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Копируем файлы вашего проекта в директорию /usr/share/nginx/html внутри контейнера
COPY index.html /usr/share/nginx/html/

EXPOSE 80
EXPOSE 443

# Команда для запуска Nginx
CMD ["nginx", "-g", "daemon off;"]