# HV20.04 Br❤️celet

<img src="../_resources/19_fun.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/easy.png" style="height:1.8em;vertical-align:middle;">  

---

## Introduction

Santa was given a nice bracelet by one of his elves. Little does he know that the secret admirer has hidden a message in the pattern of the bracelet...

![bracelet](bracelet.jpg)

### Hints

- No internet is required - only the bracelet
- The message is encoded in binary
- Violet color is the delimiter
- Colors have a fixed order
- Missing colors matter

---

## Analysis

Image of a bracelet beginning with "HV20{...}".

Splitting up the sequence of colors:

    B = blue
    G = green
    P = pink
    V = violet
    Y = yellow

    GVPYVGBVPGVGBVPGBYVGBYVGBVBYVBYVGBYVPYVBYVVGBYVGYVGYVBYVBYVGVGBVPGBVBYVGBYVBYVGV

Perhaps the Ps are separators for the words (=Space)

    GV YVGBV GVGBV GBYVGBYVGBVBYVBYVGBYV YVBYVVGBYVGYVGYVBYVBYVGVGBV GBVBYVGBYVBYVGV

Or perhaps the Vs are separators for the words (=Space)

    G PY GB PG GB PGBY GBY GB BY BY GBY PY BY  GBY GY GY BY BY G GB PGB BY GBY BY G 

We "clearly" see, that the ordering of the colors follows a pattern:

    P is always the first character
    G is always the second character 
    B is always the third character 
    Y is always the last character

We can interpret the existence of the character as a "1" and the missing of the character as a "0":

Each "syllable" can then be expressed as a 4 bit number (=1 to 15). Our "sentence" expressed in hexadecimal values

    4 9 6 C 6 F 7 6 3 3 7 9 3 0 7 5 5 3 3 4 6 e 3 7 3 4

These "nibbles" can be combined to bytes and then translated to ASCII using [CyberChef](https://gchq.github.io/CyberChef/) and the "from hex" module:

    Ilov3y0uS4n74

The solution seems to be 

    HV20{Ilov3y0uS4n74}

## Appendix

I used the spreadsheet [Transformations.numbers](Transformations.numbers) to play with the data. (Take a look at the [Transformations.pdf](Transformations.pdf) if you do not have "Numbers" installed.)
