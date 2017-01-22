# VERSION               0.3
#
# Build CoprHD-API
FROM victorock/coprhd-base:latest
MAINTAINER "Victor da Costa" <victorockeiro@gmail.com>
WORKDIR /hubot
RUN zypper --non-interactive --no-gpg-checks \
  install --details --no-recommends --force-resolution \
  nodejs npm npm
RUN npm install -g hubot coffee-script
RUN hubot --create hubot
RUN echo "[]" > hubot/hubot-scripts.json

RUN apt-get install -y git
RUN cd hubot && npm install hubot-irc --save && npm install

CMD[  "${STORAGEOS_DIR}/bin/apisvc${STORAGEOS_VARIANT}",
      "file:${STORAGEOS_DIR}/conf/api-conf.xml",
      "file:${STORAGEOS_DIR}/conf/api-emc-conf.xml",
      "file:${STORAGEOS_DIR}/conf/api-oss-conf.xml >${STORAGEOS_DIR}/logs/apisvc.out 2>&1"]

EXPOSE[ 8080:8080, 8443:8443 ]
