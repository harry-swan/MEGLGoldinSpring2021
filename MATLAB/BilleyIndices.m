function I = BilleyIndices(w,r,l,n,I,s,k,b)
    %Example input:
        %(BilleyIndices([1,2,1],[1,2,3,1,2,1],
        %3,6,zeros(4,3),1,1,zeros(2,1))
    %This could be improved by allowing only w and r as base input
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