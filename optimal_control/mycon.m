function [c,ceq] = mycon(x)
global N initial_states final_states

for i = 2:N
    %% initial constraints
    if i == 1
        ceq(1:6) = x(1:6) - initial_states;
    end
    if i == N
        temp = 1;
    end
    %% x_i - x_(i-1) - deltaT * drone_model(x(i-1),u(i-1)) = 0
    ceq(i*6+1 : i*6+6) = ...
        x(8*(i-1)+1:8*(i-1)+6)- x(8*(i-2)+1:8*(i-2)+6) - ...
        x(end)*drone_model(x(8*(i-2)+1:8*(i-2)+6),x(8*(i-2)+7:8*(i-2)+8))';
end

%% final constrants
ceq = [ceq'; x((N-1)*8+1:(N-1)*8+6) - final_states];
c = [];

end


function [dx] = drone_model(x,u)
m = 0.389;
Kx = -0.5;
Kz = -0.5;
g = 9.8;
L = 0.08;
I = 0.001242;
vx = x(3);
vz = x(4);
theta = x(5);
q = x(6);
F1 = u(1);
F2 = u(2);

dx = [vx;...
        vz;...
        (F1+F2)*sin(theta)/m + vx*Kx;...
        (F1+F2)*cos(theta)/m + vz*Kz + g;...
        q;...
        (F1-F2)*L/I
        ];
end