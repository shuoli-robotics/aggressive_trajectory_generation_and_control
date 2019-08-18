function [] = plot_velocity(fig_num)
global ref states t

figure(fig_num)
subplot(3,1,1)
hold on
grid on
plot(t,ref(:,4));
plot(t,states(:,4));
legend('ref','real')
ylabel('v_x[m/s]')
subplot(3,1,2)
hold on
grid on
plot(t,ref(:,5));
plot(t,states(:,5));
legend('ref','real')
ylabel('v_y[m/s]')
subplot(3,1,3)
hold on
grid on
plot(t,ref(:,6));
plot(t,states(:,6));
ylabel('v_z[m/s]')
xlabel('time[s]')

end