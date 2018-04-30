
from common import take_inputs, data, age_l

l = ((0, [10, 6], 30, 45, 60),
     (50, 0, [60, 40], 80, 70),
     (80, 70, 0, [40, 20], 20),
     (90, 30, 10, 0, 50),
     (100, 20, 5, [60, 20], 0))


def check_fare(li, d, age):
	fare = 0
	f = li[d["start"]-1][d["end"]-1]
	if d["age"]<age[0]:
		pass
	elif (d["age"]>=age[0]) and (d["age"]<=age[1]):
		if isinstance(f, int):
			fare = f//2
		else:
			fare = f[1]
	elif d["age"]>age[2] and d["age"]<age[3]:
		if isinstance(f, int):
			fare = f//2
		else:
			fare = f[0]//2
	else:
		if isinstance(f, int):
			fare = f
		else:
			fare = f[0]
	return fare

if __name__ == "__main__":
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
		elif data["end"] and data["start"]:
			data["age"] = 0
		else:
			data["start"] = 0
			data["end"] = 0
			data["age"] = 0
		continue

