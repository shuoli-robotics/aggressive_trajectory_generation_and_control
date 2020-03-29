function [states,inputs,time] = plot_variables(variables,N)
states = zeros(N,6);
inputs = zeros(N,2);
time = zeros(N,1);
time_step = variables(end);
for i = 1:N
    time(i) = (i-1)*time_step;
    states(i,1:6) = variables((i-1)*8+1 : (i-1)*8+6);
    inputs(i,1:2) = variables((i-1)*8+7 : (i-1)*8+8);
end

% figure(1)
% subplot(2,1,1)
% hold on
% plot(time,states(:,1));
% %ylabel('x[m]');
% subplot(2,1,2)
% hold on
% plot(time,states(:,2));
% %ylabel('z[m]');
% 
% figure(2)
% subplot(2,1,1)
% plot(time,states(:,3));
% ylabel('v_x[m/s]');
% subplot(2,1,2)
% plot(time,states(:,4));
% ylabel('v_z[m/s]');
% 
% figure(3)
% subplot(2,1,1)
% plot(time,states(:,5)/pi*180);
% ylabel('theta[deg]');
% subplot(2,1,2)
% plot(time,states(:,6)/pi*180);
% ylabel('q[deg/s]');
% xlabel('time [s]');
% 
% figure(4)
% subplot(2,1,1)
% plot(time,inputs(:,1));
% ylabel('F_1[N]')
% subplot(2,1,2)
% plot(time,inputs(:,2));
% ylabel('F_2[N]')
% xlabel('time [s]');


end