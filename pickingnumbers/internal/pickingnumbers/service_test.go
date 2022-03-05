package pickingnumbers

import "testing"

func TestPickingNumbers(t *testing.T) {
	testTable := []struct {
		Input          []int32
		ExpectedResult int32
	}{
		{Input: []int32{4, 6, 5, 3, 3, 1}, ExpectedResult: 3},
		{Input: []int32{1, 2, 2, 3, 1, 2}, ExpectedResult: 5},
	}

	for i, tt := range testTable {
		result := PickingNumbers(tt.Input)

		if tt.ExpectedResult != result {
			t.Errorf("#%d want: %d, got: %d\n", i, tt.ExpectedResult, result)
		}
	}
}
