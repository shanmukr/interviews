import re

dict = {}
list = []

for i in open("ss.pl", "r").readlines():
  for j in i.split(" "):
    dict[j] = [dict.keys()].count(j)
print(dict)
#lines.close()
#print ("test\n")