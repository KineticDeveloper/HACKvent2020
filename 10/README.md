# HV20.10 Be patient with the adjacent

## Introduction

Ever wondered how Santa delivers presents, and knows which groups of friends should be provided with the best gifts? It should be as great or as large as possible! Well, here is one way.

Hmm, I cannot seem to read the file either, maybe the internet knows?

**Hints**

- Hope this cliques for you
- Segfaults can be fixed - maybe read the source
- There is more than one thing you can do with this type of file! Try other options...
- Groups, not group

---

## Analysis

The downloaded file `file.col.b` has the following header whose meaning is not clear to me.

    284
    c -------------------------------- 
    c Reminder for Santa:
    c   104 118 55 51 123 110 111 116 95 84 72 69 126 70 76 65 71 33 61 40 124 115 48 60 62 83 79 42 82 121 125 45 98 114 101 97 100 are the nicest kids.
    c   - bread.
    c -------------------------------- 
    p edges 18876 439050

Converting the comment to ASCII generates a fake flag, which is not the solution: `hv73{not_THE~FLAG!=(|s0<>SO*Ry}-bread`


From googling "file reader .col.b" I conclude that this is a DIMACS binary file, containing information about edges of a graph.
As the edges are not listed easily readable, I suppose (and conclude from the challenge title) that the graph is represented by an adjacency matrix for 18876 nodes and 439050 edges

Supposing we can use Octave to do the mathematical solution, I installed it using docker.

    docker pull mtmiller/octave
    docker run -v $PWD:/hackvent -it mtmiller/octave 

But as I don't have a clue how to progress and the motivation is missing to tackle graph problems, I stop here.

---

Starting over after getting additional 24h hours time :-)

Somehow I got the hint from discord that we need a `bin2asc` tool.

I found ["dimacs-converter"](https://code.google.com/archive/p/dimacs-converter/source/default/source) which includes `bin2asc` that can be used to convert the `file.col.b` into a readable format.

To convert the file a few adaptions to the sources had to be done:

  - to `make` the project, add includes to 

        #include <stdlib.h>
        #include <string.h>

  - avoid truncation of the file due to a too big number of vertices, modify `genbin.h`:

        #define MAX_NR_VERTICES 24000 
        #define MAX_NR_VERTICESdiv8 3000

After a successfull `make` we can use `bin2asc file.col.b` to create `file.col`. 

But what now? We probably have to find a way to identify the `Cliques`. Googling for "python cliques" brings me to the NetworkX project.

So now I have to write code. See the solution in [`solve.py`](solve.py). NetworkX has a `read_edgelist` function which works on a modified ASCII file. So I transform `file.col` to `file.edgelist`, removing the comment `c` and `p` lines and all the `e` prefixes, to make it readable.
Then I loop over all `cliques` and check whether they contain a "nice kid". If yes, I record the largest length of the clique.

Using the list of nice kids, we can transform the associated largest clique size to ASCII and get the solution:

    HV20{Max1mal_Cl1qu3_Enum3r@t10n_Fun!}


Many thanks to Pascal which helped me debug my python code, as it was spitting out an incomplete graph. I had the wrong assumption that the nice kid is always the lowest number in the clique. Later I replaced this part by a proper "intersection calculation".