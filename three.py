
from two import check_fare
from common import take_inputs, data, check_input, age_l

l = [[0,10,[20,5]],
[30,0,[50,10]],
[50,60,0]]


def update_list(a, c, li):
	li1 = []
	for i in range(len(a)):
		t_l = []
		for j in range(len(a)):
			if i == j:
				t_l.append(0)
			elif not c[i][j]:
				t_l.append(a[i][j])
			else:
				t_l.append([a[i][j], c[i][j]])
		li1.append(t_l)
	li[:] = li1

def get_list(data):
	tmp_line=[]
	data  = data.rstrip("]\n")
	data  = data.lstrip("[")
	data  = data.split(",")
	for i in data:
		if not i.isdigit():
			return False
		else:
			tmp_line.append(int(i))
	return tmp_line

def get_validate(data, age, string, f=False):
	tmp_line = []
	if not data:
		return False
	if not f:
		for i in range(len(data)):
			status = get_list(data[i])
			if not status:
				print("Wrong "+string+" data !!!")
				return False
			else:
				tmp_line.append(status)
		if not len(tmp_line)==len(data):
			print("Source and Destination stops data should be equal !")
			return False
		for i in range(len(tmp_line)):
			for j in range(len(tmp_line)):
				if (i == j) and (tmp_line[i][j] != 0):
					print("Wrong fare details")
					return False
		return tmp_line
	else:
		age = []
		val = []
		for i in data:
			if "infant" in i:
				i = i.lstrip("infant ")
			elif "child" in i:
				i = i.lstrip("child ")
			elif "adult" in i:
				i = i.lstrip("adult ")
			elif "old" in i:
				i = i.lstrip("old ")
			i = get_list(i)
			val.append(i)
			if not i:
				print("Wrong age data")
				return False
			elif i[0] >= i[1]:
				print("Wrong inputs in age")
				return False
			else:
				age.append(i[1])
		s = 0
		for i in val:
			s += len(i)
		if s%len(val):
			print("Wrong age data")
			return False
		age = age.sort()
		return True

def get_data(string, lines):
	start, end = 0,0
	for i in lines:
		if i and ("<"+string+">" in i):
			start = lines.index(i)+1
		elif i and ("</"+string+">" in i):
			end = lines.index(i)
	if start and end:
		return lines[start:end]
	else:
		print("Tags for "+string+" is not correct !")
		return False

def read_update(age_l, l):
	with open('data.txt', 'r') as fd:
		lines = fd.readlines()
		adult_data = get_data("adult", lines)
		a_status = get_validate(adult_data, age_l, "adult")

		child_data = get_data("child", lines)
		c_status = get_validate(child_data, age_l, "child")

		age_data = get_data("age", lines)
		age_status = get_validate(age_data, age_l, "age", True)

	if not (a_status and c_status and age_status):
		return False
	else:
		update_list(a_status, c_status, l)
		return True


if __name__ == "__main__":
	while True:
		user = input("Login as :\nAdmin: 1\nUser: 2\n")
		if (not user) or (not user.isdigit()) or (int(user) not in [1,2]):
			print("Please enter a valid input.")
			continue
		elif int(user) == 1:
			pwd = input("Enter password: ")
			if pwd and pwd.isdigit() and int(pwd) == 1:
				if l:
					inp = input("Inputs already updated, want to update again ? y / n : ")
					if inp == 'n':
						continue
				f_status = read_update(age_l, l)
				if not f_status:
					print("File format wrong !")
					continue
			else:
				print("Wrong password !")
				continue

		elif int(user) == 2 and l:
			while True:
				s = take_inputs(l, data, age_l)
				fare = None
				if s:
					fare = check_fare(l, data, age_l)
				if fare or fare == 0:
					data["start"] = 0
					data["end"] = 0
					data["age"] = 0
					print("Fare: "+str(fare)+"/-")
					break
				elif data["end"] and data["start"]:
					data["age"] = 0
				else:
					data["start"] = 0
					data["end"] = 0
					data["age"] = 0
				continue
		else:
			print("Data not updated !\nLogin as admin to update.\n")
			continue


