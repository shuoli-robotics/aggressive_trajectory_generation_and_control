function [] = plot_thrust(fig_num)
global  t inputs

dRate = diff(inputs)/0.002;
thrust = zeros(size(dRate,1),2);

I = 0.001242;
L = 0.08;
m = 0.389;
A = [1 1;1 -1];

for i = 1:size(thrust,1)
    b = [abs(inputs(i,4))*m;I*dRate(i,2)/L];
    thrust(i,:) = linsolve(A,b)';
end

time = t(1:end-1);
figure(fig_num)
subplot(2,1,1)
grid on
plot(time,thrust(:,1));
ylabel('F1[N]')
subplot(2,1,2)
grid on
plot(time,thrust(:,2));
ylabel('F2[N]')
xlabel('time[s]')

end