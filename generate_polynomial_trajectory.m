function [c_p,c_v,c_a,c_j] = generate_polynomial_trajectory(initial_constrains,final_contrains,t0,tf)
x0 = initial_constrains(1);
v0 = initial_constrains(2);
a0 = initial_constrains(3);

xf = final_contrains(1);
vf = final_contrains(2);
af = final_contrains(3);

A = [t0^5       t0^4       t0^3        t0^2     t0^1     1;...
      tf^5        tf^4        tf^3        tf^2     tf^1      1;...
      5*t0^4    4*t0^3     3*t0^2    2*t0^1   1        0;...
      5*tf^4     4*tf^3     3*tf^2     2*tf^1   1        0;...
      20*t0^3   12*t0^2   6*t0^1     2         0       0;...
      20*tf^3   12*tf^2    6*tf^1      2        0        0];

b = [x0 xf v0 vf a0 af]';

c_p = inv(A)*b;
%c_v = [5*c_p(1)   4*c_p(2)   3*c_p(3)  2*c_p(4)  c_p(5)]; 
c_v = polyder(c_p);
%c_a = [20*c_p(1) 12*c_p(2)  6*c_p(3)  2*c_p(4)]; 
c_a = polyder(c_v);

c_j = polyder(c_a);


end