import re
from time import sleep
from glob import glob
from multiprocessing import Lock, Queue, Process

def unlock_files(queue, lock):
  lock.acquire()
  files = q.get()
  lock.release()
  c = 0
  lines = []
  with open(files) as FH:
    file_name = "File Name is : "+" "+files
    lines.append(file_name)
    for i in FH:
      #print("File name is : ", files)
      c += 1
      match = re.search(r'null|\d{1,2}[^/]\d{1,2}[^/]\d{4}\s+\d{1,2}[^:]\d{1,2}|\d{1,2}[^/]\d{1,2}[^/]\d{4}\s+\d{1,2}:\d{1,2}|\d{1,2}[^/]\d{1,2}/\d{4}\s+\d{1,2}[^:]\d{1,2}|\d{1,2}/\d{1,2}[^/]\d{4}\s+\d{1,2}[^:]\d{1,2}|\d{1,2}[^/]\d{1,2}/\d{4}\s+\d{1,2}:\d{1,2}|\d{1,2}/\d{1,2}[^/]\d{4}\s+\d{1,2}:\d{1,2}|\d{1,2}/\d{1,2}/\d{4}\s+\d{1,2}[^:]\d{1,2}', i, re.I)
      if match:
        error = "Line Number : "+str(c)+" : "+str(match)
        lines.append( error )
        #print( "\t\t", c, match )
    result = "File "+files+" Having "+str(c-1)+" Number of lines"
    #print("\t\tFile ", files, " Having ", c - 1, " Number of rows\n")
    lines.append(result)
    print( lines )

q = Queue()
lock = Lock()
all_files = glob("darwin_dm_*.csv")

for i in all_files:
  q.put(i)
 
for files in range(len(all_files)):
  p = Process(target = unlock_files, args = (q,lock))
  p.start()
