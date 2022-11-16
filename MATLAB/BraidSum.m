function c = BraidSum(i,j,m)
    c = 0;
    for k = i:j-1
        if k-i <= j-i-1 && 2*(j-i)-1 <= m+k+1-2*i
            c = c + nchoosek(j-i-1,k-i)^2*nchoosek(m+k+1-2*i,2*(j-i)-1)*factorial(j-1)^2/(k*factorial(i-1)^2);
        end
    end
end

