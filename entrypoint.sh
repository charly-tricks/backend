#!/bin/sh

# 1. Reemplaza el marcador __PORT__ con la variable $PORT que nos da Cloud Run
# 2. Reemplaza el marcador __BACKEND_URL__ con la variable $PROXY_TARGETS
envsubst < /etc/nginx/conf.d/proxy_backend.template > /etc/nginx/conf.d/default.conf

# 3. Inicia Nginx usando su ruta completa (esta es la corrección)
/usr/sbin/nginx -g 'daemon off;'
