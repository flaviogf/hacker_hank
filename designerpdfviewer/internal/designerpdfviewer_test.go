package designerpdfviewer

import "testing"

func TestExecute(t *testing.T) {
	tableTests := []struct {
		H              []int32
		Word           string
		ExpectedResult int32
	}{
		{[]int32{1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5}, "abc", 9},
		{[]int32{1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7}, "zaba", 28},
	}

	for _, tableTest := range tableTests {
		res := Execute(tableTest.H, tableTest.Word)

		if res != tableTest.ExpectedResult {
			t.Errorf("got: %d want: %d\n", res, tableTest.ExpectedResult)
		}
	}
}
