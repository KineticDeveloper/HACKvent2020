import networkx as nx

niceKids = [104, 118, 55, 51,  123,
            110, 111, 116, 95, 84, 72, 69, 126, 70, 76, 65, 71, 33,
            61, 40, 124, 115, 48, 60, 62, 83, 79, 42, 82, 121, 125, 45, 98, 114, 101, 97, 100]

# Reading the edgelist formatted file
fh = open("file.edgelist", "r")
G = nx.read_edgelist(fh, nodetype=int)
fh.close()

# Initialize the size of each clique to 0
lenMap = {}
for kid in niceKids:
    lenMap[kid] = 0

# Find if clique contains nice kids and record the length of those cliques
for clique in nx.find_cliques(G):
    kidsInClique = [kid for kid in clique if kid in niceKids]
    for kid in kidsInClique:
        lenMap[kid] = max(lenMap[kid], len(clique))

# Build result string according to the list of nice kids
str = ""
for kid in niceKids:
    str += chr(lenMap[kid])

print(str)
