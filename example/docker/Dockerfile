# VERSION               0.1
#
# Build Hubot-CoprHD
FROM victorock/coprhd-base:latest
MAINTAINER "Victor da Costa" <victorockeiro@gmail.com>

ENV HUBOT_SLACK_TOKEN ""
ENV HUBOT_COPRHD_DEV ""
ENV HUBOT_COPRHD_ROLE "COPRHD"

WORKDIR /hubot

RUN zypper --non-interactive \
  --no-gpg-checks \
  install \
  --details \
  --no-recommends \
  --force-resolution \
  nodejs

RUN npm install \
  -g \
  yo \
  coffee-script \
  hubot \
  hubot-slack \
  hubot-coprhd \
  hubot-redis-brain \
  hubot-help \
  hubot-auth \
  hubot-scripts

RUN echo "[
  hubot-diagnostics, \
  hubot-help, \
  hubot-redis-brain, \
  hubot-coprhd \
]" > external-scripts.json

CMD[ "bin/hubot --adapter slack" ]
