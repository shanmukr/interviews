#!/usr/bin/python3
import math

numbers = list(range(10))
numbers = numbers+list((range(20, 45)))
numbers = numbers+list((range(200, 450)))
numbers = numbers+list((range(2000, 4501)))

def binary_search(array, target):
    lower = 0
    upper = len(array)
    while lower < upper:   # use < instead of <=
        x = lower + (upper - lower) // 2
        val = array[x]
        if target == val:
            return x
        elif target > val:
            if lower == x:   # this two are the actual lines
                break        # you're looking for
            lower = x
        elif target < val:
            upper = x

ip = int(input("Enter the number :"))
c = binary_search(numbers, ip)
print( c )

