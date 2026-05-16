FROM nginx:alpine

# Default port — Railway overrides this with its own $PORT
ENV PORT=8080

# Copy site files
COPY . /usr/share/nginx/html

# Template is processed at startup: ${PORT} → actual port value
COPY nginx.conf /etc/nginx/templates/default.conf.template
