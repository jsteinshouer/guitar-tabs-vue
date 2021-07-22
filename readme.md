# My Guitar Tabs

A guitar tablature application with a Coldbox api and a Vue.js application for the front-end.

## Development

Use Docker Compose to run the development envrionment.

```
docker-compose up
```

### Production

Build the production docker container.

```
docker build -t my-tabs-app . --target prod
```

Test it out.

```
docker run -it -p 8080:8080 --rm --name my-tabs-app my-tabs-app
```
