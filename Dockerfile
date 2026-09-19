FROM node:16-bullseye-slim

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force

COPY --chown=node:node . .

ENV NODE_ENV=production
ENV PORT=8080

EXPOSE 8080

USER node

CMD ["npm", "start"]
