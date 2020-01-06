FROM node:10

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
RUN npm install nodemon

COPY . .

EXPOSE 8000


CMD ["npm", "start"]
