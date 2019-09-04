function [] = plot_attitude(fig_num)
global  states t states_nn t_nn

figure(fig_num)
subplot(3,1,1)
hold on
grid on
plot(t,states(:,7)/pi*180);
ylabel('phi[deg]')
subplot(3,1,2)
hold on
grid on
plot(t,states(:,8)/pi*180);
plot(t_nn,states_nn(:,5)/pi*180);
legend('OPT','OOC')
ylabel('theta[deg]')
subplot(3,1,3)
hold on
grid on
plot(t,states(:,9)/pi*180);
ylabel('psi[deg]')
xlabel('time[s]')

end