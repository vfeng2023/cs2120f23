def reverse(string):
	toret = ""
	for i in range(len(string)-1, -1, -1):
		toret += string[i]
	return toret


string = "abcde"
print(reverse(string))