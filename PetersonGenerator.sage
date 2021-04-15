import sage.combinat.permutation as permutation

def PetersonElements(n):
    Y=[0]*2^(n-1)
    antiDiag=OrderedPartitions(n).list()
    for i in range(0,2^(n-1)):
        Y[i] = permutation.descents_composition_last(antiDiag[i]).reverse()
    return Y

def CoxeterElements(n):
    S=Subsets(range(1,n))
    return list(map(list,S))

def BilleyIndices(w,r):
    W=CoxeterGroup(['A',len(w)])
    u=w.reduced_word_lexmin()
    x=[]
    if Word(r).is_subword_of(u):
        m=W.from_reduced_word(r)
        SC = SubwordComplex(u,m)
        for i in range (0,len(SC)):
            x.append(list(Set(range(0,len(w))).difference(set(SC[i]))))
    return x

def BilleyCoeff(w):
    alpha = ([w[-1],w[-1]+1])
    for c in w[-2::-1]:
        if alpha[0]==c:
            alpha[0]=c+1
        elif alpha[0]==c+1:
            alpha[0]=c
        if alpha[1]==c:
            alpha[1]=c+1
        elif alpha[1]==c+1:
            alpha[1]=c
    coeff=alpha[1]-alpha[0]
    return coeff

def Billey(w,r):
    W=Permutation(w).reduced_word_lexmin()
    t=var('t')
    term=t^len(r)
    if len(r)==0:
        return term
    coeff=0
    iList=BilleyIndices(w,r)
    for c in iList:
        coeff_c=1
        for i in c:
            coeff_c*=BilleyCoeff(W[:i+1])
        coeff+=coeff_c
    return term*coeff
