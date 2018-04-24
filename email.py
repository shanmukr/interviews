#!/usr/bin/python3

from PIL import Image
from pytesseract import image_to_string

myText = image_to_string(Image.open("test.png"),config='-psm 10')
myText = image_to_string(Image.open("test.png"))

"""The first step is to create an SMTP object, each object is used for connection 
with one server."""

"""
import smtplib

server = smtplib.SMTP('smtp.gmail.com', 587)

#Next, log in to the server
server.login("shanmukr.sw@gmail.com", "Welcome@2017")

#Send the mail
msg = "test"
#Hello!" # The /n separates the message from the headers
server.sendmail("shanmukr.sw@gmail.com", "mshanmukhareddy3@gmail.com", msg)
"""
