#!/usr/bin/python3

#link= "https://www.google.com/settings/security/lesssecureapps"

import smtplib
from PIL import Image
from pytesseract import image_to_string
from re import search
from email.mime.multipart import MIMEMultipart

def s_email():
  msg = MIMEMultipart()
  msg['Subject'] = "Test Script Mail"
  frm = "shanmukr.sw@gmail.com"
  pas = "Welcome@2017"
  #msg['Reply-to'] = "shanmukr482@gmail.com"
  rec = "shanmukr482@gmail.com"
  msg.preamble = "test"
  msg.attach("galla.JPG")
  
  message ="""
  Hi Shanmukha,
  
  Greetings for the day, I got your's reference from Linkedin.
  
  I am sharing my updated CV to you, Please go through it, let me know is there any openings related to profile.
  
  Thanks & Regards,
  Shanmukha.
  """
   
  s = smtplib.SMTP_SSL('smtp.googlemail.com', 465)
  s.login(frm, pas)
  s.sendmail(frm, [rec], msg)
  s.quit()

s_email()

def image():
  image = Image.open('test.PNG', mode='r')
  return image_to_string(image)

#t = image()

def find_mail(t):
  match = search(r'.*?(\w+\.\w+@\w+\.\w+).*', t)
  if match:
    print (match.group(1))

find_mail(image())
