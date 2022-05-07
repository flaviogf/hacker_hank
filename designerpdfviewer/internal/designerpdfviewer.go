package designerpdfviewer

func Execute(h []int32, word string) int32 {
	dictionary := map[rune]int32{
		'a': 0,
		'b': 1,
		'c': 2,
		'd': 3,
		'e': 4,
		'f': 5,
		'g': 6,
		'h': 7,
		'i': 8,
		'j': 9,
		'k': 10,
		'l': 11,
		'm': 12,
		'n': 13,
		'o': 14,
		'p': 15,
		'q': 16,
		'r': 17,
		's': 18,
		't': 19,
		'u': 20,
		'v': 21,
		'x': 22,
		'w': 23,
		'y': 24,
		'z': 25,
	}

	var max int32

	for _, letter := range word {
		index := dictionary[letter]

		if max < h[index] {
			max = h[index]
		}
	}

	return max * int32(len(word))
}
