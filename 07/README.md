# HV20.07 Bad morals

<img src="../_resources/10_programming.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/04_reverse_engineering.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/medium.png" style="height:1.8em;vertical-align:middle;">  

---

## Introduction 

One of the elves recently took a programming 101 course. Trying to be helpful, he implemented a program for Santa to generate all the flags for him for this year's HACKvent 2020. The problem is, he can't remember how to use the program any more and the link to the documentation just says `404 Not found`. I bet he learned that in the Programming 101 class as well.

Can you help him get the flag back?

[BadMorals.exe](BadMorals.exe)

### Hints

- There are nearly infinite inputs that pass almost all the tests in the program
- For the correct flag, the final test has to be successful as well

---

## Analysis

This time a Windows executable is attached, which needs analysis. 

### Running the binary

We have to provide multiple inputs and if we succeed, then we will get some output.

    $ ./BadMorals.exe
    Your first input: xyxabc
    Your second input: d
    Your third input: d
    Please try again.
    Press enter to exit.

### Disassembling

Tried first with Ghidra. But the code was almost unreadable. From a friend I heard of [`dnSpy`](https://github.com/dnSpy/dnSpy) a tool to analyse .NET binaries. I used it to get [`source.cs`](source.cs) which is a really good high-level representation of the algorithm.

### Analysing the source

After reading the first input using `ReadLine`, the characters are processed one-by-one and only every second (=`i % 2`) is being written to `text`. The content of this variable is then compared to `BumBumWithTheTumTum`. Upon success, the content of `str` is built using static Strings and a few characters of the original input:

    xBxuxmxBxuxmxWxixtxhxTxhxexTxuxmxTxuxmx
    01234567890123456789012345678901234567
       ^    ^^   ^^  ^ 

As we see, only the characters at position 9 (=array offset 8) and 15 (=array offset 14) of the input do really matter. All the others used, are derived from the `BumBumWithTheTumTum` text.


After reading the second input using `Readline`, the characters are reversed and then compared to `BackAndForth`. This means the correct input must be `htroFdnAkcaB`.  
Providing this input will initialize the content of `s` with 3 characters of the input.

    htroFdnAkcaB
    012345678901
         ^  ^  ^ 

`s` must be 

    Q1RGX3BsNHkxbmdf


After reading the third input using `Readline`, the characters are processed using a strange logic and must then match `DinosAreLit`:

    byte b = 42;
    for (int k = 0; k < array3.Length; k++)
    {
        char c = array3[k] ^ (char)b;
        b = (byte)((int)b + k - 4);
        text += c.ToString();
    }

To reverse this logic and generate the correct input, I've written [`solve_input3.js`](solve_input3.js), which gave me: `nOMNSaSFjC[` as the required third input.

Based on this third input, a `str2` variable is constructed and it is using only 2 characters of the input: 

    nOMNSaSFjC[
    012345678901
      ^^

`str2` must be

    00ZDNfMzRzeX0=

After processing all the 3 inputs, a Base64 decoding of `str+str2` and `s` happens. The result of the first two is used to construct the flag which is shown when the "Congratulations!" message appears.
The second result is used to compute a SHA1 hash using some obscure logic. Only if the hash is also correct, the success message is shown.

But as we care only about the flag, we can focus on generataing and decoding the `str` and `str2` variables.


## Solving the puzzle

Based on our analysis we can focus on constructing `str` and `str2`. `str2` is fully defined because it derives from the third input which is 100% known.  
For `str` there we know most parts of the input, but we used a few "x" as a placeholder. 2 of those x's are than copied to `str` and therefore we will have to try to find the correct values for them.

We know that at position 9, an additional transformation happens to the input: `array[8].GetHashCode() % 10`
This means, at the location in `str` we can substitute values from 0 to 9.

For the position 15 in the source we will have to try all values of the alphabet (upper, lower, numbers).

To build those strings and decode them, I used this time JavaScript. The source can be found in [`solve.js`](solve.js). Basically it consists of the parts we know in advance (the `input`s) and two loops trying the possible values for the unknown position.  
Each combination of `str+str2` is than decoded using Base64 and if it starts with `HV20{` the state is output, so I can afterwards check it.

Initally it produced 640 possible codes, which is too much to try manually. But looking closely at the generated flag we can "feel" that it is something related to "reverse engineering made easy".
We can basically "guess"  that the flag has to end with the string `3ng1n33r1ng_m4d3_34sy`.

By adding this restriction, we have only 10 codes left. From them another 4 have non-printable characters and 3 more do not really have a "reverse" sounding start of the flag. Now we end with the following 3 possible flags:

    HV20{r3=3rs3_3ng1n33r1ng_m4d3_34sy}
    HV20{r3>3rs3_3ng1n33r1ng_m4d3_34sy}
    HV20{r3?3rs3_3ng1n33r1ng_m4d3_34sy}

Submitting the flags shows, that the following is the solution

    HV20{r3?3rs3_3ng1n33r1ng_m4d3_34sy}

## Finding the inputs

We didn't find the solution by providing the correct input, I wanted to reconstruct the input which would make the `BadMorals.exe` congratulate me and spit out the correct flag.

As explained in the analysis, the character at position 9 of the first input (`input1`) is hashed and then a modulo of 10 is applied. We cannot reverse the hash function, but we can suppose that at position 9 there was just another character of the same alphabet we used for the character at position 15.

Therefore I created a list of variations for `input1` and stored it in `input1_variations.txt`.  
This file served then as an input to the automation script [`BadMorals_Test.sh`](BadMorals_Test.sh) which is used to run the executable, provide the 3 inputs and filter invalid executions.

The following list are the successfull executions:

    Your first input: xBxuxmxBJuxmxWXixtxhxTxhxexTxuxmxTxuxmx
    Your second input: htroFdnAkcaB
    Your third input: nOMNSaSFjC[
    Congratulations! You're now worthy to claim your flag: HV20{r3?3rs3_3ng1n33r1ng_m4d3_34sy}

    Your first input: xBxuxmxBTuxmxWXixtxhxTxhxexTxuxmxTxuxmx
    Your second input: htroFdnAkcaB
    Your third input: nOMNSaSFjC[
    Congratulations! You're now worthy to claim your flag: HV20{r3?3rs3_3ng1n33r1ng_m4d3_34sy}

    Your first input: xBxuxmxBhuxmxWXixtxhxTxhxexTxuxmxTxuxmx
    Your second input: htroFdnAkcaB
    Your third input: nOMNSaSFjC[
    Congratulations! You're now worthy to claim your flag: HV20{r3?3rs3_3ng1n33r1ng_m4d3_34sy}

    Your first input: xBxuxmxBruxmxWXixtxhxTxhxexTxuxmxTxuxmx
    Your second input: htroFdnAkcaB
    Your third input: nOMNSaSFjC[
    Congratulations! You're now worthy to claim your flag: HV20{r3?3rs3_3ng1n33r1ng_m4d3_34sy}

    Your first input: xBxuxmxB6uxmxWXixtxhxTxhxexTxuxmxTxuxmx
    Your second input: htroFdnAkcaB
    Your third input: nOMNSaSFjC[
    Congratulations! You're now worthy to claim your flag: HV20{r3?3rs3_3ng1n33r1ng_m4d3_34sy}

