package hurdlerace

import "testing"

func TestHurdlaRace(t *testing.T) {
	tableTests := []struct {
		K              int32
		Height         []int32
		ExpectedResult int32
	}{
		{K: 4, Height: []int32{1, 6, 3, 5, 2}, ExpectedResult: 2},
		{K: 7, Height: []int32{2, 5, 4, 5, 2}, ExpectedResult: 0},
	}

	for i, tt := range tableTests {
		result := HurdleRace(tt.K, tt.Height)

		if tt.ExpectedResult != result {
			t.Errorf("#%d want: %d got: %d", i, tt.ExpectedResult, result)
		}
	}
}
