function [] = debug_plot()
global log states

figure(1)
subplot(3,1,1)
plot(log.t', log.x_ref'-states(1:end-1,1))
grid on
ylabel('error x [m]')
subplot(3,1,2)
plot(log.t', log.y_ref'-states(1:end-1,2))
grid on
ylabel('error y [m]')
subplot(3,1,3)
plot(log.t', log.z_ref'-states(1:end-1,3))
grid on
ylabel('error z [m]')

figure(2)
subplot(3,1,1)
plot(log.t', log.delta_a_x)
grid on
ylabel('error ax [m/s^2]')
subplot(3,1,2)
plot(log.t',log.delta_a_y)
grid on
ylabel('error ay [m/s^2]')
subplot(3,1,3)
plot(log.t', log.delta_a_z)
grid on
ylabel('error az [m/s^2]')

figure(3)
subplot(3,1,1)
plot(log.t', log.delta_phi/pi*180)
grid on
ylabel('delta phi [deg]')
subplot(3,1,2)
plot(log.t', log.delta_theta/pi*180)
grid on
ylabel('delta theta [deg]')
subplot(3,1,3)
plot(log.t', log.deltaT)
grid on
ylabel('delta T [m/s^2]')

end