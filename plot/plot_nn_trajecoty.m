function [] = plot_nn_trajecoty(fig_num)
global states states_nn ref t inputs inputs_nn

for i = 1:size(states_nn,1)
    if norm([states_nn(i,1) states_nn(i,2)]-[5.0 -2.5]) < 0.01
       stop_nn = i; 
       break;
    end 
end

inputs_nn(1,:) = inputs_nn(2,:);

figure(fig_num)
subplot(2,1,1)
hold on
grid on
plot(t(1:stop_nn),states_nn(1:stop_nn,1),'k');
ylabel('x[m]')
subplot(2,1,2)
hold on
grid on
plot(t(1:stop_nn),states_nn(1:stop_nn,2),'k');
ylabel('z[m]')
xlabel('time[s]')

figure(fig_num+1)
subplot(2,1,1)
hold on
grid on
plot(t(1:stop_nn),inputs_nn(1:stop_nn,1),'k');
ylabel('F_1[N]')
subplot(2,1,2)
hold on
grid on
plot(t(1:stop_nn),inputs_nn(1:stop_nn,2),'k');
ylabel('F_2[N]')
xlabel('time[s]')

end