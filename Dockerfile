FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (for caching layers)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Install pm2 globally
RUN npm install pm2 -g

# Copy the entire application into the container
COPY . .

# Copy SSL certificates for HTTPS confiduration
ARG SERVER_CRT
ARG PRIVATE_KEY

# Pass the SSL certificate files inside the container
RUN echo "$SERVER_CRT" > /app/server.crt && \
    echo "$PRIVATE_KEY" > /app/privatekey.pem

# Expose ports8443
EXPOSE 8443

# Start the application with pm2
CMD ["pm2-runtime", "start", "./bin/www", "--name", "simple_app", "--update-env"]
