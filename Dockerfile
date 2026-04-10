FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install --production --no-optional --no-audit
RUN sed -i 's/port: [0-9]*/port: 8081/g' src/config.ts || true
RUN sed -i 's/port: [0-9]*/port: 8081/g' dist/config.js || true
EXPOSE 8081
CMD ["node", "--max-old-space-size=160", "dist/index.js"]





