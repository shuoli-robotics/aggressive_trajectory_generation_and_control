function [d_states] = drone_model_attitude(states,inputs)

D = [-0.5 0 0; 0 -0.5 0; 0 0 -0.5];
g = 9.8;

v_x = states(4);
v_y = states(5);
v_z = states(6);
phi = inputs(1);
theta = inputs(2);
psi= inputs(3);
T = inputs(4);

R_E_B = [cos(theta)*cos(psi) cos(theta)*sin(psi) -sin(theta);...
     sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi)...
     sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi) sin(phi)*cos(theta);...
     cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi)...
     cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi) cos(phi)*cos(theta)];
 
 R_B_E = R_E_B';

 dp = [v_x v_y v_z]';
 dv = [0 0 g]' + R_B_E*[0 0 T]' + R_B_E*D*R_E_B*[v_x v_y v_z]';
 
 d_states = [dp;dv];
 
end