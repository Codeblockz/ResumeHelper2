# Multi-stage build for Next.js frontend

# Base stage with Node.js
FROM node:18-alpine AS base
WORKDIR /app

# Install dependencies only when needed
FROM base AS deps
# Copy package files
COPY package*.json ./
# Install dependencies
RUN npm ci --only=production

# Development stage
FROM base AS development
# Install all dependencies (including devDependencies)
COPY package*.json ./
RUN npm ci

# Copy source code
COPY . .

EXPOSE 3000
ENV NODE_ENV=development
CMD ["npm", "run", "dev"]

# Build stage for production
FROM base AS builder
COPY package*.json ./
RUN npm ci

COPY . .

# Build the application
ENV NODE_ENV=production
RUN npm run build

# Production stage
FROM base AS production
ENV NODE_ENV=production

# Create non-root user
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# Copy built application
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static
COPY --from=builder --chown=nextjs:nodejs /app/public ./public

USER nextjs

EXPOSE 3000

ENV PORT=3000
ENV HOSTNAME="0.0.0.0"

CMD ["node", "server.js"]