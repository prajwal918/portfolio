# Stage 1: Production ready Nginx image
FROM nginx:1.25-alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Copy static assets into the container
COPY src/ ./

# Expose port 80
EXPOSE 80

# Run nginx with daemon off
CMD ["nginx", "-g", "daemon off;"]