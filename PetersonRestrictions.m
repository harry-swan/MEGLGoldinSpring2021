function PR = PetersonRestrictions(n)
    Y = PetersonGenerator(n)';
    y = find(~cellfun('isempty',Y)); %Logical cells with reduced words
    s = size(y,1); %Number of elements in Peterson (Should be 2^(n-1))
    PR = strings(0,3);
    R = strings(s + 1,3,s);
    for i = 1:s
        Word = ['',Y(y(i)),''];
        Restriction = Restrictions(Y(y(i)),n);
        R(:,:,i) = [Word ; Restriction];
    end
    for i = 1:s
        PR = [PR ; R(:,:,i)];
    end
end