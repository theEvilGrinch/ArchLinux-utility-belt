FROM node:lts-alpine3.22
# FROM golang:tip-alpine3.22

# RUN npm install nodemon

WORKDIR /app

COPY package.json .

RUN npm install
#RUN npm ci --only=production

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
# CMD ["npm", "start"]
