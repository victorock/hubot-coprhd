# VERSION               0.1
#
# Build Hubot-CoprHD
FROM victorock/coprhd-base:latest
MAINTAINER "Victor da Costa" <victorockeiro@gmail.com>

ENV HUBOT_SLACK_TOKEN ""
ENV HUBOT_COPRHD_DEV ""
ENV HUBOT_COPRHD_ROLE "STORAGE"

WORKDIR /hubot
RUN useradd -s /bin/bash -M -d /hubot -U hubot && \
  chown -R hubot:hubot /hubot

RUN zypper --non-interactive \
  --no-gpg-checks \
  install \
  --details \
  --no-recommends \
  --force-resolution \
  nodejs

RUN npm install \
  -g \
  npm \
  yo \
  coffee-script \
  hubot \
  generator-hubot \
  hubot-slack \
  hubot-coprhd \
  hubot-redis-brain \
  hubot-help \
  hubot-auth \
  hubot-scripts

USER hubot
RUN yo hubot \
  --owner="Victor da Costa <victorockeiro@gmail.com>" \
  --name="storage" \
  --description="ViPR Controller" \
  --adapter=slack \
  --defaults

RUN echo "[ \
  hubot-diagnostics, \
  hubot-help, \
  hubot-redis-brain, \
  hubot-coprhd, \
  hubot-auth \
]" > external-scripts.json

CMD [ "/hubot/bin/hubot", "--adapter slack" ]
