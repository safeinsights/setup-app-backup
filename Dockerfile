FROM node:20

WORKDIR /code

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

CMD ["npx", "tsx", "src/lib/poll.ts"]
