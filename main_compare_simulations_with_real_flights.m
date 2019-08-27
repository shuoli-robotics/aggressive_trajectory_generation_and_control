clear
clc
close all
dbstop if error

figure(1)
hold on;
grid on;
xlabel('time[s]');
ylabel('x[m]');
figure(2)
hold on;
grid on;
xlabel('time[s]');
ylabel('z[m]');
figure(3)
hold on;
grid on;
xlabel('time[s]');
ylabel('dq cmd[rad/s]');
% flight log: x_f  z_f   log_number controller: 1 - 'DF' 2 - 'NN'
flight_log = [31         1;...
              32         2];
          
for k = 1:size(flight_log,1)
    OB = import_onboard_data(sprintf('%0.5d',flight_log(k,1)));

   
    if flight_log(k,2) == 1
        figure(1)
        plot(OB.TIME(OB.MANEUVER_START:OB.MANEUVER_STOP)-OB.TIME(OB.MANEUVER_START),OB.X(OB.MANEUVER_START:OB.MANEUVER_STOP));
        plot(OB.TIME(OB.MANEUVER_START:OB.MANEUVER_STOP)-OB.TIME(OB.MANEUVER_START),OB.X_REF(OB.MANEUVER_START:OB.MANEUVER_STOP));
        figure(2)
        plot(OB.TIME(OB.MANEUVER_START:OB.MANEUVER_STOP)-OB.TIME(OB.MANEUVER_START),OB.Z(OB.MANEUVER_START:OB.MANEUVER_STOP));
        plot(OB.TIME(OB.MANEUVER_START:OB.MANEUVER_STOP)-OB.TIME(OB.MANEUVER_START),OB.Z_REF(OB.MANEUVER_START:OB.MANEUVER_STOP));
    else
        figure(1)
        plot(OB.TIME(OB.MANEUVER_START:OB.MANEUVER_STOP)-OB.TIME(OB.MANEUVER_START),OB.X(OB.MANEUVER_START:OB.MANEUVER_STOP));
        figure(2)
        plot(OB.TIME(OB.MANEUVER_START:OB.MANEUVER_STOP)-OB.TIME(OB.MANEUVER_START),OB.Z(OB.MANEUVER_START:OB.MANEUVER_STOP));
    end
    figure(3)
    plot(OB.TIME(OB.MANEUVER_START:OB.MANEUVER_STOP)-OB.TIME(OB.MANEUVER_START),OB.dq_cmd(OB.MANEUVER_START:OB.MANEUVER_STOP))

end