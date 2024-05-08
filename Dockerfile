FROM node:18-alpine3.17 as build-step
RUN apk add --update --no-cache \
      autoconf \
      libtool \
      automake \
      nasm \
      gcc \
      make \
      g++ \
      zlib-dev \
      tzdata \
      build-base
WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install
COPY . .
RUN npm run build


FROM nginx:1.18.0-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-step /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
