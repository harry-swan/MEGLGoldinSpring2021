function rw = SpecialReducedWords(type, i, j)
%I use these for testing examples of classes of permutations with
    %paramaters that I can more easily vary with less
    %possibility for mistakes
rw = '';
if type == 't' %transpositions of i and j
    rw = SpecialReducedWords('c', i, j);
    for k = j-2:-1:i
        rw = strcat(rw, 's', int2str(k));
    end
elseif type == 'c' %Consecutive Coxeter permutation
    for k = i:j-1
        rw = strcat(rw, 's', int2str(k));
    end
elseif type == 'P' %Peterson Schubert class fixed point for interval [i,j-1]
    for k = j:-1:i
        rw = strcat(rw, SpecialReducedWords('c',i,k));
    end
end
end

