FROM node:19.7.0-alpine

ENV NODE_ENV=production

# Create and set permissions for the directory as root
RUN mkdir /labone && chown -R node:node /labone

WORKDIR /labone

# Switch to the node user
USER node

# Copy project files and set permissions
COPY --chown=node:node . .

# Install dependencies
RUN npm install

EXPOSE 3000

CMD ["node", "src/index.js"]
