FROM node:18-alpine
RUN mkdir -p /home/app
COPY . /home/app
WORKDIR /home/app
RUN rm -rf node_modules
RUN npm install
EXPOSE 3000
CMD ["node",  "app.js"]

