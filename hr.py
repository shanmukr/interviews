a = "abced"
b = "efgab"

dict = {}
j = 1
list = list(a)+list(b)

for i in list:
  if i not in dict.keys():
    dict[i] = j
  else:
    j = dict[i] + 1
    dict[i] = j

c = 0
for i,j in dict.items():
  if j == 1:
    c += 1

print(c)

"""
a = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 145, 4, 8 ]

b = 8

while True:
  if a[-1] == b:
    a = ' '.join(str(i) for i in a)
    print (a, " : matched\n")
    break
  else:
    a.append(a.pop(0))
	
"""