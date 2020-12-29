# HV20.05 Image DNA

<img src="../_resources/03_crypto.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/05_forensic.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/easy.png" style="height:1.8em;vertical-align:middle;">  

---

Santa has thousands of Christmas balls in stock. They all look the same, but he can still tell them apart. Can you see the difference?

## Failed approaches

1. Checking the image meta data with ImageMagick: 

        identify -verbose image1.jpg > image1.txt
        identify -verbose image2.jpg > image2.txt
        diff image1.txt image2.txt

    There is some statistical deviations... and signatures!?

2. Calculating the differences between the RGB layers in Python:

    No "magic image" did appear...

3. Googling for "hide data in image difference"

    Nothing found

## Path to the solution

Checking the image files using `strings`:

    strings -n 7 -t x image1.jpg
    strings -n 7 -t x image2.jpg

There are some curiously long identically long strings with a reduced alphabet in the images:

    CTGTCGCGAGCGGATACATTCAAACAATCCTGGGTACAAAGAATAAAACCTGGGCAATAATTCACCCAAACAAGGAAAGTAGCGAAAAAGTTCCAGAGGCCAAA
    ATATATAAACCAGTTAATCAATATCTCTATATGCTTATATGTCTCGTCCGTCTACGCACCTAATATAACGTCCATGCGTCACCCCTAGACTAATTACCTCATTC

What might that mean? Thanks to a hint I received ("the title of the challange says `Image DNA`"), I googled for "how to encode data in dna base"

I found a nicely illustrating image of the process:

    https://www.researchgate.net/figure/Stepwise-encoding-of-data-into-DNA-using-Goldmans-approach-is-elucidated-in-detail_fig5_277023595


We can suppose each dna base (A, C, G and T) represents 2 bits. 4 DNA bases give us 8 bits. We don't know the mapping (00, 01, 10, 11) but we can try all possible permutations using Python.
The two DNA strings can be decoded but are unreadable in ASCII (=not a flag we are looking for).
But why are there two strings? Thanks to a hint, I learned that they have to be combined. The easiest combination is bitwise XOR.

So I wrote [`process_dna.py`](process_dna.py) to solve this puzzle.

I have added a check to ignore all solutions having bytes not in the ASCII range (<=128) and if the result starts with `HV20`.

The solution is:

    HV20{s4m3s4m3bu7diff3r3nt}

Interestingly multiple permutations are resulting to the same solution. This is probably due to the XOR combination which doesn't care what bit is 1 or 0. They simply have to be different to produce a 1 or identical to produce a 0.
