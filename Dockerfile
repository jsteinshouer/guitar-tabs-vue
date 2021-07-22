# base-api build
FROM openjdk:11.0.11-slim as base-api
# Update packages
RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /opt
RUN curl --location -o /opt/box https://s3.amazonaws.com/downloads.ortussolutions.com/ortussolutions/commandbox/5.2.1/box-light
RUN chmod -R a+rx /opt/box
RUN echo "commandbox_home=/opt/.CommandBox" > /opt/commandbox.properties
ENV APP_DIR /app
WORKDIR $APP_DIR
EXPOSE 8080

# dev stage
FROM node:14.17.3-alpine as dev-app
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY app/package*.json ./
RUN npm install
EXPOSE 3000
CMD ["npm", "run", "serve"]

# production build stage
FROM node:14.17.3-alpine as build-prod
WORKDIR /app
COPY ./app .
RUN npm install && npm run build

# dev-api stage
FROM base-api as dev-api
COPY api/box.json ./
RUN /opt/box install \
    && /opt/box server start cfengine=lucee@5.3.7 port=8080 saveSettings=false host=0.0.0.0 trayEnable=false openbrowser=false rewritesEnable=true console=true dryrun=true startScript=bash profile=development \
    && mv ./server-start.sh /opt/startup.sh \
    &&  chmod +x /opt/startup.sh \
    && /opt/box install lex:https://ext.lucee.org/org.h2-1.3.172.lex
CMD /opt/startup.sh

# production stage
FROM base-api as prod
COPY ./api ./
RUN /opt/box install --production \
    && /opt/box server start cfengine=lucee@5.3.7 port=8080 saveSettings=false host=0.0.0.0 trayEnable=false openbrowser=false rewritesEnable=true console=true dryrun=true startScript=bash profile=production \
    && mv ./server-start.sh /opt/startup.sh \
    &&  chmod +x /opt/startup.sh \
    && /opt/box install lex:https://ext.lucee.org/org.h2-1.3.172.lex
COPY --from=build-prod /app/dist/assets /app/assets
COPY --from=build-prod /app/dist/index.html /app/views/main/index.cfm
#RUN rm -Rf testbox && rm -Rf tests
CMD /opt/startup.sh