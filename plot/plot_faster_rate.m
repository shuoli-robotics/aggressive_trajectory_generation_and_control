function plot_faster_rate(fig_num)
load('cc.mat');

x_target = [1:0.5:10];
z_target = [0:-0.5:-5];

fig_num = 10;
figure(fig_num)
[X,Z] = meshgrid(z_target,x_target);
 contourf(X,Z,faster_rate,20);
 colormap(flipud(autumn))
cb = colorbar;
xlabel('z_f[m]');
ylabel('x_f[m]');
end