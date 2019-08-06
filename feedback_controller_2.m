function [omega,T] = feedback_controller_2(p_ref,v_ref,a_ref,states)

k_p = 2;
k_v = 1;
k_att = 5;

g = 9.8;
z_w = [0 0 1]';
D = [-0.5 0 0; 0 -0.5 0; 0 0 -0.5];
K_pos = [k_p 0 0;0 k_p 0;0 0 k_p];
K_vel = [k_v 0 0;0 k_v 0;0 0 k_v];
phi = states(7);
theta = states(8);
psi = states(9);

R_E_B = [cos(theta)*cos(psi) cos(theta)*sin(psi) -sin(theta);...
     sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi)...
     sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi) sin(phi)*cos(theta);...
     cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi)...
     cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi) cos(phi)*cos(theta)];

a_fb = K_pos * (p_ref-states(1:3)')+K_vel*(v_ref-states(4:6)');
a_rd = R_E_B'*D*R_E_B*v_ref;

a_des = a_ref + a_fb - a_rd - g*z_w;   % desired thrust vector

z_b_des = -a_des / norm(a_des);
y_c = [-sin(psi) cos(psi) 0]';    % todo: maybe use desired psi instead of current psi
x_b_des = cross(y_c,z_b_des)/ norm(cross(y_c,z_b_des));
y_b_des = cross(z_b_des,x_b_des);
T = a_des' * z_b_des;

R = [x_b_des y_b_des z_b_des];
euler = rotm2eul(R);
psi_des = euler(1);
theta_des = euler(2);
phi_des = euler(3);

omega = k_att * [phi_des-phi; theta_des-theta; psi_des-psi];

end