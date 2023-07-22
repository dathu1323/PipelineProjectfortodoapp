FROM node:14-alpine
WORKDIR /app
COPY todoapp/ .
RUN npm install
CMD ["npm", "start"]
