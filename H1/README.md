# HV20.H1 It's a secret!

In the [challenge of the day](../03/) we decrypted only one file of the `Package_2.zip`.
Let's find out if there is more in the other files.

```bash
mkdir -p decrypted decompressed
for F in to-test/*.bin tested/*.bin ; do
    FILENAME=`basename $F`
    echo "$F => $FILENAME"
    bkcrack -c $FILENAME -k 2445b967 cfb14967 dceb769b -C Package_2.zip -d decrypted/$FILENAME
    bkcrack-1.0.0-Linux/tools/inflate.py <decrypted/$FILENAME > decompressed/$FILENAME
done
```

It looks as if all the files are Base64 encoded. Let's concatenate all the files:

```bash
for F in decompressed/* ; do 
    cat $F
    echo ""
done > decompressed-all.txt
base64 -d decompressed-all.txt > all.bin
```

Try to find the flag in the resulting binary:

    fgrep -a HV20 all.bin

Solution:

    HV20{it_is_always_worth_checking_everywhere_and_congratulations,_you_have_found_a_hidden_flag}