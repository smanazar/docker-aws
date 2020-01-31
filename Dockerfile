FROM node:alpine as main
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=main  /app/build /usr/share/nginx/html

access_key_id: "$AWS_ACCESS_KEY"
secret_access_key:
       secure: "$AWS_SECRET_KEY"