# Usa una imagen base de Nginx oficial, que es más ligera
FROM nginx:1.25-alpine

# 1. Borra la configuración por defecto de Nginx
RUN rm /etc/nginx/conf.d/default.conf

# 2. Copia TU archivo de configuración (que crearás abajo)
COPY proxy_backend.conf /etc/nginx/conf.d/proxy_backend.template

# 3. Copia tu script de inicio (que crearás abajo)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 4. Expone el puerto (solo documentación)
EXPOSE 8080

# 5. El comando que ejecutará Cloud Run
CMD ["/entrypoint.sh"]