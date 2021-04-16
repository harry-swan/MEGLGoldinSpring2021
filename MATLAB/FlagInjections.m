function I = FlagInjections(n)
    %Computes i* for every element of X(n)
    I = strings(factorial(n),3);
    X = FlagGenerator(n)';
    x = find(~cellfun('isempty',X)); %Logical cells with reduced words
    s = length(x); %Number of elements in Flag (should be n!)
    for i = 1:s
        r = X(x(i));
        %First column gets a reduced word
        I(i,1) = r;
        %Second column gets i*
        I(i,3) = Injection(r,n);
        w = 1:n;
        r = convertStringsToChars(r);
        r = strsplit(r(2:end),'s');
        r = cellfun(@str2num, r);
        if(r ~= 0)
            for j = 1:length(r)
                k = r(j);
                temp = w(k);
                w(k) = w(k + 1);
                w(k + 1) = temp;
            end
        end
        %Third column gets one-line permutation
        I(i,2) = strcat('[',num2str(w),']');
    end
end