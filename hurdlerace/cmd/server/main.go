package main

import (
	"context"
	"encoding/json"
	"log"
	"net"
	"net/http"
	"os"
	"time"

	hurdlerace "github.com/flaviogf/hackerrank/hurdlerace/internal"
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

	r.Handle("/", NewHurdleRaceHandlerWithMetrics(NewHurdleRaceHandler())).Methods(http.MethodPost)
	r.Handle("/metrics", promhttp.Handler())

	s := http.Server{
		Handler:           r,
		IdleTimeout:       5 * time.Second,
		ReadHeaderTimeout: 5 * time.Second,
	}

	doneCh := make(chan os.Signal, 1)

	go func() {
		if err := s.Serve(l); err != nil {
			log.Println(err)
		}
	}()

	log.Println("Server listening on port 8080")

	<-doneCh

	s.Shutdown(ctx)
}

type HurdleRaceHandler struct{}

func NewHurdleRaceHandlerWithMetrics(next http.Handler) http.Handler {
	requests_total := prometheus.NewCounter(prometheus.CounterOpts{
		Name: "hurdle_race_handler_requests_total",
	})

	prometheus.MustRegister(requests_total)

	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		requests_total.Inc()
		next.ServeHTTP(w, r)
	})
}

func NewHurdleRaceHandler() http.Handler {
	return &HurdleRaceHandler{}
}

type HurdleRaceRequest struct {
	K      int32   `json:"k"`
	Height []int32 `json:"height"`
}

type HurdleRaceResponse struct {
	Data int32 `json:"data"`
}

func (hr *HurdleRaceHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	defer r.Body.Close()

	dec := json.NewDecoder(r.Body)
	var req HurdleRaceRequest
	dec.Decode(&req)

	data := hurdlerace.HurdleRace(req.K, req.Height)

	resp := HurdleRaceResponse{data}
	enc := json.NewEncoder(w)
	enc.Encode(resp)
}
