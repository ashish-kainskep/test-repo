
FROM node:current-alpine3.18 as build

WORKDIR /usr/app

COPY . /usr/app

RUN npm i

RUN npm run build

FROM nginx:alpine3.18-slim

EXPOSE 80

COPY ./default.conf /etc/nginx/conf.d/default.conf

COPY --from=build /usr/app/build /usr/share/nginx/html