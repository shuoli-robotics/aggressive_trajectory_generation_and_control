function [x] = generate_optimal_trajectory(N,t0,tf,x0,xf)

Q_R = calculate_Q_r(N+1,4,tf-t0);
n = N+1;
f = zeros(1,n);

A0 = zeros(4,n);
Af = zeros(4,n);
for r = 0:3
    for i = r:n-1
        A0(r+1,i+1) =  cumprod(r,i) * t0^(i-r);
        Af(r+1,i+1) =  cumprod(r,i) * tf^(i-r);
    end
end
Aeq = [A0;Af];
A = []; b = [];

beq = [x0';xf'];

p = quadprog(Q_R,f,A,b,Aeq,beq);
p = flip(p);

t = t0:0.01:tf;
x = polyval(p,t);
plot(t,x);

end


function [accum] = cumprod(r,i)
    accum = 1;
    for m = 0:r-1
        accum = accum * (i-m);
    end
end