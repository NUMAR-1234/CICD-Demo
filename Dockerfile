FROM node:18-alpine
RUN mkdir -p /home/app
COPY . /home/app
WORKDIR /home/app
RUN rm -rf node_modules
RUN npm install
CMD ["node",  "app.js"]
EXPOSE 3000

