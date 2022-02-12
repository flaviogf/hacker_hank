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
