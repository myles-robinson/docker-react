FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# /app/build <---- important stuff

FROM nginx
# copy something from another phase
COPY --from=builder /app/build /usr/share/nginx/html
# default command of nginx is "start"