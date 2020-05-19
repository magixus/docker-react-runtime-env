### STAGE 1: Build ###
FROM node:lts-alpine AS build
WORKDIR /usr/src/app/
COPY package*.json ./
RUN yarn --silent
COPY . ./
RUN GENERATE_SOURCEMAP=false yarn build

### STAGE 2: Run ###
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /usr/src/app/build/ /usr/share/nginx/html
EXPOSE 80
WORKDIR /usr/share/nginx/html
COPY run.sh ./
RUN apk add --no-cache bash
RUN chmod +x run.sh
CMD ["/bin/bash", "-c", "env && /usr/share/nginx/html/run.sh && nginx -g \"daemon off;\""]
