function [euler,angular_rate,T] = calculate_states(c_v_x,c_v_y,c_v_z,...
                                                 c_a_x,c_a_y,c_a_z,...   
                                                 c_j_x,c_j_y,c_j_z,...
                                                 c_p_psi,c_v_psi,t)
g = 9.8;
dx = -0.5;
dy = -0.5;
dz = -0.5;
z_w = [0 0 1]';

v = [polyval(c_v_x,t),polyval(c_v_y,t),polyval(c_v_z,t)]';
    a = [polyval(c_a_x,t),polyval(c_a_y,t),polyval(c_a_z,t)]';
    jerk = [polyval(c_j_x,t),polyval(c_j_y,t),polyval(c_j_z,t)]';
    psi = polyval(c_p_psi,t);
    dPsi = polyval(c_v_psi,t);
    
    x_c = [cos(psi) sin(psi) 0]';
    y_c = [-sin(psi) cos(psi) 0]';
    alpha = a - g*z_w-dx*v;
    beta = a - g*z_w-dy*v;
    
    x_b = cross(alpha,y_c)/norm(cross(y_c,alpha));
    y_b = cross(x_b,beta)/norm(cross(beta,x_b));
    z_b = cross(x_b,y_b);
    T = z_b' * (a-g*z_w-dz*v);
    
    R = [x_b y_b z_b];
    euler = rotm2eul(R);
%     psi = euler(1);
%     theta = euler(2);
%     phi = euler(3);
    
    A = [0                             T+(dz-dx)*(z_b'*v)                 (dx-dy)*(z_b'*v); ...
          T-(dy-dz)*(z_b'*v)               0                               -(dx-dy)*(x_b'*v);...
          0                              -y_c'*z_b                             norm(cross(y_c,z_b))];
    b = [x_b'*jerk - dx*x_b'*a  -y_b'*jerk + dy*y_b'*a dPsi*x_c'*x_b]'; 
    angular_rate = linsolve(A,b);
end