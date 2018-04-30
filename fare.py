
frm = int(input("Enter the From Stop : "))
to = int(input("Enter the From Stop : "))
age = int(input("Enter the Age of the Person : "))

list = [ [ [ 0 ], [ 10 ], [ 30 ], [ 45, 25 ] ],
         [ [ 50 ], [ 0 ], [ 60, 40 ], [ 80 ] ],
         [ [ 90 ], [ 30 ], [ 0 ], [ 50, 30 ] ],
         [ [ 100, 60 ], [ 20 ], [ 5 ], [ 0 ] ]
       ]


c = 0 if age > 60 or age < 13 else 1

count = len(list[frm][to])
for i in list[frm][to]:
  print ( i/2 if age > 60 and age < 13 else i )