#! /usr/bin/python2
#Code for
# 1. Checking Null values present in .csv files
# 2. Validating Date format(MM/DD/YYYY) in .csv files
# 3. Validating Number of records present in .csv files with reference count file
# Author :
# Sonal Sharma, Diksha Ojha

import csv, re, glob, os, mmap, datetime, subprocess
i=0
counter=0
string="_"
allColumns=[]
ext=".csv"
prefix="darwin_dm_"
dateLogFile=open("/mysql_data/migration/Talend/Data_Files/Tgt/send_to_NC/ITR_DR_1/dateLogFile.csv","w")
folderName="*.csv"
suffix="_2*"
fileIndex=0
recNr=0
targetRecords=0
flagPresent=0
actualRecords=0
columnFile=csv.reader(open("column_a.csv","r"))
os.chdir("/mysql_data/migration/Talend/Data_Files/Tgt/send_to_NC/ITR_DR_1")
print "Started Validating darwin_dm Files "
print >>dateLogFile, "Started Validating darwin_dm Files "
for row in columnFile:
    presentTableName=row[0]
    targetLineNo=row[1]
    if i==0 :
        previousTableName=presentTableName
        i=1
    if previousTableName == presentTableName:
        allColumns.append(row[1])
    else:
        tableName=prefix+previousTableName
        for dirName in glob.glob("darwin_dm_*.csv"):
            fileSize = subprocess.Popen(["stat","-c%s",dirName], stdout=subprocess.PIPE).communicate()[0]
            if int(fileSize)==901216 and int(fileSize) > 0 and (dirName.startswith(tableName+"_2") or dirName.startswith(tableName+"_VW")):
                re.findall(r'Null',dirName)
                countFile=csv.reader(open("count_a.csv","r"))
                for row1 in countFile:
                    targetTableName=prefix+row1[0]
                    if dirName.startswith(targetTableName+"_2"):
                        targetRecords=row1[1]
                        break
                flagPresent=1
                fileIndex=fileIndex+1
                print "Table ", fileIndex, dirName
                print "---------------------------------------------------------------------------------------"
                print >>dateLogFile, "Table - ", fileIndex, dirName
                nullCheck=subprocess.Popen(["grep","-rl",",null,",dirName], stdout=subprocess.PIPE).communicate()[0]
                NULLCheck=subprocess.Popen(["grep","-rl",",NULL,",dirName], stdout=subprocess.PIPE).communicate()[0]
                nullCheck1=subprocess.Popen(["grep","-rl",",\"null\",",dirName], stdout=subprocess.PIPE).communicate()[0]
                NULLCheck1=subprocess.Popen(["grep","-rl",",\"NULL\",",dirName], stdout=subprocess.PIPE).communicate()[0]
                if nullCheck!="" or NULLCheck!="" or nullCheck1!="" or NULLCheck1!="":
                    counter=counter+1
                    print "  NULL/null value Found"
                    print >>dateLogFile, "  NULL/null value Found "
                else:
                    print "  No Null Value Found"
                    print >>dateLogFile, "  No Null value Found "
                flatFile=csv.reader(open(dirName,"rb"))
                for row2 in flatFile:
                    recNr=recNr+1
                    if recNr!=1:
                        for column in allColumns:
                                if row2[int(column)-1]!="":
                                        datefield=row2[int(column)-1].split(' ')[0]
                                        timefield=row2[int(column)-1].split(' ')[1]
                                        try:
                                                datetime.datetime.strptime(datefield, '%m/%d/%Y')
                                                datetime.datetime.strptime(timefield, '%H:%M:%S')
                                        except ValueError:
                                                print "  Invalid DateTime Format", row2[int(column)-1], " at Column ", column, " at Record ", recNr
                                                print >>dateLogFile, "  Invalid DateTime Format", row2[int(column)-1], " at Column ", column, " at Record ", recNr
                if recNr!=0:
                        print  "  Total Records Scanned -", recNr-1, "Count from csv file -",targetRecords
                        print >>dateLogFile, "  Total Records Scanned - ", recNr-1, "Count from csv file -",targetRecords
                        if int(recNr)-1 == int(targetRecords):
                                print "  Record Count Matched "
                                print >>dateLogFile, "  Record Count Matched "
                        else:
                                print "  Mismatched Record Counts "
                                print >>dateLogFile, "  Mismatched Record Counts "
                else:
                    print "  File contains no data "
                    print >>dateLogFile, "  File contains no data "
                actualRecords=0
                targetRecords=0
                previousTableName=presentTableName
                allColumns[:]=[]
                allColumns.append(row[1])
                recNr=0
        if flagPresent == 0:
            previousTableName=presentTableName
            allColumns[:]=[]
            allColumns.append(row[1])
            recNr=0
        else:
            flagPresent=0
print "Total Number of Files with Null Data issue - ", counter
print >>dateLogFile, "Total Number of Files with Null Data issue - ", counter

