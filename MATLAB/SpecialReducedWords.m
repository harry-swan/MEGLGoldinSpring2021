function rw = SpecialReducedWords(type, i, j)
rw = '';
if type == 't'
    rw = SpecialReducedWords('c', i, j);
    for k = j-2:-1:i
        rw = strcat(rw, 's', int2str(k));
    end
elseif type == 'c'
    for k = i:j-1
        rw = strcat(rw, 's', int2str(k));
    end
elseif type == 'p'
    for k = j:-1:i
        rw = strcat(rw, SpecialReducedWords('c',i,k));
    end
end
end

