function PR = PetersonRestrictions(n)
    C = CoxeterGenerator(n)';
    c = find(~cellfun('isempty',C)); %Logical cells with reduced words
    s = length(c); %Number of elements in Coxeter
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