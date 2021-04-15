function C = CoxeterGenerator(n)
    cache = strcat('C',string(n));
    try
        C = evalin('base', cache);
        return;
    catch
    end
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