#!/usr/bin/python3
from PIL import Image

img = Image.open('card.png')

szx, szy = img.size
for x in range(szx):
    for y in range(szy):
        (r, g, b, a) = img.getpixel((x, y))
        img.putpixel((x, y), (r, g, b, 255))

img.save('solved.png')
