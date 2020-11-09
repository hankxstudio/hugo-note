---
title: "Docker Multiple State Build"
date: 2020-11-05T16:10:13+08:00
draft: true
---

## Tody I tried Docker multiple states build.

It's very fun. I like it.

### This is how it works

The first try was failed. with just Dockerfile below:
```Dockerfile
FROM klakegg/hugo
WORKDIR /app
COPY . .
RUN hugo -D

FROM nginx:latest
EXPOSE 80
COPY /app/public /usr/share/nginx/html
```

From the log I can see once the first stage of build - hugo build, the container got removed as soon as the build finished.

> Removing intermediate container cd1542fc3a34


After some search, I found that I can easily use [multiple stage builds](https://docs.docker.com/develop/develop-images/multistage-build/) by giving every stage a name.

so the Dockerfile becomes this:
```Dockerfile
FROM klakegg/hugo as hugo
WORKDIR /app
COPY . .
RUN hugo -D

FROM nginx:latest
EXPOSE 80
COPY --from=hugo /app/public /usr/share/nginx/html
```

Then everything just works. So it's really just give the first stage a name, then in the second stage, the nginx stage, 
define the source directory with a prefix `--from`, that's copy files from the stage with given name.

woohoo.

Next step: use Docker compose



