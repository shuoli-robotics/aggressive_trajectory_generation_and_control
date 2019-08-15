function [d_states] = drone_model_dq(states,inputs)

D = [-0.4 0 0; 0 -0.6 0; 0 0 -0.6];
g = 9.8;

v_x = states(4);
v_y = states(5);
v_z = states(6);
phi = states(7);
theta = states(8);
psi= states(9);
p = states(10);
q = states(11);
r = states(12);

dp = inputs(1);
dq = inputs(2);
dr = inputs(3);
T = inputs(4);



R_d_angle = [1 tan(theta)*sin(phi) tan(theta)*cos(phi);...
    0 cos(phi) -sin(phi);...
    0 sin(phi)/cos(theta) cos(phi)/cos(theta)];

R_E_B = [cos(theta)*cos(psi) cos(theta)*sin(psi) -sin(theta);...
     sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi)...
     sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi) sin(phi)*cos(theta);...
     cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi)...
     cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi) cos(phi)*cos(theta)];
 
 R_B_E = R_E_B';

 dp = [v_x v_y v_z]';
 dv = [0 0 g]' + R_B_E*[0 0 T]' + R_B_E*D*R_E_B*[v_x v_y v_z]';
 dPhi = R_d_angle*[p q r]';
 drate = [dp dq dr]';
 
 d_states = [dp;dv;dPhi;drate];
 
end