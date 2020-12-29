# HV20.13 Twelve steps of christmas

<img src="../_resources/03_crypto.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/05_forensic.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/hard.png" style="height:1.8em;vertical-align:middle;">  

---

## Introduction

On the ninth day of Christmas my true love sent to me...

    nineties style xls,
    eighties style compression,
    seventies style crypto,
    and the rest has been said previously.

[Download](sheet.xls)

### Hints

- Wait, Bread is on the Nice list? Better check that comment again...

---

## Analysis

As today's challenge is classified as "hard" of type "crypto" and "forensic", I probably shouldn't expect too much.

The spreadsheet can be opened without entering a password in `Numbers` on macOS. Did I miss something? Or is this a bug in the old XLS format?



Looking for "Bread" we find the following comment:

    Not a loaf of bread which is mildly disappointing 1f 9d 8c 42 9a 38 41 24 01 80 41 83 8a 0e f2 39 78 42 80 c1 86 06 03 00 00 01 60 c0 41 62 87 0a 1e dc c8 71 23 Why was the loaf of bread upset? His plan were always going a rye. How does bread win over friends? “You can crust me.” Why does bread hate hot weather? It just feels too toasty.

Further after making the "Comment" column wrap the text and "spreading" the row heights to make everything visible, an image with "part9" in its text becomes visible. It seemed to be overlayed on the first image.

It's unclear to my what the sentence and the HEX values mean. Where is the compression applied? Onto the HEX values? Or is it crypto first to be applied?
