function plot_faster_rate(fig_num)
load('aa.mat');

x_target = [1:0.5:10.5];
z_target = [0:-0.5:-5.5];

figure(fig_num)
[X,Z] = meshgrid(z_target,x_target);
 contourf(X,Z,faster_rate,20);
 colormap(flipud(autumn))
  cb = colorbar;
end