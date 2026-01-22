# Use a small Node image
FROM node:18-alpine

# Create app dir
WORKDIR /usr/src/app

# Copy package.json and install deps (none required here)
COPY package.json ./
RUN npm install --production || true

# Copy app source
COPY app.js ./

# Expose runtime port and set start command
EXPOSE 3000
CMD ["node", "app.js"]
