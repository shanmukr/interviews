import re

c = 0
d = 0
e = 0

lines = open("a.txt", "r")
for i in lines.readlines():
  d += 1
  if( re.search(r'EMP2017', i)):
    c = -1
    e = d
  if( re.search(r'RRD2017', i)):
    c += 1
  if( c == 1 ):
    print (e , " : ", d)
lines.close()