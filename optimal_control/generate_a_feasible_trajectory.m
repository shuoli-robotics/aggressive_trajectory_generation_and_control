function [variables] = generate_a_feasible_trajectory(initial_constrains_x,final_contrains_x,...
    initial_constrains_y,final_contrains_y,initial_constrains_z,final_contrains_z,...
    initial_constrains_psi,final_contrains_psi)
global N

t0 = 0;
tf = 10;
variables = zeros(1,8*N+1);

[c_p_x,c_v_x,c_a_x,c_j_x,c_p_y,c_v_y,c_a_y,c_j_y,...
    c_p_z,c_v_z,c_a_z,c_j_z,c_p_psi,c_v_psi,c_a_psi] = generate_polynomial_trajectories(initial_constrains_x,final_contrains_x,...
    initial_constrains_y,final_contrains_y,...
    initial_constrains_z,final_contrains_z,...
    initial_constrains_psi,final_contrains_psi,t0,tf);
time_step = (tf-t0)/(N-1);
time = zeros(1,N);
inputs = zeros(N,5);
for i = 1:N
    time(i) = t0 + (i-1) * time_step;
    inputs(i,:) = calculate_states_att(c_v_x,c_v_y,c_v_z,...
        c_a_x,c_a_y,c_a_z,...
        c_j_x,c_j_y,c_j_z,...
        c_p_psi,c_v_psi,time(i));
        variables((i-1)*8+1:(i-1)*8+6) = [polyval(c_p_x,time(i)),...
        polyval(c_p_z,time(i)), polyval(c_v_x,time(i)),polyval(c_v_z,time(i)),inputs(i,5),inputs(i,2)];
    if i ~= 1
        drate =  (inputs(i,:) -  inputs(i-1,:))/time_step;
        variables((i-2)*8+7:(i-2)*8+8) = calculate_force(drate,inputs(i-1,4));
    end
end
variables(end) = time_step;

%plot_variables(variables,N);
end