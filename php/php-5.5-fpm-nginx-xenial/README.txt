docker run -p 80:80 -e PHP_POST_MAX_SIZE='128M' -it lucaagostini/php:5.5-fpm-nginx
docker build -t lucaagostini/php:5.5-fpm-nginx .