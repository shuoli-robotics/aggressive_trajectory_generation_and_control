function pr = verify_p_r(p,r)
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
end