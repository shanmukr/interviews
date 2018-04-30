
#appdriver.pl /bcs/lgnp/clientapp/gnwcomp/parm/gnwcomp.xml reprint_process reprint=LGNP.FIN.GNW1001.COMP.R0001000.MISSRDV2 lvl=p lvlc=p lvls=p
list = range(15)

for i in list:
  if i%3 ==0 and i %5 == 0:
    print("fizzBuzz")
    continue
  elif i%3 == 0:
    print("fizz")
    continue
  elif i%5 == 0:
    print("Buzz")
    continue
  print(i)

"""
list = [ 1, 2, 3, 0, 4, 5, 1, 2, 3, 4, 5 ]

def cutting(list):
  lent = len(list)
  while(lent >= 0 ):
    min = list[0]
    ind = 0
    for i in list:
      if i == 0:
        del list[ind]
      if min >= i:
        min = i
      ind +=1
    ind1 = 0
    temp = []
    for j in list:
      temp.insert(ind1, j-min)
    print(min, " : ", temp)
    list = temp
    lent = len(list)

cutting(list)

"""