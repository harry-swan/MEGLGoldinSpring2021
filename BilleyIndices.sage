import numpy as np

def BilleyIndices(w,r,l,n,I,s,k,b):
    #w is being restricted to r
    #l=length(w),n=length(r) to avoid redundant recalculation of length
    #All the "sub-indices" end up in I
    #s is the index to start from
    #k is the index of the found "sub-indices"
    #b contains the current found indices
    for i in range(s, n+1):
        if (w[k - 1] == r[i - 1]):
            if (k == l):
                d = np.argwhere(I == 0)
                d = d[0,0]
                for j in range(0, l - 1):
                    I[d,j] = b[j]
                I[d,l - 1] = i
            else:
                bb = b
                bb[k - 1] = i
                I = BilleyIndices(w,r,l,n,I,i + 1,k + 1,bb)
    return I