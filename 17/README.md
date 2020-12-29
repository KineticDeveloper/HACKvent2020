# HV20.17 Santa's Gift Factory Control

<img src="../_resources/03_crypto.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/01_web_security.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/hard.png" style="height:1.8em;vertical-align:middle;">  

---

## Introduction

Santa has a customized remote control panel for his gift factory at the north pole. Only clients with the following fingerprint seem to be able to connect:

    771,49162-49161-52393-49200-49199-49172-49171-52392,0-13-5-11-43-10,23-24,0

### Mission
Connect to Santa's super-secret control panel and circumvent its access controls.

[Santa's Control Panel](https://876cfcc0-1928-4a71-a63e-29334ca287a0.rdocker.vuln.land/)

### Hints

- If you get a `403 forbidden`: this is part of the challenge
- The remote control panel does client fingerprinting
- There is an information leak somewhere which you need to solve the challenge
- The challenge is not solvable using brute force or injection vulnerabilities
- Newlines matter, check your files
