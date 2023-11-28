FROM node:14-alpine

WORKDIR /gumcol_site

COPY site-config.js .
COPY site/page32002363.html ./site
COPY package.json .

RUN npm install

CMD ["npm", "start"]

EXPOSE 80
