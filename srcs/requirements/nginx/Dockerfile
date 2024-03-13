FROM debian:bullseye

# Update package lists and install nginx
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx

# Install OpenSSL
RUN apt-get install -y openssl

# Generate self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/server.key -out /etc/nginx/server.crt -subj "/C=US/ST=CA/L=San Francisco/O=Example/OU=Web Security/CN=localhost"

# Copy default Nginx configuration
COPY conf/default /etc/nginx/sites-available/default

# Expose port 443
EXPOSE 443

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
