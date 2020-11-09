FROM klakegg/hugo as build

WORKDIR /app

COPY . .

RUN hugo -D


FROM nginx:latest

EXPOSE 80


COPY --from=build /app/public /usr/share/nginx/html