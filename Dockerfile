FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

COPY .npmrc .

RUN npm install

COPY . .

RUN npm run build
# React build will create a built folder in path: /app/build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
