function [SIM] = simulate_NN(deltaT)

global kp

kp = 50;

addpath("/usr/local/lib/");
addpath("/usr/local/include/esa_nn");
if not(libisloaded('libesa_nn'))
    loadlibrary('libesa_nn','esa_simulation.h','addheader','nn.h','addheader','nn_params.h','addheader','pd_gains.h')
end

 libfunctions('libesa_nn','-full')
%a= calllib('libesa_nn','test_print',1);

simTime = 10;
simStep = 1/512;

states = zeros(simTime/simStep,7);
states(1,:) = [0 -1.5 0 0 0 0 0];
inputs = zeros(simTime/simStep,2);
inputs(1,:) = [-9.8 0];
time = zeros(simTime/simStep,1);

% states: x z vx vz theta q dq
% A state, dq, is added to simulate the delay of our real drone's rate acceleration controller 
% In real drone, NED frame is used. So x == x_nn vx == vx_nn z == -z_nn
% vz == -vz_nn theta = -theta_nn q = -q_nn

for i = 2:length(time)
    time(i) = (i-1)*simStep;
    currentStates = [5-states(i-1,1), -states(i-1,3),-states(i-1,2)-1.0 -states(i-1,4) -states(i-1,5) -states(i-1,6)];
    control_temp = [0 0];
    [~,control] = calllib('libesa_nn','nn',currentStates,control_temp);
    F_min = 1.76;
    F_max = 2.35;
    FL = F_min + control(1)*(F_max - F_min);
    FR = F_min + control(2)*(F_max - F_min);
    theta = states(i-1,5);
    a_z_b_cmd = -(FL+FR)/0.389;
    %a_z_b_cmd = -9.8;
    I_xx = 0.001242;
    L = 0.08;
    dq_cmd = (FL-FR)/I_xx*L;
    inputs(i-1,:) = [a_z_b_cmd dq_cmd];
    states(i,:) = states(i-1,:) + simStep * drone_model(states(i-1,:),[a_z_b_cmd dq_cmd]);  
end

SIM.X = states(:,1);
SIM.Z = states(:,2);
SIM.VX = states(:,3);
SIM.VZ = states(:,4);
SIM.THETA = states(:,5);
SIM.Q = states(:,6);
SIM.TIME = time+deltaT;

% figure(1)
% subplot(2,1,1)
% grid on
% plot(time,states(:,1));
% ylabel('x[m]');
% subplot(2,1,2)
% grid on
% plot(time,states(:,2));
% ylabel('z[m]');
% xlabel('time [s]')
% 
% figure(2)
% subplot(2,1,1)
% grid on
% plot(time,states(:,3));
% ylabel('vx[m/s]');
% subplot(2,1,2)
% grid on
% plot(time,states(:,4));
% ylabel('vz[m]');
% xlabel('time [s]')
% 
% figure(3)
% subplot(3,1,1)
% grid on
% plot(time,states(:,5));
% ylabel('theta[rad]');
% subplot(3,1,2)
% grid on
% plot(time,states(:,6));
% ylabel('q[rad/s]');
% subplot(3,1,3)
% grid on
% hold on
% plot(time,states(:,7));
% plot(time,inputs(:,2),':');
% legend('dq','dq_nn')
% ylabel('dq[rad/s^2]');
% xlabel('time [s]')

end



