import re

data = {}
users = []
tool = ""
lic_used = ""
lic_issued = ""

lines = open("lic_log", "r")
for i in lines.readlines():
  match_tool = re.match(r'Users\s+of\s+(.*?)\:\s+\(Total\s+of\s+(\d+)\s+lic\w+\s+issued\;\s+Total\s+of\s+(\d+)\s+lic\w+\s+in\s+use\)', i)
  if match_tool:
    tool = match_tool.group(1)
    lic_issued = match_tool.group(2)
    lic_used = match_tool.group(3)
    data[tool] = {}
    data[tool]["issued_licences"] = lic_issued
    data[tool]["used_licences"] = lic_used
    data[tool]["users"] = []
    continue
  match_user = re.match(r'\s+(.*?)\s+.*\s+\d+\:\d+', i)
  if match_user:
    data[tool]["users"].append(match_user.group(1))
    continue
lines.close()

user_ip = input("Chose the below options : ")

print ( user_ip )

