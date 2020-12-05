
from itertools import permutations


def decode(string, dna_map):
    byte = 0
    byte_array = []
    for i, c in enumerate(string):
        byte = (byte << 2) + dna_map[c]
        if (i + 1) % 4 == 0:
            byte_array.append(byte)
            byte = 0

    return byte_array


string = "CTGTCGCGAGCGGATACATTCAAACAATCCTGGGTACAAAGAATAAAACCTGGGCAATAATTCACCCAAACAAGGAAAGTAGCGAAAAAGTTCCAGAGGCCAAA"
string2 = "ATATATAAACCAGTTAATCAATATCTCTATATGCTTATATGTCTCGTCCGTCTACGCACCTAATATAACGTCCATGCGTCACCCCTAGACTAATTACCTCATTC"
bases = "ACGT"

# Trying all possible permutations of the 4 bases
dna_map = {}
for base_permutation in [''.join(p) for p in permutations(bases)]:

    for i, c in enumerate(base_permutation):
        dna_map[c] = i

    # Decode the two strings based on this mapping
    bytes1 = decode(string, dna_map)
    bytes2 = decode(string2, dna_map)

    byte_array = []
    decoded_string = ""
    did_overflow = False
    for i, byte1 in enumerate(bytes1):
        byte2 = bytes2[i]

        byte = byte1 ^ byte2
        byte_array.append(byte)
        decoded_string += chr(byte)

        if byte > 127:
            did_overflow = True

    if not did_overflow:
        # print(byte_array)
        print(base_permutation)
        print(decoded_string)

        if decoded_string.startswith("HV20"):
            print("******* THE SOLUTION WAS FOUND 🥳🍾 *******")
            print(f"******* {decoded_string} *********")
