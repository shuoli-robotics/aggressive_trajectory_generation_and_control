function [] = plot_position(fig_num)
global ref states t

figure(fig_num)
subplot(3,1,1)
hold on
grid on
plot(t,ref(:,1));
plot(t,states(:,1));
legend('ref','real')
ylabel('x[m]')
subplot(3,1,2)
hold on
grid on
plot(t,ref(:,2));
plot(t,states(:,2));
ylabel('y[m]')
subplot(3,1,3)
hold on
grid on
plot(t,ref(:,3));
plot(t,states(:,3));
ylabel('z[m]')
xlabel('time[s]')

end