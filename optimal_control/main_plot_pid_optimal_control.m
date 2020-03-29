clear
clc
close all

load('optimal_control_result');

N = 100;
[OC_states,OC_inputs,OC_time] = plot_variables(x,N);

x0 = 0;
z0 = -1.5;
x_f = 5;
z_f = -2.5;
tf = 4;

[pid_states,pid_inputs,x_cmd,z_cmd,pid_time] = main_pid(x0,z0,x_f,z_f,tf);

figure(1)

figure(1)
subplot(2,1,1)
grid on
hold on
plot(pid_time,x_cmd(:,1),'-.');
plot(pid_time,pid_states(:,1));
plot(OC_time,OC_states(:,1));
legend('setpoint','pid','OC');
ylabel('x[m]');
subplot(2,1,2)
hold on
grid on
plot(pid_time,z_cmd(:,1),'-.');
plot(pid_time,pid_states(:,2));
plot(OC_time,OC_states(:,2));
ylabel('z[m]');
xlabel('time[s]');

figure(2)
subplot(2,1,1)
grid on
hold on
plot(pid_time,pid_states(:,3));
plot(OC_time,OC_states(:,3));
legend('pid','OC');
ylabel('v_x[m/s]');
subplot(2,1,2)
hold on
grid on
plot(pid_time,pid_states(:,4));
plot(OC_time,OC_states(:,4));
ylabel('v_z[m/s]');
xlabel('time[s]');

figure(3)
subplot(2,1,1)
grid on
hold on
plot(pid_time,pid_states(:,5)/pi*180);
plot(OC_time,OC_states(:,5)/pi*180);
legend('pid','OC');
ylabel('theta[deg]');
subplot(2,1,2)
hold on
grid on
plot(pid_time,pid_states(:,6)/pi*180);
plot(OC_time,OC_states(:,6)/pi*180);
ylabel('q[deg/s]');
xlabel('time[s]');

figure(4)
subplot(2,1,1)
grid on
hold on
plot(pid_time,pid_inputs(:,1));
plot(OC_time,OC_inputs(:,1));
legend('pid','OC');
ylabel('F1[N]');
subplot(2,1,2)
hold on
grid on
plot(pid_time,pid_inputs(:,2));
plot(OC_time,OC_inputs(:,2));
legend('pid','OC');
ylabel('F2[N]');
xlabel('time[s]');
temp = 1;