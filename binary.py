#!/usr/bin/python3
import math

number = int(input("Enter the number : "))
list = [ 0 ]
while(number>0):
  t = math.floor(number%2)
  list.insert(1,t)
  number= (number-t)/2

print( list )
#string = ''
#for i in reversed(list): 
#  string = string+str(i)
#
#print(string)

#n=int(input('please enter the no. in decimal format: '))
#x=n
#k=[]
#
#while (n>0):
#  a=int(float(n%2))
#  k.append(a)
#  n=(n-a)/2
#k.append(0)

#print( str(reversed(k)))

