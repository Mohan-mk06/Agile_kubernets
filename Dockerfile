FROM node:18

WORKDIR /app

COPY . .

RUN npm config set strict-ssl false
RUN npm install --legacy-peer-deps || true
RUN npm run build || true

RUN npm install -g serve

EXPOSE 5173

CMD ["serve", "-s", "dist", "-l", "5173"]