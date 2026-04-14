#base image
FROM node:12.2.0-alpine

#working dir
WORKDIR /app

#copy data from local to cont
COPY . .

#install dependencies
RUN npm install 

# test dependecnies
RUN npm run test

#ports
EXPOSE 8000

#cmd to run app
CMD ["node","app.js"]
