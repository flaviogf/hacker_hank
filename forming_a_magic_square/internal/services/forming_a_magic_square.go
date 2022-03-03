package services

import "math"

const MAGIC_NUMBER = 15

func FormingMagicSquare(s [][]int32) int32 {
	var totalCost int32
	usedNumbers := make(map[int32]bool)

	for _, row := range s {
		for i, value := range row {
			var rowSum int32

			for _, j := range row {
				rowSum += j
			}

			if rowSum == MAGIC_NUMBER {
				for _, j := range row {
					usedNumbers[j] = true
				}

				continue
			}

			incr := MAGIC_NUMBER - rowSum
			next := value + incr

			if usedNumbers[next] {
				continue
			}

			cost := int32(math.Abs(float64(value) - float64(next)))
			totalCost += cost
			row[i] = next
		}
	}

	return totalCost
}
