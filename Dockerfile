FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR . 


COPY . .

# install project dependencies
# RUN npm install

# build app for production with minification
# RUN npm run build

EXPOSE 8080
CMD [ "http-server", "." ]
