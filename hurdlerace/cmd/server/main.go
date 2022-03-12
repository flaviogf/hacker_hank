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
)

func main() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	l, err := net.Listen("tcp", "0.0.0.0:8080")

	if err != nil {
		log.Fatal(err)
	}

	r := mux.NewRouter()

	r.Handle("/", &HurdleRaceHandler{}).Methods(http.MethodPost)

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
