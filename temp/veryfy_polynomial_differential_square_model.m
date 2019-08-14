clear
clc
close all

dbstop if error

poly_order = 40;
p = (-1).^round(rand(poly_order,1)) .* round(3* rand(poly_order,1));
%p = [1 2 -1 1 -3 -2];

p_1 = polyder(p); 
p_2 = polyder(p_1); 
p_3 = polyder(p_2);
p_4 = polyder(p_3); 

r = 4;
tau = 1;
%coef = get_coef_of_r_order(p,r,4)
%pr = verify_p_r(p,r);
%[J_r] = calculate_J_r(n-1,r,p,tau);
[J] = verify_J_r(p,r,tau);

% [Q_r] = calculate_Q_r(r,tau,n);
% J = flip(p')*Q_r*flip(p);

p4_square = conv(p_4,p_4);
q = polyint(p4_square);
a = 0;
b = tau;
I = diff(polyval(q,[a b]));

temp = 1;