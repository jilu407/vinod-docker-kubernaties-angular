#stage 1
FROM node:latest AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod


#stage 2
FROM nginx:latest
COPY --from=build /app/dist/vinod-app/ /usr/share/nginx/html/