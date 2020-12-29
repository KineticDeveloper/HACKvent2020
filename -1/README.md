# HV20.-1 Twelve steps of christmas

<img src="../_resources/19_fun.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/easy.png" style="height:1.8em;vertical-align:middle;">  

---

## Introduction

On the third day of christmas my true love sent to me...

  three caesar salads,
  two to (the) six basic arguments,
  one quick response.

[Message](message-1.txt)

---

## Analysis

The message seems strangely encrypted, but the poem might give us hints:

- `three caesar` = Cesar encryption (=alphabet rotation / ROT13) with offset 3  
[CyberChef](https://gchq.github.io/CyberChef/) comes to help.

  The first line can be decrypted to 

      Verse 3 done! Off with you! Get back to work! You're not done here...

  Applying the same decryption onto the remaining file gives us [message-2.dat](message-2.dat)

- `two to (the) six` = 2^6 = 64: Base 64 encoding

      base64 -d -i message-2.dat -o message-3.png

- `one quick response` = find QR code in PNG

    Either adjust white balance of image in an image editor, or use the following command:

      convert -monochrome message-3.png message-4-mono.png

The Flag is in `message-4-mono.png`:

    HV20{34t-sl33p-haxx-rep34t}