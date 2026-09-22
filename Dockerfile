FROM nginx:alpine

# Metadata
LABEL maintainer="prajwal-jogi"
LABEL version="2.0.0"
LABEL description="Prajwal Jogi Personal Portfolio - Hardened Production Web Stack"
LABEL security.hardened="true"

# Remove default nginx configurations and assets
RUN rm -rf /usr/share/nginx/html/* /etc/nginx/conf.d/default.conf

# Copy custom enterprise hardened nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static assets into the container with non-root ownership
COPY src/ /usr/share/nginx/html

# Enforce secure file permissions
RUN chmod -R 755 /usr/share/nginx/html && \
    chown -R nginx:nginx /usr/share/nginx/html

# Zero-downtime healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]