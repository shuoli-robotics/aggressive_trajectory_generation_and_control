clear
clc
close all

dbstop if error

poly_order = 5;
p = (-1).^round(rand(poly_order+1,1)) .* round(3* rand(poly_order+1,1));

p_1 = polyder(p); 
p_2 = polyder(p_1); 
p_3 = polyder(p_2);
p_4 = polyder(p_3); 

r = 4;
tau = 2;

[J] = verify_J_r(p,r,tau);

[Q_r] = calculate_Q_r(poly_order+1,r,tau);
J_temp = flip(p')*Q_r*flip(p);

p4_square = conv(p_4,p_4);
q = polyint(p4_square);
a = 0;
b = tau;
I = diff(polyval(q,[a b]));

temp = 1;