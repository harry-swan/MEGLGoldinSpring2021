function X = FlagGenerator(n)
    %Generates reduced decompositions of permutations representing fixed
        %points of the Flag variety under a T-action
    %cache prevents redundant calculation
    cache = strcat('X',string(n));
    try
        X = evalin('base', cache);
        return;
    catch
    end
    if(n == 1)
        X = "s0";
        return;
    end
    X = strings(n*(n-1)/2+1,n^4); %Elements in the Flag variety
    i = ones(1 + n*(n-1)/2); %Flag Indices
    p = perms(1:1:n);
    f = factorial(n);
    for j = 1:f
        w = p(j,:);
        x = '';
        len = 1; %Actually 1 greater than length for indices
        for k = n:-1:2
            c = find(w==k);
            while(c ~= k) %Move k right
                temp = w(c);
                w(c) = w(c + 1);
                c = c + 1;
                w(c) = temp;
                x = strcat(strcat('s',string(c - 1)),x);
                len = len + 1;
            end
        end
        if(len == 1)
            x = 's0';
        end
        X(len,i(len)) = x;
        i(len) = i(len) + 1;
    end
    %Sort X(n) rows into alphabetical order
    keep = any(~cellfun('isempty',X), 1);
    X = X(:,keep);
    X(X == "") = string(missing);
    X = sort(X,2);
    X(ismissing(X)) = "";
    assignin('base',cache,X);
end