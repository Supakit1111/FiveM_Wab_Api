FROM oven/bun:1

WORKDIR /app

# Copy package files
COPY package.json bun.lock ./
COPY prisma ./prisma/

# Install dependencies
RUN bun install --frozen-lockfile

# Generate Prisma Client
RUN bunx prisma generate

# Copy source code
COPY . .

# Expose port
EXPOSE 3000

# Start command
CMD ["bun", "start"]
