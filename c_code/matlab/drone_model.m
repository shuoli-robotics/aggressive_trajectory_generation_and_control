function dStates = drone_model(states,inputs)
global kp
x = states(1);
z = states(2);
vx = states(3);
vz = states(4);
theta = states(5);
q = states(6);
dq = states(7);

a_z_b = inputs(1);
dq_nn = inputs(2);

dot_x = vx;
dot_z = vz;
dot_vx = a_z_b * sin(theta)-0.5*vx;
dot_vz = a_z_b * cos(theta)+9.8;
dot_Theta = q;
dot_q = dq;
dot_dq = (dq_nn - dq) * kp;


dStates = [dot_x dot_z dot_vx dot_vz dot_Theta dot_q dot_dq];
end