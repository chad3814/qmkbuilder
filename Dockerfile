FROM qmkfm/base_container

RUN apt-get update && apt-get install curl -y
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

COPY package.json yarn.lock /qmkbuilder/
COPY static /qmkbuilder/static/
COPY server /qmkbuilder/server/

WORKDIR /qmkbuilder
RUN yarn

CMD [ "node", "/qmkbuilder/server" ]