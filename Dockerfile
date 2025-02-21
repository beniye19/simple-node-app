FROM node:16-slim

# Set working directory
WORKDIR /usr/src/app

# Copy dependency definitions
COPY package*.json ./

# Install only production dependencies reproducibly
RUN npm ci --only=production

# Bundle app source
COPY . .

# Create a non-root user and group
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser
USER appuser

EXPOSE 3000

# Optional: Add a healthcheck to monitor container health
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s \
  CMD curl -f http://localhost:3000/ || exit 1

CMD [ "node", "app.js" ]