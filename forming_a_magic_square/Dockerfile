FROM golang:1.17 AS build
WORKDIR /www
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o forming_a_magic_square cmd/server.go

FROM scratch
WORKDIR /www
COPY --from=build /www/forming_a_magic_square .
CMD ["./forming_a_magic_square"]
