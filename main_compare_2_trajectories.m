clear
clc
close all

initial_constrains_x = [0 0 0 0];
final_contrains_x = [15 0 0 0];
t0 = 1;
tf = 50;

%% minimum snap trajectory
N = 8;
[c_p_x_1,c_v_x_1,c_a_x_1,c_j_x_1] = generate_optimal_trajectory(N,t0,tf,initial_constrains_x,final_contrains_x);
t = t0:0.01:tf;
x_minimum_snap =  polyval(c_p_x_1,t);

q = polyint(conv(c_v_x_1,c_v_x_1));
snap_optimal = diff(polyval(q,[t0 tf]));



%% nomial polynomial trajectory
[c_p_x,c_v_x,c_a_x,c_j_x] = generate_polynomial_trajectory(initial_constrains_x,final_contrains_x,t0,tf);
x_polynomial =  polyval(c_p_x,t);
q = polyint(conv(c_v_x,c_v_x));
snap_normal = diff(polyval(q,[t0 tf]));

%%
figure(1)
hold on
grid on
plot(t,x_minimum_snap);
plot(t,x_polynomial);
legend('minimum snap','normal polynomial');
xlabel('time[s]');
ylabel('x[m]');

temp = 1;
