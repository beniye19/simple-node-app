FROM node:16-slim

# Set working directory
WORKDIR /usr/src/app

# Copy dependency definitions
COPY package*.json ./

# Install only production dependencies reproducibly
RUN npm ci --only=production
