function FR = FlagRestrictions(n)
    %Restricts every element of X(n) to Y(n)
    %Output is somewhat like a table
    %Second column has labels referring to the three lower columns:
    %First column is a reduced word
    %Second column is a pullback in terms of alphas (a_i=x_i-x_{i+1})
    %Third column maps all alphas to a single variable t
    X = FlagGenerator(n)';
    x = find(~cellfun('isempty',X)); %Logical cells with reduced words
    s = length(x); %Number of fixed points in X (n!)
    FR = strings(0,3);
    R = strings(2^(n-1) + 1,3,s);
    for i = 1:s
        Word = ['',X(x(i)),''];
        Restriction = Restrictions(X(x(i)),n);
        R(:,:,i) = [Word ; Restriction];
    end
    for i = 1:s
        FR = [FR ; R(:,:,i)];
    end
end