clear
clc
close all


N = 20;
t0 = 0;
tf = 2;
x0 = [0 0 0 0];
xf = [5 0 0 0];
generate_optimal_trajectory(N,t0,tf,x0,xf)