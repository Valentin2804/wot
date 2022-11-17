FROM node:14.18.0 AS builder
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN yarn
COPY . .
RUN yarn build

FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html