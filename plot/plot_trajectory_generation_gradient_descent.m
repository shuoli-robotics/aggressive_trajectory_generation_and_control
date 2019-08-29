function [] = plot_trajectory_generation_gradient_descent(c_p_x,c_p_z,tf,thrust,t,p)
color = flip(colormap(gray));
figure(201)
hold on
tt = 0:0.05:tf;
xx = zeros(length(tt),1);
zz = zeros(length(tt),1);
for i = 1:length(tt)
    xx(i) = polyval(c_p_x,tt(i));
    zz(i) = polyval(c_p_z,tt(i));
end
subplot(2,1,1)
hold on
grid on
plot(tt,xx,'Color',color(p*3,:));
ylabel('x[m]');
subplot(2,1,2)
hold on
grid on
plot(tt,zz,'Color',color(p*3,:));
ylabel('z[m]');
xlabel('time[s]');

figure(202)
subplot(2,1,1)
hold on
grid on
plot(t(1:end-1),thrust(1:end-1,1),'Color',color(p*3,:));
ylabel('F_1[N]');
subplot(2,1,2)
hold on
grid on
plot(t(1:end-1),thrust(1:end-1,2),'Color',color(p*3,:));
ylabel('F_2[N]');
xlabel('time[s]');

end