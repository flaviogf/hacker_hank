package services

import (
	"testing"
)

func TestFormingMagicSquare(t *testing.T) {
	tableTests := []struct {
		Input          [][]int32
		ExpectedResult int32
	}{
		{
			Input: [][]int32{
				[]int32{4, 9, 2},
				[]int32{3, 5, 7},
				[]int32{8, 1, 5},
			},
			ExpectedResult: 1,
		},
	}

	for i, tt := range tableTests {
		result := FormingMagicSquare(tt.Input)

		if tt.ExpectedResult != result {
			t.Errorf("#%d got: %d want: %d\n", i, result, tt.ExpectedResult)
		}
	}
}
