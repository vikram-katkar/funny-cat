FROM node:8-alpine

ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT 9229 9230

RUN apk add --update tini && npm i npm@latest -g && mkdir -p /src/app
WORKDIR /src/app

COPY package.json package-lock.json* ./
RUN npm install --no-optional && npm cache clean --force

WORKDIR /src/app
COPY . .

CMD [ "/sbin/tini", "--", "node", "./bin/www" ]
