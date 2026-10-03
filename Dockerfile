FROM node:22-alpine

# Remove package managers unused by this application.
RUN rm -rf /usr/local/lib/node_modules/npm \
           /usr/local/lib/node_modules/corepack \
           /opt/yarn* \
    && rm -f /usr/local/bin/npm \
             /usr/local/bin/npx \
             /usr/local/bin/corepack \
             /usr/local/bin/yarn \
             /usr/local/bin/yarnpkg \
             /usr/local/bin/pnpm \
             /usr/local/bin/pnpx

WORKDIR /app

COPY --chown=node:node server.js .

USER node

EXPOSE 3000

CMD ["node", "server.js"]
