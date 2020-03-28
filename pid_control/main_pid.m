function main_pid(x0,z0,x_f,z_f,tf)

simStep = 1/500;
states = zeros(tf/simStep,6);
inputs = zeros(tf/simStep,2);
x_cmd = zeros(tf/simStep,1);
z_cmd = zeros(tf/simStep,1);
vx_cmd = zeros(tf/simStep,1);
vz_cmd = zeros(tf/simStep,1);
theta_cmd = zeros(tf/simStep,1);
q_cmd = zeros(tf/simStep,1);
M_cmd = zeros(tf/simStep,1);
T_cmd = zeros(tf/simStep,1);
time = zeros(tf/simStep,1);
states(1,:) = [x0 z0 0 0 0 0]; 
g = 9.8;
kx = 1;
kz = 1.5;
k_vx = -0.2;
k_vz = 1;
k_theta = 6;
k_q = 20;

for i = 1:length(time)-1
    time(i) = (i-1)*simStep;
    x_cmd(i) = x_f;
    z_cmd(i) = z_f;
    vx_cmd(i) = kx*(x_cmd(i)-states(i,1));
    vz_cmd(i) = kz*(z_cmd(i)-states(i,2));
%     vx_cmd(i) = 1;
%     vz_cmd(i) = -1;
    theta_cmd(i) = k_vx * (vx_cmd(i)-states(i,3));
%     theta_cmd(i) = 1;
    T_cmd(i) = -g*0.389+k_vz*(vz_cmd(i)-states(i,4));
    
    if T_cmd(i) < -2.35*2 
        T_cmd(i) = -2.35*2;
    elseif T_cmd(i) > -1.76*2
        T_cmd(i) = -1.76*2;
    end
    
    q_cmd(i) = k_theta * (theta_cmd(i) - states(i,5));
    %q_cmd(i) = 1;
    M_cmd(i) = k_q*(q_cmd(i)-states(i,6));
    inputs(i,:) = convert_thrust_moment_to_input(T_cmd(i),M_cmd(i));
    states(i+1,:) = states(i,:) + simStep*drone_dynamics(states(i,:),inputs(i,:))';
end
time(end) = tf;
inputs(end,:) = inputs(end-1,:);

figure(1)
hold on
subplot(2,1,1)
plot(time,x_cmd);
plot(time,states(:,1));
legend('cmd','trajectory')
ylabel('x[m]')
subplot(2,1,2)
plot(time,z_cmd);
plot(time,states(:,2));
ylabel('z[m]')
xlabel('time[s]');

figure(2)
hold on
subplot(2,1,1)
plot(time,vx_cmd);
plot(time,states(:,3));
legend('cmd','trajectory')
ylabel('v_x[m/s]')
subplot(2,1,2)
plot(time,vz_cmd);
plot(time,states(:,4));
ylabel('v_z[m/s]')
xlabel('time[s]');

figure(3)
hold on
subplot(2,1,1)
plot(time,theta_cmd);
plot(time,states(:,5));
legend('cmd','trajectory')
ylabel('theta[rad]')
subplot(2,1,2)
plot(time,vx_cmd);
plot(time,states(:,6));
ylabel('q[rad/s]')
xlabel('time[s]');

figure(4)
hold on
subplot(2,1,1)
plot(time,T_cmd);
ylabel('thrust cmd [N]')
subplot(2,1,2)
plot(time,M_cmd);
ylabel('M_cmd');
xlabel('time[s]');



figure(5)
hold on
plot(time,inputs(:,1));
plot(time,inputs(:,2));

temp = 1;