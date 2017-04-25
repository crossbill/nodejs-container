FROM ubuntu:17.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN useradd -ms /bin/bash  crossbill

RUN apt-get -y install sudo && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    apt-get install -y nodejs && \
    apt-get install -y build-essential

ADD ./script/helloCrossbill.js /home/crossbill/helloCrossbill.js
EXPOSE  8081
CMD ["node", "/home/crossbill/helloCrossbill.js"]
