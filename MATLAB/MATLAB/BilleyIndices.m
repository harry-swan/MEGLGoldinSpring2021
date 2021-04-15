function I = BilleyIndices(w,r,l,n,I,s,k,b)
    %w is being restricted to r
    %l=length(w),n=length(r) to avoid redundant recalculation of length
    %All the "sub-indices" end up in I
    %s is the index to start from
    %k is the index of the found "sub-indices"
    %b contains the current found indices
    for i = s:n
        if (w(k) == r(i))
            if (k == l)
                d = find(~I,1,'first');
                for j = 1:(l-1)
                    I(d,j) = b(j);
                end
                I(d,l) = i;
            else
                bb = b;
                bb(k) = i;
                I = BilleyIndices(w,r,l,n,I,i + 1,k + 1,bb);
            end
        end
    end
end