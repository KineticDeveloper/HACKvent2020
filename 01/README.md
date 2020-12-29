# HV20.01 Happy HACKvent 2020

<img src="../_resources/05_forensic.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/easy.png" style="height:1.8em;vertical-align:middle;">  

---

## Introduction

Welcome to this year's HACKvent.

Attached you can find the "Official" invitation to the HackVent.

![card.png](card.png)

One of my very young Cyber Elves cut some parts of the card with his alpha scissors.

Have a great HACKvent,

– Santa

---

## Analysis

The black rectangles come from alpha channel manipulations. Setting the alpha channel to opaque may bring up the hidden flag.

Image Magick tool:

    convert card.png -channel A -fx 255 card_no_alpha.png

    
The resulting code readable from the generated `card_no_alpha.png` is:

    HV20{7vxFXB-ItHnqf-PuGNqZ}

![card_no_alpha.png](card_no_alpha.png)


Another variant to solve this problem is by using the [solve.py](solve.py) Python script to generate [solved.png](solved.png).
