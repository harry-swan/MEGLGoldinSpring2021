import sage.combinat.permutation as permutation

def PetersonGenerator(n):
    Y=[0]*2^(n-1)
    antiDiag=OrderedPartitions(n).list()
    for i in range(0,2^(n-1)):
        Y[i] = permutation.descents_composition_last(reversed(antiDiag[i])).reverse()
    return Y
