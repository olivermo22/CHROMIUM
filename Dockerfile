FROM ghcr.io/puppeteer/puppeteer:latest

WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev || npm install --omit=dev

COPY . .
# ❌ No fijes PUPPETEER_EXECUTABLE_PATH a /usr/bin/google-chrome
# La imagen ya trae Chrome/Chromium instalado y lo resuelve sola.
ENV PUPPETEER_SKIP_DOWNLOAD=true

ENV PORT=3000
EXPOSE 3000
CMD ["node", "index.js"]
