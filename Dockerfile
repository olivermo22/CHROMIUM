FROM ghcr.io/puppeteer/puppeteer:22-jammy
WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome
ENV PUPPETEER_SKIP_DOWNLOAD=true

EXPOSE 3000
CMD ["node", "index.js"]
