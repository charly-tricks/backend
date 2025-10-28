#!/bin/sh

# 1. Reemplaza el marcador __PORT__ con la variable $PORT que nos da Cloud Run
#    (Que en tu caso es 8080)
# 2. Reemplaza el marcador __BACKEND_URL__ con la variable $PROXY_TARGETS
#    (Que en tu caso es 77.237.232.1:5680)
envsubst < /etc/nginx/conf.d/proxy_backend.template > /etc/nginx/conf.d/default.conf

# Inicia Nginx en primer plano (obligatorio para Cloud Run)
nginx -g 'daemon off;'