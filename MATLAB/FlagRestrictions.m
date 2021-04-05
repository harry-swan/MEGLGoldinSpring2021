function FR = FlagRestrictions(n)
    X = FlagGenerator(n)';
    x = find(~cellfun('isempty',X)); %Logical cells with reduced words
    s = length(x); %Number of elements in Flag (n!)
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