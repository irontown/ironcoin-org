FROM node:8.9-alpine

MAINTAINER Aaron Krieshok <aaron@ironfoundation.org>

RUN npm config set package-lock false

WORKDIR /usr/src/app

COPY package.json .

RUN apk add --no-cache --virtual \
    .gyp \
    python \
    make \
    g++ \
    git \
    bash \
  && npm install

ENV HOST 0.0.0.0

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]
