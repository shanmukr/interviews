
from common import take_inputs, data

l = ((0, 10, 35, 45, 60),
     (50, 0, 60, 80, 70),
     (80, 70, 0, 40, 20),
     (90, 30, 10, 0, 50),
     (100, 20, 5, 60, 0))

def check_fare(l, d):
    min_age = 13
    max_age = 60

    if (d["age"]<min_age) or (d["age"]>max_age):
        return l[d["start"]-1][d["end"]-1]//2
    else:
        return l[d["start"]-1][d["end"]-1]

if __name__ == "__main__":
	while True:
		s = take_inputs(l, data, [0, 117])
		fare = None
		if s:
			fare = check_fare(l, data)
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

