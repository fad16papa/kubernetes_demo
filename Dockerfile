#Use a small base image
FROM node:18-alpine AS base
WORKDIR /app

#Install dependencies separately far caching
COPY package.json package-lock.json* ./
RUN npm ci --omit=dev

#COpy app souirce
COPY . .

#Run as non-root (alpine node image include user 'node')
USER node
EXPOSE 3000
ENV NODE_ENV=production
CMD ["npm", "start"]