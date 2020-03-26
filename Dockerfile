FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 
# the results of this build are stored to /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# the default command is start nginx for us