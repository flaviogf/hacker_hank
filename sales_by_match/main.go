package main

import "fmt"

func main() {
	fmt.Println("It works")
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
