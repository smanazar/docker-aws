FROM node:alpine as main
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx
COPY --from=main  /app/build /usr/share/nginx/html

