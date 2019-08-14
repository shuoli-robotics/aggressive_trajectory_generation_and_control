function coef = get_coef_of_r_order(p,r,order)
pr = zeros(length(p)-r,1);
p = flip(p);

for i = 1:length(pr)
    k = i-1;
    sum = 1;
    for j = 0 : r-1
        sum = sum * (k+r-j);
    end
    pr(i) = sum * p(k+r+1);
end

coef = pr(order+1);

end