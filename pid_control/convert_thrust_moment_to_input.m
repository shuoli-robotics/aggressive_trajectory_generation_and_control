function [inputs] = convert_thrust_moment_to_input(F,M)
L = 0.08;
I = 0.001242;

inputs = [0.5 0.5;-0.5 0.5]*[M*I/L F]';

if inputs(1) > -1.76
    inputs(1) = -1.76;
elseif inputs(1) < -2.35
    inputs(1) = -2.35;
end

if inputs(2) > -1.76
    inputs(2) = -1.76;
elseif inputs(2) < -2.35
    inputs(2) = -2.35;
end

inputs = inputs';


end