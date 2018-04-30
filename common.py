
data = {"start": 0, "end": 0, "age": 0}
age_l = [5,12,60,117]

def print_fare(l):
	print("Fare details:")
	for i, j in enumerate(l):
		print("Stop "+str(i+1), j)

def check_input(value):
	if isinstance(value, int):
		return value
	elif (not value) or (not value.isdigit()):
		return None
	else:
		return int(value)

def take_inputs(li, d, age):
	print_fare(li)
	if (not d["start"]) or (not d["end"]):
		d["start"] = input("Enter starting station: ")
		d["start"] = check_input(d["start"])
		if not d["start"]:
			print("Enter starting station in digits")
			return None
		if (d["start"]<=0) or (d["start"]>len(li)):
			print("Enter a valid starting station between 1 and "+str(len(li))+" !!!")
			d["start"] = 0
			return None

		d["end"] = input("Enter destination station: ")
		d["end"] = check_input(d["end"])
		if not d["end"]:
			print("Enter destination station in digits")
			return None
		elif (d["end"]<=0) or (d["end"]>len(li)):
			print("Enter a valid destination station between 1 and "+str(len(li))+" !!!")
			d["end"] = 0
			return None
		elif d["end"] == d["start"]:
			print("Select different stations.")
			d["end"] = 0
			d["start"] = 0
			return None

	d["age"] = input("Enter age: ")
	d["age"] = check_input(d["age"])
	if not d["age"]:
		print("Enter age in digits")
		return None
	if (d["age"]<=0) or (d["age"]>=age[-1]):
		print("Enter valid age between 1 and "+str(age[-1])+" !!!")
		return None
	return True
