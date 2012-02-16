toone = (x) ->
	console.log(x)
	if x == 1
		1
	else if x % 2 != 0
		toone(x * 3 + 1)
	else
		toone(x / 2)

toone(27)
