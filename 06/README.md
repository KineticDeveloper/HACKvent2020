# HV20.06 Twelve steps of christmas

<img src="../_resources/19_fun.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/medium.png" style="height:1.8em;vertical-align:middle;">  

---

On the sixth day of Christmas my true love sent to me...

six valid QRs,
five potential scrambles,
four orientation bottom and right,
and the rest has been said previously.

The image [`QR-Cube.png`](QR-Cube.png) is provided and suggest we have to solve a Rubiks cube.

After some fiddling with the paper and trying to model the cube in Blender, I decided to go "brute force" using a Python script.

First I had to cut the QR code parts from the provided template using `QR-cut.png` to fix the transparency issue.

I had to adjust muliple times the cuttings... first it was 93x93, then 87x87 and finally I went with 92x92 (because the black cross in the middle seems to be important.) 

The tiles are numbered by the sides of the cube:

          +-----+
          | E_1 |
    +-----+-----+-----+
    | E_5 | E_2 | E_6 |
    +-----+-----+-----+
          | E_3 |
          +-----+
          | E_4 |
          +-----+

and tile positions 1 to 4 from top left to bottom right:

    +---+---+
    | 1 | 2 |
    +---+---+
    | 3 | 4 |
    +---+---+

For each tile I have checked the structure (alignment or position marker, timing lines) and classified each tile by its only possible location. In the end I had for each tile position only 6 candidates... which indicates that we expect 6 QR codes.

See the script [`solve.py`](solve.py) for the brute force implementation to find all the QR codes.  
The script uses `PIL` to load, rotate and combine the tiles and `pyzbar` to check the validity of the generated QR code.


The following QR code data points are found:

- HV20{Erno_
- Rubik_would
- _be_proud.
- Petrus_is
- _Valid.
- #HV20QRubicsChal}


## The expected flag is

    HV20{Erno_Rubik_would_be_proud.Petrus_is_Valid.#HV20QRubicsChal}
