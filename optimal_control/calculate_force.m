function F = calculate_force(drate,T)
    I = 0.001242;
    L = 0.08;
    m = 0.389;
    A = [1 1;1 -1];
    b = [T*m;I*drate(2)/L];
    F = linsolve(A,b)';
end