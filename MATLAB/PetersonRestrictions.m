function PR = PetersonRestrictions(n)
    %Restricts every element of C(n) to Y(n)
    %Output is somewhat like a table
    %Second column has labels referring to the three lower columns:
    %First column is a reduced word
    %Second column is a pullback in terms of alphas (a_i=x_i-x_{i+1})
    %Third column maps all alphas to a single variable t
    C = CoxeterGenerator(n)';
    c = find(~cellfun('isempty',C)); %Logical cells with reduced words
    s = length(c); %Number of fixed points in Y
    PR = strings(0,3);
    R = strings(2^(n-1) + 1,3,s);
    for i = 1:s
        Word = ['',C(c(i)),''];
        Restriction = Restrictions(C(c(i)),n);
        R(:,:,i) = [Word ; Restriction];
    end
    for i = 1:s
        PR = [PR ; R(:,:,i)];
    end
end