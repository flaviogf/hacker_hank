package main

import "testing"

func TestSockMerchant(t *testing.T) {
	testCases := []struct {
		N              int32
		Ar             []int32
		ExpectedResult int32
	}{}

	for i, testCase := range testCases {
		got := SockMerchant(testCase.N, testCase.Ar)

		if got != testCase.ExpectedResult {
			t.Errorf("#%d got: %d, want: %d", i+1, got, testCase.ExpectedResult)
		}
	}
}
