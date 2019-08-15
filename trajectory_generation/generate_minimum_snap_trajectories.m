function [c_p_x,c_v_x,c_a_x,c_j_x,c_p_y,c_v_y,c_a_y,c_j_y,...
    c_p_z,c_v_z,c_a_z,c_j_z,c_p_psi,c_v_psi,c_a_psi,tf] = ...
    generate_minimum_snap_trajectories(initial_constrains_x,final_contrains_x,...
    initial_constrains_y,final_contrains_y,...
    initial_constrains_z,final_contrains_z,...
    initial_constrains_psi,final_contrains_psi)

N = 8;
time_step = 0.1;
feasible = 1;
t0 = 0;
tf = 10;
rate = zeros(tf/time_step,3);
drate = zeros(1,3);
while(feasible)
    tf = tf - 0.1;
    [c_p_x,c_v_x,c_a_x,c_j_x] = generate_optimal_trajectory(N,t0,tf,initial_constrains_x,final_contrains_x);
    [c_p_y,c_v_y,c_a_y,c_j_y] = generate_optimal_trajectory(N,t0,tf,initial_constrains_y,final_contrains_y);
    [c_p_z,c_v_z,c_a_z,c_j_z] = generate_optimal_trajectory(N,t0,tf,initial_constrains_z,final_contrains_z);
    [c_p_psi,c_v_psi,c_a_psi,c_j_psi] = generate_optimal_trajectory(N,t0,tf,initial_constrains_psi,final_contrains_psi);
 
    for i = 1:size(rate,1)
        t = i * time_step;
        [euler,angular_rate,T] = calculate_states(c_v_x,c_v_y,c_v_z,...
                                                 c_a_x,c_a_y,c_a_z,...   
                                                 c_j_x,c_j_y,c_j_z,...
                                                 c_p_psi,c_v_psi,t);
        rate(i,:) = angular_rate;
       if i ~= 1
           drate = (rate(i,:) -  rate(i-1,:))/time_step;
       end
       feasible = check_feasibility(euler,rate,drate,T); 
       if feasible == 0
           break;
       end
    end
    
end
end

function feasible = check_feasibility(euler,rate,drate,T)
    if T > -10.6 && max(drate<38.3)
        feasible = 1;
    else
        feasible = 0;
    end
end