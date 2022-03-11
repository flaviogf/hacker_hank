package hurdlerace

import "testing"

func TestHurdlaRace(t *testing.T) {
	tableTests := []struct {
		K              int32
		Height         []int32
		ExpectedResult int32
	}{
		{K: 4, Height: []int32{1, 6, 3, 5, 2}, ExpectedResult: 2},
	}

	for i, tt := range tableTests {
		result := HurdleRace(tt.K, tt.Height)

		if tt.ExpectedResult != result {
			t.Errorf("#%d got: %d want: %d", i, tt.ExpectedResult, result)
		}
	}
}
