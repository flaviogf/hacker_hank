package hurdlerace

import "sort"

func HurdleRace(k int32, height []int32) int32 {
	sort.Slice(height, func(i, j int) bool { return height[i] < height[j] })

	max := height[len(height)-1]
	diff := int32(max - k)

	if diff > 0 {
		return diff
	}

	return 0
}
