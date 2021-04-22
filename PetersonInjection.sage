load('PetersonGenerator.sage')

def notZeros(c):
    x=[]
    for i in range(len(c)):
        if str(c[i])!='0':
            x.append(i)
    return x

def BasisCoefficients(c,Reduced=False):
    n=len(c)
    if c in CoxeterElements(n):
        if Reduced:
            return [[1,c.reduced_word_lexmin()]]
        else:
            return[[1,c]]
    pc=PetersonClass(c)
    basis=PetersonBasis(n)
    iList=[]
    x=[]
    reflections=set(bruhat(c)[1])
    r=vector(pc)
    entries=notZeros(r)
    for i in range(len(basis)):
        rList=bruhat(CoxeterElements(n)[i])[1]
        if reflections in Subsets(rList).list():
            iList.append(i)
    for i in iList:
        nzList=notZeros(basis[i])
        if set(nzList) in Subsets(entries).list():
            coeff=r[nzList[0]]/(basis[i][nzList[0]])
            x.append([coeff,CoxeterElements(n)[i]])
            if Reduced:
                x[-1][1]=x[-1][1].reduced_word_lexmin()
            r=r-coeff*vector(basis[i])
            entries=notZeros(r)
            if entries==[]:
                break
    return x