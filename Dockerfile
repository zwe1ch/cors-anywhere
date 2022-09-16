FROM node:18-alpine

ARG HOST
ARG ORIGIN_BLACKLIST
ARG ORIGIN_WHITELIST
ARG PORT
ARG REMOVE_HEADERS
ARG REQUIRE_HEADER

ENV HOST=$HOST
ENV ORIGIN_BLACKLIST=$ORIGIN_BLACKLIST
ENV ORIGIN_WHITELIST=$ORIGIN_WHITELIST
ENV PORT=$PORT
ENV REMOVE_HEADERS=$REMOVE_HEADERS
ENV REQUIRE_HEADER=$REQUIRE_HEADER

WORKDIR /app

COPY src ./src
COPY package.json .
COPY yarn.lock .

RUN yarn

CMD ["node", "src"]