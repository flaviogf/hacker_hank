FROM golang:1.17 AS build
WORKDIR /www
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -o sales_by_match main.go

FROM scratch
WORKDIR /www
COPY --from=build /www/sales_by_match .
EXPOSE 8080
CMD ["./sales_by_match"]
