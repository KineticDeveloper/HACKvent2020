# HV20.H2 Oh, another secret!

<img src="../_resources/21_open_source_intelligence.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/hard.png" style="height:1.8em;vertical-align:middle;">  

---

## Analysis

This hidden challenge is associated with [HV20.14](../14) where we were executing a strange GIF as a boot sector of a disk.

There must be something else hidden in the code.

Learning about Boot Sector execution from [Wikipedia](https://en.wikipedia.org/wiki/Master_boot_record#Programming_considerations) we know, that the sector is load to address `0x7c00` and executed from there. So we can set a breakpoint there, restart QEMU and step through the code using `ni`:

    break *0x7c00

    disconnect
    target remote localhost:1234
    c

    ni
    ni
    ...

After getting lost multiple times in unreadable/unclear code, I learn that the `int $0x10` instruction is calling BIOS interrupts. Therefore I set a breakpoint exactly at the instruction following the interrupt, so I can continue the code where I left off:

    break *0x7c37

It seems that the interrupt is used to print out each character of the flag. After carefully stepping through each output character, we read the solution printed from the emulated screen:

    HV20{h1dd3n-1n-pl41n-516h7}


## Appendix

To read the assembly code I used `gdb` to display the instructions load from QEMU [gdb-start.S](gdb-start.S) and also tried `objdump` with options from [StackOverflow](https://stackoverflow.com/questions/1737095/how-do-i-disassemble-raw-16-bit-x86-machine-code): [mbr.S](mbr.S) and [mbr-intel.S](mbr-intel.S)
