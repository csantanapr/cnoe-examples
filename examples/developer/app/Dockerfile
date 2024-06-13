FROM cgr.dev/chainguard/node
ENV NODE_ENV=production

WORKDIR /app

COPY --chown=node:node ["package.json", "package-lock.json", "index.js", "server.js", "./"]

RUN npm install --omit-dev

CMD [ "index.js" ]

