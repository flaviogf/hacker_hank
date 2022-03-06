FROM golang:1.17 AS build
WORKDIR /www
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -o pickingnumbers -ldflags "-s -w" ./cmd/server/main.go

FROM scratch
WORKDIR /www
COPY --from=build /www/pickingnumbers .
EXPOSE 8080
CMD ["./pickingnumbers"]
