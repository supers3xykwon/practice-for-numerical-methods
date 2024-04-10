clc, clear, close all

theta = deg2rad(30) ; 
v1 = 1000 ; % N

A = [cos(theta)  0 -cos(pi/2 -theta) 0  0  0
     sin(theta)  0  sin(pi/2 -theta) 0  0  0
     cos(theta) -1  0               -1  0  0 
     sin(theta)  0  0                0 -1  0
     0          -1  cos(pi/2 -theta) 0  0  0 
     0           0  sin(pi/2 -theta) 0  0 -1 ];

b = [ 0 v1 0 0 0 0]' ;

F_vec = inv(A)*b ;

fprintf([' F1 = %3.2f N\n F2 = %3.2f N\n F3 = %3.2f N\n H2 = %3.2f N\n ' ...
         'V2 = %3.2f N\n V3 = %3.2f N\n'] , ...
         F_vec(1), F_vec(2), F_vec(3), F_vec(4), F_vec(5), F_vec(6))