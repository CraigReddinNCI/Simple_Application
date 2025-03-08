# Use an official Node.js runtime as a parent image
FROM node:16
# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (for caching layers)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install
RUN ls
# Copy the entire application into the container
COPY . .

# Copy SSL certificates (if needed in the app)
COPY ./server.crt /app/server.crt
COPY ./privatekey.pem /app/privatekey.pem

# Expose the necessary ports
EXPOSE 8080 8443

# Start the application
CMD ["pm2-runtime", "start", "./bin/www", "--name", "simple_app"]
