#!/usr/bin/python3


number = list(input("Enter the Number : "))
reversed(number)

for i in reversed(range(len(number))):
  print (int(str(number[-i-1])+str(0)*i))
