FROM node:current-buster-slim

ENV DISPLAY :99.0

WORKDIR /app
RUN useradd prerender
RUN adduser prerender prerender
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ca-certificates chromium chromium-l10n

COPY ./ /app/
RUN yarn install
USER prerender

EXPOSE 3000

CMD [ "node", "server.js" ]
