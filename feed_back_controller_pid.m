function [deltaOmega,deltaT] = feed_back_controller_pid(pos_ref,psi_ref,states,T)

k_p = 2;
k_v = 0.5;
k_att = 0.05;

psi = states(9);

R_z = [cos(psi) -sin(psi) 0;sin(psi) cos(psi) 0;0 0 1];

deltaAcc = R_z * (k_v * (k_p * (pos_ref(1:3)' - states(1:3)') - states(4:6)'));

temp = deltaAcc(1:2) * k_att;
p = temp(1); q = temp(2); r = (psi_ref-psi)*k_att;
deltaOmega = [p q r];
deltaT = deltaAcc * k_att;

end