#!/usr/bin/python3





"""
tmp = []
a = [ 10, 'a', 'z', 8, 2, 'o', 'c', 'f', 7, 'e', 9, 1, 'f', 12, 1 ]

#for i in a:
#  if type(i) == int:
#    tmp.append(i)   
#
#tmp = sorted(tmp)

tmp = sorted(list(filter(lambda x: type(x) == int, a)))
c = 0
d = c
for j in range(len(a)):
  if type(a[j]) == int:
    a[c] = tmp[d]
    d += 1
  c += 1
print(a)

"""

"""
c = 0
d = 0
for j in range(len(a)):
  if type(a[j]) == int:
    print(c, d)
    a[c] = tmp[d]
    d += 1
  c += 1
print(a)


"""
"""

def count(S, m, n):

    table = [[0 for x in range(m)] for x in range(n+1)]
 

    for i in range(m):
        table[0][i] = 1
 

    for i in range(1, n+1):
        for j in range(m):
 

            x = table[i - S[j]][j] if i-S[j] >= 0 else 0
 

            y = table[i][j-1] if j >= 1 else 0
 

            table[i][j] = x + y
 
    return table[n][m-1]
 

arr = [1, 2, 3]
m = len(arr)
n = 4
print(count(arr, m, n))
"""
"""
a = 1%2
print(a)
"""
"""
a = list(range(1, 4))

print(a)
#for i in range(1,a):
#  print(i)
"""

"""
a = [ [ 11, 2, 4 ], [ 4, 5, 6 ], [ 10, 8, -12 ] ]
b = len(a) - 1

c, d = 0,0
for i in range(len(a)):
  c += a[i][i]
  d += a[i][b]
  b -= 1

if(c <= d ):
  print(d-c)
else:
  print(c-d)
"""
"""
a = "noon"
dict = {}
for i in list(set(list(a))):
  dict[i] = a.count(i)
c = 0
for j in dict.keys():
  if(dict[j] > 1 ):
    c += dict[j]

if(len(a) == c + 1 or len(a) == c ):
  print( "valid" )
else:
  print( "Not valid\n")

"""

"""
from math import floor as t

#z = [ 1, 2, 3, 4, 5, 6, 6, 7, 8, 8 ]
#print( z[2:4])
a = 12311434
a = list(str(a))
c  = 1
for i in a:
  if(a[c-1:c] == a[c:c+1]):
    print("not valid")
  else:
    print(a[c-1:c]," : ", a[c:c+1])
  print(c)
  c += 1

"""
"""
a = 111123123434
a = list(str(a))
d  = 1
while(d <= t(len(a)/2)):
  c  = d
  for i in a:
    if(a[c-d:c] == a[c:c+d]):
      print(a[c-d:c]," : ", a[c:c+d])
    c += 1
  d += 1
"""

"""
#a = [ 1, 2, 3, 4, 5, 6, 6, 7, 8, 8 ]
a = ['abc', 'a', 'ab', 'abcdf']
#c = max(a)
c = max(filter(lambda x: len(x), a))
print(c)
"""
"""
c = 0

c = [ c for i in a if (i <= c) ]
print(c)
"""
"""
a = [ 1, 2, 3, 4, 5, 6, 6, 7, 8, 8 ]
c = 0

for i in a:
  if( i >= c):
    c = i
	
print(c)
"""
"""
f = list(set([ 1, 2, 3, 4, 5, 6, 6, 7, 8, 8, 1, 5, 4, 0, -7 ]))
g = sorted(set([ 1, 2, 3, 4, 5, 6, 6, 7, 8, 8, 1, 5, 4, 0, -7 ]))
print(g, g[-2])
"""
"""
c = a[0]
d = c

for i in a:
  if(i > d):
    if not d == c:
      d = c
    c = i
	
print(c, d, f)

"""
"""
l = map(lambda x: x+1, a)

print(type(l))
"""
"""
def t(a):
  yield a + 1
list = []
list.append(t(2))
list.append(t(3))
for i in list[0]:
  print ( i )
"""
"""
a = range(10)
b = xrange(0, 10)

for i in a:
  print(i)
"""
"""
a = [ 1, 2, 3, 4, 5, 6 ]
b = a[1::2]
print(b)
"""

"""
def test(x, a=[]):
  a.append(x)
  return a

print (test(2))
print (test(3))
"""
"""
a = input()
if( a == reversed(a)):
  print("pal\n")
else:
  print("not pal\n")
"""
"""
a = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
i = input("Enter the number : ")
if(i.isdigit()):
  i = int(i)
  min = 0
  max = len(a)
  while min < max:
    x = min+(max-min)//2
    if(a[x] == i):
      print(x, " : ", a[x])
      break
    elif(a[x]>i):
     max = x
    elif(a[x]<i):
      if min == x:
        break
      min = x
elif(i.isalpha()):
  print("alpha\n")

"""


"""
from math import floor

a = int(input("f"))
list = [0]
while(a>0):
  t = floor(a%2)
  list.insert(1,t)
  a = (a-t)/2

print(list)
"""


"""
import sys

a = sys.modules.values()
print(a)
"""

"""
from math import floor

a = input("Enter the number : ")
if(a.isdigit()):
  a = int(a)
  list = [ 0 ]
  while(a > 0):
    t = floor(a%2)
    list.insert(1, t)
    a = (a - t)/2
  print(list)
else:
  print("Enter the number only\n")
"""
"""
d = {1: "one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine", 0: "zero"}
d1 = {2: "twenty", 3: "thirty", 4: "fourty", 5: "fifty", 6: "sixty", 7: "seventy", 8: "eighty", 9: "ninty" }
i = input("Enter the number : ")

if( len(i) == 1):
  print(d[int(i)])
elif(len(i) == 2):
  print(d1[int(i[0])], d[int(i[1])])
elif(len(i) == 3):

  print(d[int(i[0])],"Hundred and",d1[int(i[1])], d[int(i[2])])
"""

"""
a = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ]
c = 0
d = 2

while(c < len(a)):
  print(a[c])
  c += d
  d += 1
"""


"""
a = "xyzxysjbfv"
d = {}
for i in a:
  d[i] = a.count(i)
  
print(d)
"""
"""
list = [ [1,2,3], [4,5,6],[7,8,9] ]
tmp = zip([1,2,3], [4,5,6],[7,8,9])#list[::-1]
for i in tmp:
  print(i)

  
#tmp = [[1,4,7], [2,5,8],[3,6,9]]
tmp = []

for i in range(len(list)):
  tmp.append([list[j][i] for j in range(len(list))])
  #tp = []
  #for j in range(len(list)):
  #  tp.append(list[j][i])
  #tmp.append(tp)

print( tmp )
#for i in range(len(list)):
#   tmp.append([list[j][i] for j in range(len(list))])
#print( tmp )
"""
"""
l = [ 2, 3, 6, 6, 5 ]
a = l[0]
b = a

c = l[0]
d = c

for i in l:
  if( i >= d ):
    if( i >= c ):
      d = c
      c = i
    elif(d < i):
      print("test")
      d = i
print(c, d)
"""
"""
for i in l:
  if( i >= b ):
    if( i >= a ):
      b = a
      a = i
    else:
      b = i
    
print(b)
"""
"""
list = [ [1,2,3], [4,5,6],[7,8,9] ]
tmp = zip([1,2,3], [4,5,6],[7,8,9])#list[::-1]
for i in tmp:
  print(i)

  
#tmp = [[1,4,7], [2,5,8],[3,6,9]]
tmp = []

for i in range(len(list)):
  tp = []
  for j in range(len(list)):
    tp.append(list[j][i])
  tmp.append(tp)

print( tmp )
"""

"""
a = [ 1, 2, 3, 4, 5, 9, 8, 7, 6, 7, 4, 5, 4 ]
c = a[0]
d = c

for i in a:
  if( i >= d ):
    if( i >= c ):
      d = c
      c = i
    else:
      d = i
print(c, d)
"""
"""
for x in a:
  if x >= m2:
    if x > m:
      m2, m = m, x
    else:
      m2 = x

print(m, m2)
"""
"""
i = [ 0, 3, 4, 2 ]
if( i[1] * 4 + i[0] == i[3] * 4 + i[2]):
  print("YES")
else:
  print("NO")
"""
"""
list = [ [1,2,3], [4,5,6],[7,8,9] ]

#tmp = [[1,4,7], [2,5,8],[3,6,9]]
tmp = []

for i in range(len(list)):
  tp = []
  for j in range(len(list)):
    tp.append(list[j][i])
  tmp.append(tp)

print( tmp )
"""
"""
tmp = {}

for i in list:
  if list.count(i) > 1:
    tmp[i] = list.count(i)

for j in tmp.values():
  print (j)
"""
"""
a = 5
c = 0
t = 0
while( c <= a - 1):
  a -= 1
  t += 1
  print(' ' * a, '#' * t)
"""
"""
list = [0, 1, 4, 5, -1, -2, -3]
l = len(list)
l1 = []
l2 = []
l3 = []

for i in list:
  if( i > 0 ):
    l1.append(i)
  elif( i < 0):
    l2.append(i)
  else:
    l3.append(i)

t1 = len(l1)/l
t2 = len(l2)/l
t3 = len(l3)/l

print(t1, t2,t3)

"""

"""
list = [0, 1, 4, 5]
list1 = [2, 3, 6, 7]
#d = {}
d = zip(list, list1)#dict(zip(list, list1))#, [list1])
print(d)
"""
"""
a = input("Enter the number : ")
if a.isdigit():
  for i in range(int(a) - 1):
    list.append(list[-1]+list[-2])
  print (list[-1])
else:
  print ("Enter the digits only\n")
"""
