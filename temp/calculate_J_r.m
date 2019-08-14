function [J_r] = calculate_J_r(N,r,p,tau)
J_r = 0;

for n = 0:2*N
    sum = 0;
    for jj = 0:N
        sum = sum + cumprod(n,jj,r)*p(N-jj)*p(n-(N-jj))*tau^(n-2*r+1)/(n-2*r+1);
    end
    J_r = J_r + sum;
end


end


function [accum] = cumprod(n,jj,r)
    accum = 1;
    for m = 0 : r-1
        accum = accum * (jj-m) * (n-jj-m);
    end
end