function [deltaOmega,deltaT] = feed_back_controller(pos_ref,psi_ref,states,T)
global log i

k_p = 1;
k_v = 0.5;
k_att = 5;
k_T = 0.3;

phi = states(7);
theta = states(8);
psi = states(9);

R_z = [cos(psi) -sin(psi) 0;sin(psi) cos(psi) 0;0 0 1];

deltaAcc = R_z * (k_v * (k_p * (pos_ref(1:3)' - states(1:3)') - states(4:6)'));
% log.delta_a_x(i) = deltaAcc(1);
% log.delta_a_y(i) = deltaAcc(2);
% log.delta_a_z(i) = deltaAcc(3);
%deltaAcc = [0 0 0]';
% Taylor one order expansion
% if abs(max(deltaAcc)) < 0.05
%     deltaAcc = [0 0 0]';
% end

G = [-sin(phi)*sin(theta)*T cos(phi)*cos(theta)*T cos(phi)*sin(theta);...
    -cos(phi)*T  0  -sin(phi);...
    -sin(phi)*cos(theta)*T -cos(phi)*sin(theta)*T cos(phi)*cos(theta)];

incremental_input = inv(G)*deltaAcc;
deltaPsi = psi_ref-psi;

% log.delta_phi(i) = incremental_input(1);
% log.delta_theta(i) = incremental_input(2);
% log.deltaT(i) = incremental_input(3);
% R_d_angle = [1 tan(theta)*sin(phi) tan(theta)*cos(phi);...
%     0 cos(phi) -sin(phi);...
%     0 sin(phi)/cos(theta) cos(phi)/cos(theta)];
% deltaOmega = linsolve(R_d_angle,[incremental_input(1:2);deltaPsi]);

deltaOmega = k_att * [incremental_input(1:2);deltaPsi];
deltaT = k_T* incremental_input(3);
if i == 500
    temp = 1;
end
% log.delta_p(i) = deltaOmega(1);
% log.delta_q(i) = deltaOmega(2);
end