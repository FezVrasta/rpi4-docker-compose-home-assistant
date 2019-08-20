FROM node:12.8.1-alpine

# Build tools for node-gyp
RUN apk add --no-cache make gcc g++ python

# Used for light control, GPIO control, and HTTP scripts
RUN apk add redshift py-rpigpio curl

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

# User data directory, contains flows, config and nodes.
RUN mkdir /data

WORKDIR /usr/src/node-red

# Add node-red user so we aren't running as root.
RUN addgroup -S node-red && adduser -S -G node-red node-red \
    && chown -R node-red:node-red /data \
    && chown -R node-red:node-red /usr/src/node-red

USER node-red

# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red/
RUN npm install --no-optional

# User configuration directory volume
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows_home-assistant.json
ENV NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules

CMD ["npm", "start", "--", "--userDir", "/data"]