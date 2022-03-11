package hurdlerace

import "testing"

func TestHurdlaRace(t *testing.T) {
	tableTests := []struct {
		K              int32
		Height         []int32
		ExpectedResult int32
	}{}

	for i, tt := range tableTests {
		result := HurdleRace(tt.K, tt.Height)

		if tt.ExpectedResult != result {
			t.Errorf("#%d got: %d want: %d", i, tt.ExpectedResult, result)
		}
	}
}
