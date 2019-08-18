clear
clc
close all
dbstop if error
global ref states t inputs

t0 = 0;
tf = 3;
initial_constrains_x = [0 0 0 0];
final_contrains_x = [5 0 0 0];
initial_constrains_y = [0 0 0 0];
final_contrains_y = [0 0 0 0];
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
    c_p_z,c_v_z,c_a_z,c_j_z,c_p_psi,c_v_psi,c_a_psi,tf] = ...
    generate_minimum_snap_trajectories(initial_constrains_x,final_contrains_x,...
    initial_constrains_y,final_contrains_y,...
    initial_constrains_z,final_contrains_z,...
    initial_constrains_psi,final_contrains_psi);


time_step = 1/500;
states = zeros(floor(tf-t0)/time_step,9);
inputs = zeros(floor(tf-t0)/time_step,4);
ref = zeros(floor(tf-t0)/time_step,10);
t = zeros(floor(tf-t0)/time_step,1);
states(1,:) = [initial_constrains_x(1) initial_constrains_y(1) initial_constrains_z(1)...
    initial_constrains_x(2) initial_constrains_y(2) initial_constrains_z(2) 0 0 0];


for i = 1:(tf-t0)/time_step-1
    if i == 1
        t(i) = t0 + i * time_step;
        ref(i,1) = polyval(c_p_x,t(i));
        ref(i,2) = polyval(c_p_y,t(i));
        ref(i,3) = polyval(c_p_z,t(i));
        ref(i,10) = polyval(c_p_psi,t(i));
        ref(i,4) = polyval(c_v_x,t(i));
        ref(i,5) = polyval(c_v_y,t(i));
        ref(i,6) = polyval(c_v_z,t(i));
        ref(i,7) = polyval(c_a_x,t(i));
        ref(i,8) = polyval(c_a_y,t(i));
        ref(i,9) = polyval(c_a_z,t(i));
    end

    [angular_rate_ff,T_ff] = feed_forward_controller(c_v_x,c_v_y,c_v_z,...
                                                 c_a_x,c_a_y,c_a_z,...   
                                                 c_j_x,c_j_y,c_j_z,...
                                                 c_p_psi,c_v_psi,t(i));

    [angular_rate_fb,T] = feedback_controller_2(ref(i,:),states(i,:));
                            
    angular_rate = angular_rate_ff + angular_rate_fb;
    inputs(i,:) = [angular_rate' T];
    states(i+1,:) =  states(i,:) + time_step * drone_model(states(i,:),inputs(i,:))';
    
    t(i+1) = t0 + (i+1) * time_step;
    ref(i+1,1) = polyval(c_p_x,t(i+1));
    ref(i+1,2) = polyval(c_p_y,t(i+1));
    ref(i+1,3) = polyval(c_p_z,t(i+1));
    ref(i+1,10) = polyval(c_p_psi,t(i+1));
    ref(i+1,4) = polyval(c_v_x,t(i+1));
    ref(i+1,5) = polyval(c_v_y,t(i+1));
    ref(i+1,6) = polyval(c_v_z,t(i+1));
    ref(i+1,7) = polyval(c_a_x,t(i+1));
    ref(i+1,8) = polyval(c_a_y,t(i+1));
    ref(i+1,9) = polyval(c_a_z,t(i+1));
end


plot_main();

temp = 1;