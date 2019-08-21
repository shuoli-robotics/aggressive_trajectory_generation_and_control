clear
clc
close all

dbstop if error

global N initial_states final_states

%% initialization of optimal control problem

% Discrete time window t0 - tf into N-1 pieces
N = 100;                                

% Generate a feasible trajectory

initial_constrains_x = [0 0 0 0];
final_contrains_x = [5 0 0 0];
initial_constrains_y = [0 0 0 0];
final_contrains_y = [0 0 0 0];
initial_constrains_z = [-1.5 0 0 0];
final_contrains_z = [-2.5 0 0 0];
initial_constrains_psi = [0 0 0 0];
final_contrains_psi = [0 0 0 0];
variables = generate_a_feasible_trajectory(initial_constrains_x,final_contrains_x,...
    initial_constrains_y,final_contrains_y,initial_constrains_z,final_contrains_z,...
    initial_constrains_psi,final_contrains_psi);


%% prepare for fmincon
ub = zeros(length(variables),1);
lb = zeros(length(variables),1);
p = 1;
for i = 1:length(variables)
    if rem(p,5) == 0
        ub(i) = 45/180*pi;
        lb(i) = -45/180*pi;
    elseif rem(p,7) == 0 || rem(p,8) == 0
        ub(i) = -1.76;
        lb(i) = -2.35;
    else
        ub(i) = 100;
        lb(i) = -100;
    end
    p = p + 1;
    if p > 8
        p = 1;
    end
end
initial_states = [initial_constrains_x(1) initial_constrains_z(1) initial_constrains_x(2) initial_constrains_z(2) 0 0]';
final_states = [final_contrains_x(1) final_contrains_z(1) final_contrains_x(2) final_contrains_z(2) 0 0]';
A = [];
b = [];
Aeq = [];
beq = [];
options = optimoptions(@fminunc,'Display','iter');
%x = fmincon(@optimal_object,variables,A,b,Aeq,beq,lb,ub,@mycon,options);
x = ga(@optimal_object,length(variables),A,b,Aeq,beq,lb,ub,@mycon,options);
plot_variables(x,N);
 temp = 1;   