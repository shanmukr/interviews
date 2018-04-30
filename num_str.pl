#!/usr/bin/python3 

dict = {0: "zero", 1:"one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine" }
dict1 = { 2: "twenty", 3: "thrirty", 4: "fourty", 5: "fivety", 6: "sixty", 7: "seventy", 8: "eighty", 9: "ninety" }

a = list(input("Enter the Number : "))

if len(a) == 1: print ( dict[int(a[0])] ) 
if len(a) == 2:
  word = dict1[int(a[0])]+" "+dict[int(a[1])]
  print (word)
if len(a) == 3:
  word = dict[int(a[0])]+" hundred "+dict1[int(a[1])]+" "+dict[int(a[2])]
  print (word)

