function c = TheoremSum(i,j,n)
    c = sym(zeros(n-1));
    t = sym('t');
    for k = max(0,j-2*i):(j-i-1)
        for h = max(j+k-n,0):k
            a = factorial(h)*nchoosek(k,h)^2*nchoosek(j-i-1,k)^2*t^h;
            c(1+2*i+k-j,j+k-h-1) = c(1+2*i+k-j,j+k-h-1)+ a;
        end
    end
end