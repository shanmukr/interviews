import re
from time import sleep
from glob import glob
from multiprocessing import Lock, Queue, Process

def unlock_files(queue, lock):
  lock.acquire()
  files = q.get()
  lock.release()
  lines_count = 0
  lines = {}
  with open(files) as FH:
    lines[files] = {}
    lines[files]["Mismatched data"] = {}
    for i in FH:
      lines_count += 1
      match2 = re.search(r',NULL,', i, re.I)
      if match2:
        lines[files]["Mismatched data"][lines_count] = i
      match1 = re.search(r'(\d{1,2})(.)(\d{1,2})(.)(\d{4})\s+(\d{1,2})(.)(\d{1,2})', i)
      if match1:
        if not match1.group(2) == "/" or not match1.group(4) == "/" or not match1.group(7) == ":" or not int(match1.group(1)) <= 13 or not int(match1.group(3)) <= 32 or not int(match1.group(6)) <= 25 or not int(match1.group(8)) <= 61:
          lines[files]["Mismatched data"][lines_count] = i
    lines[files]["Number Of Lines"] = lines_count
    print( lines )

q = Queue()
lock = Lock()
all_files = glob("darwin_dm_*.csv")

for i in all_files:
  q.put(i)
 
for files in range(len(all_files)):
  p = Process(target = unlock_files, args = (q,lock))
  p.start()
