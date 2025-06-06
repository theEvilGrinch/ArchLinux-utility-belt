# syntax=docker/dockerfile:1

FROM node:lts-alpine3.22
# FROM golang:tip-alpine3.22

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

CMD ["npm", "run", "dev"]
