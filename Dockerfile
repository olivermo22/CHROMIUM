# Usa la imagen oficial de Puppeteer con Chrome ya instalado
FROM ghcr.io/puppeteer/puppeteer:latest

WORKDIR /app
COPY package*.json ./
# usa ci si tienes package-lock.json; si no, cambia a "npm install --omit=dev"
RUN npm ci --omit=dev || npm install --omit=dev

COPY . .
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome
ENV PUPPETEER_SKIP_DOWNLOAD=true

EXPOSE 3000
CMD ["node", "index.js"]
