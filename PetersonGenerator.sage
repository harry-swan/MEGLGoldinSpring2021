import sage.combinat.permutation as permutation
load('AutoBilley.sage')

def bruhat(e):
    u=e.reduced_word()
    return [len(u),uniq(u)]

def PetersonElements(n):
    Y=[0]*2^(n-1)
    antiDiag=OrderedPartitions(n).list()
    for i in range(0,2^(n-1)):
        Y[i] = permutation.descents_composition_last(reversed(antiDiag[i])).reverse()
    Y.sort(key=bruhat)
    return Y

def CoxeterElements(n):
    S=list(map(list,Subsets(range(1,n))))
    P=[0]*len(S)
    for i in range(0,len(S)):
        P[i]=permutation.from_reduced_word(S[i],Permutations(n))
    return P

def PetersonClass(c):
    X=PetersonElements(len(c))
    Class=[]
    for p in X:
        Class.append(Billey(p,c))
    return Class

def PetersonBasis(n):
    Y=CoxeterElements(n)
    basis=[]
    for c in Y:
        basis.append(PetersonClass(c))
    return basis