import re

def fare_details():
    list = []
    line = open('tickets.txt')
    for i in line.readlines():
        j = re.match("(.*)", i)
        if j:
            temp = []
            for k in j.group(1).split():
                temp.append(k.split(','))
            list.append(temp)
    return list

def get_fare_details():
    list = fare_details()
    frm = int(input("Enter the From Stop : "))
    to = int(input("Enter the To Stop : "))
    age = int(input("Enter the Age : "))
    for i in list[frm][to]:
      i = int(i)
      print(i / 2 if age < 60 and age < 13 else i)

def change_fares():
  #s1 = int(input("Enter the From Stop : "))
  #s2 = int(input("Enter the To Stop : "))
  #a_f = str(input("Enter the Adult Fare : "))
  #c_f = str(input("Enter the Child Fare : "))
  line = open('tickets.txt')
  list = []
  for i in line.readlines():
    list.append(i.split())
  return list

def write_data():
  data = change_fares()

  lines = open( 'a.txt', 'w')
  for j in data:
    #print( j )
    lines.write(str(j))
  lines.close()

passwd = "shanmukr"
t = input("Enter the Password : ")

if t == passwd:
    op = int(input("Press 1 to change the Fares : "))
    if op == 1:
      write_data()
      #change_fares()
    else:
      get_fare_details()
else:
  print ( "Enter the valid Password" )
