package main

import (
	"context"
	"log"
	"net"
	"net/http"
	"os"
	"time"

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
