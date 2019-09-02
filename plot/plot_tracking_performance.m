function [] = plot_tracking_performance(fig_num)
global ref states t

figure(fig_num)
subplot(2,1,1)
hold on
grid on
plot(t,ref(:,1),'r--','LineWidth',2);
plot(t,states(:,1),'k');
legend('reference','real')
ylabel('x[m]')
subplot(2,1,2)
hold on
grid on
plot(t,ref(:,3),'r--','LineWidth',2);
plot(t,states(:,3),'k');
ylabel('z[m]')
xlabel('time[s]')

end