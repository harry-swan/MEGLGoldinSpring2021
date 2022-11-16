function c = TheoremSum2(i,j,m)
    c = sym(zeros(m));
    t = sym('t');
    for a = 0:min(j-i-1,i-1)
        for b = 0:min(j-i-a-1,m+1-j)
            p = factorial(j-i-1-a-b)*nchoosek(j-i-1,a)^2*nchoosek(j-i-1-a,b)^2*t^(j-i-1-a-b);
            c(i-a,j+b-1) = c(i-a,j+b-1)+ p;
        end
    end
end