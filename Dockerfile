FROM node

MAINTAINER [Alejandro Baez](https://twitter.com/a_baez)

RUN apt-get update && apt-get install -y --no-install-recommends \
    mongodb-clients \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/bitpay/bitcore-wallet-service.git /bws
WORKDIR /bws

ADD add/config.js /bws/config.js

RUN npm install

EXPOSE 3232 3231 3380 443

CMD npm start && tail -f logs/bws.log
