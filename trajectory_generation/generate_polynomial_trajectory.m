function [c_p,c_v,c_a,c_j] = generate_polynomial_trajectory(initial_constrains,final_contrains,t0,tf)
x0 = initial_constrains(1);
v0 = initial_constrains(2);
a0 = initial_constrains(3);
j0 =  initial_constrains(4);

xf = final_contrains(1);
vf = final_contrains(2);
af = final_contrains(3);
jf = final_contrains(4);

% A = [t0^5       t0^4       t0^3        t0^2     t0^1     1;...
%       tf^5        tf^4        tf^3        tf^2     tf^1      1;...
%       5*t0^4    4*t0^3     3*t0^2    2*t0^1   1        0;...
%       5*tf^4     4*tf^3     3*tf^2     2*tf^1   1        0;...
%       20*t0^3   12*t0^2   6*t0^1     2         0       0;...
%       20*tf^3   12*tf^2    6*tf^1      2        0        0;...
%       60^t0^2   24*t0      6            0        0        0;...
%       60^tf^2   24*tf      6            0        0        0];
% 
% b = [x0 xf v0 vf a0 af j0 jf]';
n = 8;
A0 = zeros(4,8);
Af = zeros(4,8);

for r = 0:3
    for i = r:n-1
        A0(r+1,i+1) =  cumprod(r,i) * t0^(i-r);
        Af(r+1,i+1) =  cumprod(r,i) * tf^(i-r);
    end
end
A = [A0;Af];
b = [x0 v0 a0 j0 xf vf af jf]';
c_p = inv(A)*b;
c_p = flip(c_p);
%c_v = [5*c_p(1)   4*c_p(2)   3*c_p(3)  2*c_p(4)  c_p(5)]; 
c_v = polyder(c_p);
%c_a = [20*c_p(1) 12*c_p(2)  6*c_p(3)  2*c_p(4)]; 
c_a = polyder(c_v);

c_j = polyder(c_a);


end

function [accum] = cumprod(r,i)
    accum = 1;
    for m = 0:r-1
        accum = accum * (i-m);
    end
end