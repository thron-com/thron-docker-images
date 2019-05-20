#!/bin/bash

if [ -z "${PHP_UPLOAD_MAX_FILESIZE}" ]; then PHP_UPLOAD_MAX_FILESIZE="512M"; fi
if [ -z "${PHP_MAX_FILE_UPLOADS}" ]; then PHP_MAX_FILE_UPLOADS="20"; fi
if [ -z "${PHP_POST_MAX_SIZE}" ]; then PHP_POST_MAX_SIZE="512M"; fi
if [ -z "${PHP_DISPLAY_ERRORS}" ]; then PHP_DISPLAY_ERRORS="Off"; fi
if [ -z "${PHP_MAX_INPUT_TIME}" ]; then PHP_MAX_INPUT_TIME="60"; fi
if [ -z "${PHP_TIMEZONE}" ]; then PHP_TIMEZONE="Etc/UTC"; fi
if [ -z "${PHP_MEMORY_LIMIT}" ]; then PHP_MEMORY_LIMIT="128M"; fi

export PHP_UPLOAD_MAX_FILESIZE
export PHP_MAX_FILE_UPLOADS
export PHP_POST_MAX_SIZE
export PHP_DISPLAY_ERRORS
export PHP_MAX_INPUT_TIME
export PHP_TIMEZONE
export PHP_MEMORY_LIMIT

exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
