package main

import (
	"context"
	"log"
	"net"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/gorilla/mux"
)

func main() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	l, err := net.Listen("tcp", ":8080")

	if err != nil {
		log.Fatal(err)
	}

	r := mux.NewRouter()
	r.Handle("/", &SockMerchantHandler{}).Methods(http.MethodGet)

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

	s.Shutdown(ctx)

	log.Println("Server finished")
}

type SockMerchantHandler struct{}

func (s *SockMerchantHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("It works"))
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
