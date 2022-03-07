package main

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"log"
	"net"
	"net/http"
	"os"
	"os/signal"
	"strconv"
	"syscall"
	"time"

	"github.com/flaviogf/hackerrank/pickingnumbers/internal/pickingnumbers"
	"github.com/gorilla/mux"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func main() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	l, err := net.Listen("tcp", "0.0.0.0:8080")

	if err != nil {
		log.Fatal(err)
	}

	r := mux.NewRouter()

	r.Handle("", pickingNumbersHandler())

	r.Handle("/metrics", promhttp.Handler())

	s := http.Server{
		Handler:           r,
		IdleTimeout:       5 * time.Second,
		ReadHeaderTimeout: 5 * time.Second,
	}

	doneCh := make(chan os.Signal, 1)

	signal.Notify(doneCh, syscall.SIGTERM, syscall.SIGINT)

	go func() {
		if err := s.Serve(l); err != nil {
			log.Println(err)
		}
	}()

	<-doneCh

	s.Shutdown(ctx)
}

func pickingNumbersHandler() http.Handler {
	pickingnumbersRequestsTotal := prometheus.NewCounter(prometheus.CounterOpts{
		Name: "pickingnumbers_handler_requests_total",
		Help: "Total number of requests",
	})

	prometheus.MustRegister(pickingnumbersRequestsTotal)

	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		pickingnumbersRequestsTotal.Inc()

		numbers, err := fetchNumbers(r.URL.Query()["numbers"])

		if err != nil {
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}

		result := pickingnumbers.PickingNumbers(numbers)

		enc := json.NewEncoder(w)

		body := struct {
			Data int32 `json:data`
		}{Data: result}

		enc.Encode(body)
	})
}

func fetchNumbers(numbersStr []string) ([]int32, error) {
	numbers := make([]int32, len(numbersStr))

	for i, v := range numbersStr {
		n, err := strconv.Atoi(v)

		if err != nil {
			return numbers, errors.New(fmt.Sprintf("Could not parse the value: %s", v))
		}

		numbers[i] = int32(n)
	}

	return numbers, nil
}
