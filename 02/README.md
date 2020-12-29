# HV20.02 Chinese Animals

<img src="../_resources/19_fun.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/easy.png" style="height:1.8em;vertical-align:middle;">  

---

Todays hint seems chinese:

    恭喜！收旗爲：ＨＶ２０｛獭慬氭敬敧慮琭扵瑴敲晬礭汯癥猭杲慳猭浵搭桯牳ｅ｝

The first part is real chinese. But the Flag content seems giberish...

The flag part in hex:

    00000000  e7 8d ad e6 85 ac e6 b0  ad e6 95 ac e6 95 a7 e6  |................|
    00000010  85 ae e7 90 ad e6 89 b5  e7 91 b4 e6 95 b2 e6 99  |................|
    00000020  ac e7 a4 ad e6 b1 af e7  99 a5 e7 8c ad e6 9d b2  |................|
    00000030  e6 85 b3 e7 8c ad e6 b5  b5 e6 90 ad e6 a1 af e7  |................|
    00000040  89 b3 ef bd 85                                    |.....|


So probably there must be some UTF like encoding applied. [CyberChef](https://gchq.github.io/CyberChef/) comes to help again.

Use "Text encoding brute force" and apply it to `獭慬氭敬敧慮琭扵瑴敲晬礭汯癥猭杲慳猭浵搭桯牳ｅ`:

    UTF-8 (65001)	獭慬氭敬敧慮琭扵瑴敲晬礭汯癥猭杲慳猭浵搭桯牳ｅ
    UTF-7 (65000)	+c20-+YWw-+bC0-+ZWw-+ZWc-+YW4-+dC0-+YnU-+dHQ-+ZXI-+Zmw-+eS0-+bG8-+dmU-+cy0-+Z3I-+YXM-+cy0-+b
    UTF-16LE (1200)	msla-llegena-tubttrelf-yolev-srgsa-sum-dohsrEÿ
    UTF-16BE (1201)	small-elegant-butterfly-loves-grass-mud-horsÿE
    UTF-32LE (12000)	ms..la..-l..le..ge..na..-t..ub..tt..re..lf..-y..ol..ev..-s..rg..sa..-s..um..-d..oh..sr..Eÿ..
    UTF-32BE (12001)	..sm..al..l-..el..eg..an..t-..bu..tt..er..fl..y-..lo..ve..s-..gr..as..s-..mu..d-..ho..rs..ÿE

We see that UTF-16BE (1201) has as a result `small-elegant-butterfly-loves-grass-mud-horsÿE` which leads to the flag solution:

    HV20{small-elegant-butterfly-loves-grass-mud-horse}
