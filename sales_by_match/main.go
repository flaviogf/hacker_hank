package main

import (
	"context"
	"fmt"
	"log"
	"net"
	"net/http"
	"os"
	"os/signal"
	"strconv"
	"strings"
	"syscall"
	"time"

	"github.com/gorilla/mux"
	"go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
	"go.opentelemetry.io/otel"
	stdout "go.opentelemetry.io/otel/exporters/stdout/stdouttrace"
	"go.opentelemetry.io/otel/propagation"
	"go.opentelemetry.io/otel/sdk/resource"
	sdktrace "go.opentelemetry.io/otel/sdk/trace"
	semconv "go.opentelemetry.io/otel/semconv/v1.4.0"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func main() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	tp := initTracer()

	l, err := net.Listen("tcp", ":8080")

	if err != nil {
		log.Fatal(err)
	}

	r := mux.NewRouter()

	r.Handle("/", NewSockMerchantHandler()).Methods(http.MethodGet)
	r.Handle("/metrics", promhttp.Handler())

	s := http.Server{
		Handler:           r,
		IdleTimeout:       5 * time.Second,
		ReadHeaderTimeout: 5 * time.Second,
	}

	go func() {
		if err := s.Serve(l); err != nil {
			log.Println(err)
		}
	}()

	signalCh := make(chan os.Signal, 1)
	signal.Notify(signalCh, syscall.SIGTERM, syscall.SIGINT)
	<-signalCh

	tp.Shutdown(ctx)
	s.Shutdown(ctx)

	log.Println("Server finished")
}

func initTracer() *sdktrace.TracerProvider {
	exporter, err := stdout.New(stdout.WithPrettyPrint())

	if err != nil {
		log.Fatal(err)
	}

	tp := sdktrace.NewTracerProvider(
		sdktrace.WithBatcher(exporter),
		sdktrace.WithResource(
			resource.NewWithAttributes(
				semconv.SchemaURL,
				semconv.ServiceNameKey.String("sock-merchant"),
			),
		),
	)

	otel.SetTracerProvider(tp)

	otel.SetTextMapPropagator(
		propagation.NewCompositeTextMapPropagator(propagation.TraceContext{}, propagation.Baggage{}),
	)

	return tp
}

type SockMerchantHandler struct{}

func NewSockMerchantHandler() http.Handler {
	counter := prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "api_requests_total",
			Help: "A counter for requests to the server",
		},
		[]string{"code", "method"},
	)

	sockMerchantHandler := otelhttp.NewHandler(
		promhttp.InstrumentHandlerCounter(
			counter,
			&SockMerchantHandler{},
		),
		"sock-merchant",
	)

	return sockMerchantHandler
}

func (s *SockMerchantHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	ar := []int32{}

	for _, v := range strings.Split(r.FormValue("ar"), ",") {
		value, err := strconv.ParseInt(v, 0, 32)

		if err != nil {
			http.Error(w, "Could not parse the value", http.StatusBadRequest)
			return
		}

		ar = append(ar, int32(value))
	}

	fmt.Fprintf(w, "%d", SockMerchant(0, ar))
}

func SockMerchant(_ int32, ar []int32) int32 {
	counter := map[int32]int32{}

	for _, v := range ar {
		counter[v] += 1
	}

	var result int32

	for _, v := range counter {
		result += v / 2
	}

	return result
}
