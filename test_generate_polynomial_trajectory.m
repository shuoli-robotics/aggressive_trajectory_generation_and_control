clear
clc
close all

t0 = 0;
tf = 10;
initial_constrains_x = [0 0 0];
final_contrains_x = [5 0 0];
initial_constrains_y = [0 0 0];
final_contrains_y = [2 0 0];
initial_constrains_z = [-1.5 0 0];
final_contrains_z = [-2.5 0 0];
initial_constrains_psi = [0 0 0];
final_contrains_psi = [0 0 0];


[cx,c_v_x,c_a_x] = generate_polynomial_trajectory(initial_constrains_x,final_contrains_x,t0,tf);
[cy,c_v_y,c_a_y] = generate_polynomial_trajectory(initial_constrains_y,final_contrains_y,t0,tf);
[cz,c_v_z,c_a_z] = generate_polynomial_trajectory(initial_constrains_z,final_contrains_z,t0,tf);
[cPsi,c_v_psi,c_a_psi] = generate_polynomial_trajectory(initial_constrains_psi,final_contrains_psi,t0,tf);

time_step = 0.01;
x = zeros((tf-t0)/time_step,1);
y = zeros((tf-t0)/time_step,1);
z = zeros((tf-t0)/time_step,1);
psi = zeros((tf-t0)/time_step,1);
t = zeros((tf-t0)/time_step,1);

for i = 1:(tf-t0)/time_step
    t(i) = t0 + i * 0.01;
    x(i) = polyval(cx,t(i));
    y(i) = polyval(cy,t(i));
    z(i) = polyval(cz,t(i));
end

figure(1)
subplot(3,1,1)
hold on
grid on
plot(t,x);
ylabel('x[m]')
subplot(3,1,2)
hold on
grid on
plot(t,y);
ylabel('y[m]')
subplot(3,1,3)
hold on
grid on
plot(t,z);
ylabel('z[m]')
xlabel('time[s]')

temp = 1;