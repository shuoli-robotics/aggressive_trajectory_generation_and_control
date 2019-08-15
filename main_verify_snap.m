clear
clc
close all

t0 = 0;
tf = 5;
initial_constrains_x = [0 0 0 0];
final_contrains_x = [5 0 0 0];
initial_constrains_y = [0 0 0 0];
final_contrains_y = [2 0 0 0];
initial_constrains_z = [-1.5 0 0 0];
final_contrains_z = [-2.5 0 0 0];
initial_constrains_psi = [0 0 0 0];
final_contrains_psi = [0 0 0 0];

% [c_p_x,c_v_x,c_a_x,c_j_x,c_p_y,c_v_y,c_a_y,c_j_y,...
%     c_p_z,c_v_z,c_a_z,c_j_z,c_p_psi,c_v_psi,c_a_psi] = ...
%     generate_polynomial_trajectories(initial_constrains_x,final_contrains_x,...
%     initial_constrains_y,final_contrains_y,...
%     initial_constrains_z,final_contrains_z,...
%     initial_constrains_psi,final_contrains_psi,t0,tf);

[c_p_x,c_v_x,c_a_x,c_j_x,c_p_y,c_v_y,c_a_y,c_j_y,...
    c_p_z,c_v_z,c_a_z,c_j_z,c_p_psi,c_v_psi,c_a_psi] = ...
    generate_minimum_snap_trajectories(initial_constrains_x,final_contrains_x,...
    initial_constrains_y,final_contrains_y,...
    initial_constrains_z,final_contrains_z,...
    initial_constrains_psi,final_contrains_psi,t0,tf);


time_step = 1/500;
states = zeros((tf-t0)/time_step,9);
x_ref = zeros((tf-t0)/time_step,1);
y_ref = zeros((tf-t0)/time_step,1);
z_ref = zeros((tf-t0)/time_step,1);
v_x_ref = zeros((tf-t0)/time_step,1);
v_y_ref = zeros((tf-t0)/time_step,1);
v_z_ref = zeros((tf-t0)/time_step,1);
a_x_ref = zeros((tf-t0)/time_step,1);
a_y_ref = zeros((tf-t0)/time_step,1);
a_z_ref = zeros((tf-t0)/time_step,1);
psi_ref = zeros((tf-t0)/time_step,1);
t = zeros((tf-t0)/time_step,1);
states(1,:) = [initial_constrains_x(1)-0.5 initial_constrains_y(1)+0.5 initial_constrains_z(1)-0.1...
    initial_constrains_x(2) initial_constrains_y(2) initial_constrains_z(2) 0 0 0 0 0 0];


for i = 1:(tf-t0)/time_step-1
    if i == 1
        t(i) = t0 + i * time_step;
        x_ref(i) = polyval(c_p_x,t(i));
        y_ref(i) = polyval(c_p_y,t(i));
        z_ref(i) = polyval(c_p_z,t(i));
        psi_ref(i) = polyval(c_p_psi,t(i));
        v_x_ref(i) = polyval(c_v_x,t(i));
        v_y_ref(i) = polyval(c_v_y,t(i));
        v_z_ref(i) = polyval(c_v_z,t(i));
        a_x_ref(i) = polyval(c_a_x,t(i));
        a_y_ref(i) = polyval(c_a_y,t(i));
        a_z_ref(i) = polyval(c_a_z,t(i));
    end

    [dq,T_ff] = feed_forward_controller_dq(c_v_x,c_v_y,c_v_z,...
                                                 c_a_x,c_a_y,c_a_z,...   
                                                 c_j_x,c_j_y,c_j_z,...
                                                 c_p_psi,c_v_psi,t(i));
  
    states(i+1,:) =  states(i,:) + time_step * drone_model_dq(states(i,:),[dq' T])';
    
    t(i+1) = t0 + (i+1) * time_step;
    x_ref(i+1) = polyval(c_p_x,t(i+1));
    y_ref(i+1) = polyval(c_p_y,t(i+1));
    z_ref(i+1) = polyval(c_p_z,t(i+1));
    psi_ref(i+1) = polyval(c_p_psi,t(i+1));
    v_x_ref(i+1) = polyval(c_v_x,t(i+1));
    v_y_ref(i+1) = polyval(c_v_y,t(i+1));
    v_z_ref(i+1) = polyval(c_v_z,t(i+1));
    a_x_ref(i+1) = polyval(c_a_x,t(i+1));
    a_y_ref(i+1) = polyval(c_a_y,t(i+1));
    a_z_ref(i+1) = polyval(c_a_z,t(i+1));
end


figure(1)
subplot(3,1,1)
hold on
grid on
plot(t,x_ref);
plot(t,states(:,1));
legend('ref','real')
ylabel('x[m]')
subplot(3,1,2)
hold on
grid on
plot(t,y_ref);
plot(t,states(:,2));
ylabel('y[m]')
subplot(3,1,3)
hold on
grid on
plot(t,z_ref);
plot(t,states(:,3));
ylabel('z[m]')
xlabel('time[s]')
temp = 1;