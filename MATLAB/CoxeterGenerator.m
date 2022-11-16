function C = CoxeterGenerator(n)
    %Generates all coxeter permutations' reduced words for S_n
    %cache prevents redundant calculation
    cache = strcat('C',string(n));
    try
        C = evalin('base', cache);
        return;
    catch
    end
    %Take Y(n) and get rid of rightmost repeats
    %C(n) elements will have same position as corresponding Y(n) elements
    C = PetersonGenerator(n)';
    c = find(~cellfun('isempty',C));
    s = length(c);
    for i = 1:s
        r = C(c(i));
        r = convertStringsToChars(r);
        r = strsplit(r(2:end),'s');
        r = cellfun(@str2num, r);
        r = unique(r);
        x = '';
        for j = 1:length(r)
            x = strcat(x,strcat('s',string(r(j))));
        end
        C(c(i)) = x;
    end
    C = C';
    assignin('base',cache,C);
end