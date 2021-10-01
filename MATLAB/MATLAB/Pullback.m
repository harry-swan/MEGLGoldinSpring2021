function L = Pullback(W,n)
    %Example Input: Pullback('s1s2s1',4)
    %Computes i*(W) where W is a reduced word in X(n)
    C = CoxeterGenerator(n);
    W = convertStringsToChars(W);
    if(ismember(W,C))
        L = strcat('1P{',regexprep(num2str(str2double(strsplit(W(2:end),'s'))),'\s+',','),'}');
        return;
    end
    syms sub(x,y) mul(x,y) div(x,y);
    sub(x,y) = x-y;
    mul(x,y) = x*y;
    div(x,y) = x/y;
    if(count(W,'s') < n*(n-1)/2)
        RWF = ReducedWordForms(W);
        Y = Restrictions(W,n,RWF);
    else
        Y = Restrictions(W,n);
    end
    L = '';
    m = find(Y(1:end,3) ~= "0", 1);
    while(~isempty(m))
        r = convertStringsToChars(Y(m));
        r = strsplit(r(2:end),'s');
        r = cellfun(@str2num, r);
        r = unique(r);
        c = '';
        for j = 1:length(r)
            c = strcat(c,strcat('s',string(r(j))));
        end
        C = Restrictions(c,n);
        c = convertStringsToChars(c);
        p = div(evalin(symengine, Y(m,3)), evalin(symengine, C(m,3)));
        if(~isempty(L))
            L = strcat(L,{' + '});
        end
        L = strcat(L,string(p),'P{',regexprep(num2str(str2double(strsplit(c(2:end),'s'))),'\s+',','),'}');
        for i = 1:(2^(n-1))
            Y(i,3) = string(sub(evalin(symengine, Y(i,3)), mul(p ,evalin(symengine, C(i,3)))));
        end
        m = find(Y(1:end,3) ~= "0", 1);
    end
end