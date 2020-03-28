function [dx] = drone_dynamics(states,inputs)

m = 0.389;
Kx = -0.5;
Kz = -0.5;
g = 9.8;
L = 0.08;
I = 0.001242;
vx = states(3);
vz = states(4);
theta = states(5);
q = states(6);
F1 = inputs(1);
F2 = inputs(2);

dx = [vx;...
        vz;...
        (F1+F2)*sin(theta)/m + vx*Kx;...
        (F1+F2)*cos(theta)/m + vz*Kz + g;...
        q;...
        (F1-F2)*L/I
        ];
end

