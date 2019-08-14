function [J] = verify_J_r(p,r,tau)
N = length(p)-1;
p = flip(p);
J = 0;

for m = 0:2*(N-r)
    sum = 0;
    for n = 0:(N-r)
        if (m-n) > (N-r) || n > m
            continue;
        end
        sum = sum + cumprod(r,n,m)*p(n+r+1)*p(m-n+r+1)*tau^(m+1)/(m+1);
    end
    J = J + sum;
end


end

function [accum] = cumprod(r,n,m)
    accum = 1;
    for j = 0:r-1
        accum = accum * (n+r-j)*(m-n+r-j);
    end
end