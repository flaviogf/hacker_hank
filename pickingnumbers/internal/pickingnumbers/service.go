package pickingnumbers

import (
	"math"
	"sort"
)

func PickingNumbers(a []int32) int32 {
	sort.Slice(a, func(i, j int) bool { return a[i] < a[j] })

	sets := make([][]int32, len(a))

	for i, n := range a {
		for _, v := range a {
			diff := int32(math.Abs(float64(n) - float64(v)))

			if diff > 1 {
				continue
			}

			if len(sets[i]) != 0 {
				diff := int32(math.Abs(float64(sets[i][0]) - float64(v)))

				if diff > 1 {
					continue
				}
			}

			sets[i] = append(sets[i], v)
		}
	}

	var max int32

	for _, s := range sets {
		if int32(len(s)) > max {
			max = int32(len(s))
		}
	}

	return max
}
