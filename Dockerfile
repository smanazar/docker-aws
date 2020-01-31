FROM node:alpine as main
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx
EXPOSE 8080
COPY --from=main  /app/build /usr/share/nginx/html

