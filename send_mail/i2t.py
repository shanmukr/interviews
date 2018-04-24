#!/usr/bin/python3
from PIL import Image
from pytesseract import image_to_string

image = Image.open('test.PNG', mode='r')
print(image_to_string(image))
