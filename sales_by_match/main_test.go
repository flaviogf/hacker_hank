package main

import "testing"

func TestSockMerchant(t *testing.T) {
	testCases := []struct {
		N              int32
		Ar             []int32
		ExpectedResult int32
	}{
		{
			N:              9,
			Ar:             []int32{10, 20, 20, 10, 10, 30, 50, 10, 20},
			ExpectedResult: 3,
		},
	}

	for i, testCase := range testCases {
		got := SockMerchant(testCase.N, testCase.Ar)

		if got != testCase.ExpectedResult {
			t.Errorf("#%d got: %d, want: %d", i+1, got, testCase.ExpectedResult)
		}
	}
}
