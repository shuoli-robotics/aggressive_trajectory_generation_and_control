function [Q] = calculate_Q_r(n,r,tau)
% r is the rth order of the derivative
% tau is the intergration time
% n is the number of the coeffcient of the original polynomial

N = n-1;
Q = zeros(n,n);

for m = 0:2*(N-r)
    for n = 0:(N-r)
        if (m-n) > (N-r) || n > m
            continue;
        end
        Q(n+r+1,m-n+r+1) =  cumprod(r,n,m)*tau^(m+1)/(m+1);
    end
end


end

function [accum] = cumprod(r,n,m)
    accum = 1;
    for j = 0:r-1
        accum = accum * (n+r-j)*(m-n+r-j);
    end
end