FROM node:24-slim
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD curl --fail http://localhost:3000/ || exit 1

CMD ["node", "app.js"]
