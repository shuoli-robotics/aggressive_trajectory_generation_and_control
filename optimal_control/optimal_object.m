function [J] = optimal_object(x)
global N

J = 0;
alpha = 0.2;
for i = 1:N
    J = J + x((i-1)*8+7)^2 + x((i-1)*8+8)^2;
end
J = alpha * J + (1-alpha)*x(end)*(N-1);
end