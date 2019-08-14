function [Q_r] = calculate_Q_r(r,tau,n)
% r is the rth order of the derivative
% tau is the intergration time
% n is the number of the coeffcient of the original polynomial

Q_r = zeros(n,n);
for i = 1:n
    for l = 1:n
        if (i>=r && l >=r)
            temp = cumprod(i,l,r);
            Q_r(i,l) = 2*temp*tau^(i+l-2*r+1)/(i+l-2*r+1);
        end
    end
end

end
function [accum] = cumprod(i,l,r)
    accum = 1;
    for m = 1 : r
        accum = accum * (i-m) * (l-m);
    end
end