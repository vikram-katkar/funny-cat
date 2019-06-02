FROM node:8-alpine

EXPOSE 3000

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install && npm cache clean --force

COPY . .

CMD [ "npm", "start" ]
