FROM golang:1.17 AS build
WORKDIR /www
COPY . ./
RUN CGO_ENABLED=false GOOS=linux go build -o sales_by_match main.go

FROM scratch
WORKDIR /www
COPY --from=build /www/sales_by_match .
CMD ["./sales_by_match"]
