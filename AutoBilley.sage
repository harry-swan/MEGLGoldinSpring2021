import sage.combinat.permutation as permutation

def BilleyIndices(r,c):
    R=CoxeterGroup(['A',len(r)])
    s=r.reduced_word_lexmin()
    d=c.reduced_word_lexmin()
    x=[]
    if Word(d).is_subword_of(s):
        e=R.from_reduced_word(d)
        SC = SubwordComplex(s,e)
        for i in range (0,len(SC)):
            x.append(list(Set(range(0,len(s))).difference(set(SC[i]))))
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

def Billey(r,c):
    s=r.reduced_word_lexmin()
    d=c.reduced_word_lexmin()
    t=var('t')
    term=t^len(d)
    if len(d)==0:
        return term
    coeff=0
    iList=BilleyIndices(r,c)
    for I in iList:
        coeff_I=1
        for i in I:
            coeff_I*=BilleyCoeff(s[:i+1])
        coeff+=coeff_I
    return term*coeff