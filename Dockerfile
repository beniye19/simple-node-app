# Stage 1: Builder (for running tests)
FROM node:16-slim as builder

# Set working directory
WORKDIR /usr/src/app

# Copy package definitions
COPY package*.json ./

# Install all dependencies (including dev) to run tests
RUN npm ci

# Copy the entire application source
COPY . .

# Run tests (this will fail the build if tests do not pass)
RUN npm test

# Stage 2: Production Image
FROM node:16-slim

# Set working directory
WORKDIR /usr/src/app

# Copy package definitions
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy application source from the builder stage
COPY --from=builder /usr/src/app . 

# Create a non-root user and group for enhanced security
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser
USER appuser

# Expose the application port
EXPOSE 3000

# Optional: Healthcheck to monitor container health
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s \
  CMD curl -f http://localhost:3000/ || exit 1

# Define the default command to run your app
CMD [ "node", "app.js" ]
