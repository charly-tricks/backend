FROM nginx:1.25-alpine

# --- ¡LÍNEA NUEVA Y MUY IMPORTANTE! ---
# Instala 'gettext', que contiene el comando 'envsubst'
RUN apk add --no-cache gettext
# ----------------------------------------

# 1. Borra la configuración por defecto de Nginx
RUN rm /etc/nginx/conf.d/default.conf

# 2. Copia TU archivo de configuración
COPY proxy_backend.conf /etc/nginx/conf.d/proxy_backend.template

# 3. Copia tu script de inicio
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 4. Expone el puerto (solo documentación)
EXPOSE 8080

# 5. El comando que ejecutará Cloud Run
CMD ["/entrypoint.sh"]
