# HV20.03 Packed gifts

One of the elves has unfortunately added a password to the last presents delivery and we cannot open it. The elf has taken a few days off after all the stress of the last weeks and is not available. Can you open the package for us?

We found the following packages:

- Package 1
- Package 2

## Analysis

- `Package 1` is an unencrypted ZIP file with 100 numbered binary files `0000.bin` up to `0099.bin`.
- `Pacakge 2` is an encrypted ZIP file containing the same 100 numbered binary files `0000.bin` up to `0099.bin` but additionally contains a `flag.bin`

We want to extract the `flag.bin` but cannot do it because we don't have the encryption password.

Thanks to a hint on the HackVent2020 discord channel, I know that this is called a "known plaintext attack".
It seems as if `bkcrack` is the tool to use. (Get it from [GitHub here](https://github.com/kimci86/bkcrack))

Trying to crack the password using the command:

```bash
bkcrack -P Package_1.zip -C Package_2.zip -c 0001.bin -p 0001.bin
````

```log
bkcrack 1.0.0 - 2020-11-11
Generated 4194304 Z values.
[11:13:48] Z reduction using 150 bytes of known plaintext
100.0 % (150 / 150)
55313 values remaining.
[11:13:49] Attack on 55313 Z values at index 7
100.0 % (55313 / 55313)
[11:19:12] Could not find the keys.
````

Applying `bkcrack` on all files using the following script. This script takes the names of all files (=content of `Package_1.zip`) from folder `to-test`, executes `bkcrack` as shown above on it and logs the output to `logs/bkcrack-$FILENAME.log`. Upon success, the file is moved from `to-test` to `tested`, to ensure we do not execute the problem. (~50 Minutes with 8-cores).

Some preparation

    mkdir -p logs to-test tested
    unzip Package_1.zip -d to-test


```bash
#!/bin/bash
for F in to-test/00*.bin ; do
    FILENAME=`basename $F`
    echo "$F => $FILENAME"
    bkcrack -P Package_1.zip -C Package_2.zip -c $FILENAME -p $FILENAME \
         2>&1 > logs/bkcrack-$FILENAME.log && mv $F tested/ 
done
```

36 files were not successfully processed, due to `Data error: plaintext offset is too large.`


Searching for a successfull result in the logs:

```bash
fgrep -R "Keys" logs
Keys: 2445b967 cfb14967 dceb769b 
logs/bkcrack-0053.bin.log:[12:21:23] Keys
```

Decrypting the flag.bin:

    bkcrack -c flag.bin -k 2445b967 cfb14967 dceb769b -C Package_2.zip -d flag-decrypted.txt

Inflate the decrypted file:

    bkcrack-1.0.0-Linux/tools/inflate.py < flag-decrypted.txt > flag-decoded.txt

The result is still bas64 encoded:

    base64 -d < flag-decoded.txt

## Solution

    HV20{ZipCrypt0_w1th_kn0wn_pla1ntext_1s_easy_t0_decrypt}


## Possible improvement / Shortcut

1. Don't read only the README of bkcrack. Checkout the `example/tutorial.md` too!

2. Instead of brute force `bkcrack`-ing all files, it would have been possbible to check the the ZIP files (using `unzip -lv`) and compare the CRC-32 checksum.

   Only the checksum of `0053.bin` is identical in poth ZIP files. This is also the one which can be cracked and results in the key found above.

