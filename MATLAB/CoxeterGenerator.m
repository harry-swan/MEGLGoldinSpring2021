function C = CoxeterGenerator(n)
    n = n - 1; %One less s than value of n
    C = strings(n + 1,n^2); %Coxeter Elements
    C(1,1) = 's0'; %Identity Element
    i = ones(n); %Coxeter Element Indices
    s = 1:n-1;
    for l = 1:n
        for j = 1:(n+1-l)
            w = '';
            for k = j:j+l-1
                w = strcat(w,strcat('s',string(k)));
            end
            C(l + 1,i(l)) = w;
            i(l) = i(l) + 1;
        end
    end
    keep = any(~cellfun('isempty',C), 1);
    C = C(:,keep);
end