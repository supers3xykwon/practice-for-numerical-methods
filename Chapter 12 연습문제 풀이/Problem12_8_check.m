clc ; clear ; close all

%% Problem 12.8
% Newtom-Raphson method
% 
% made by Cho Hyeong Kwon in JBNU at '24.04.23

f = @(x) [ ((x(1)-4)^2)+((x(2)-4)^2)-5 ; (x(1)^2)+(x(2)^2)-16 ] ;
J = @(x) [ 2*x(1)-8 2*x(2)-8 ; 2*x(1) 2*x(2)] ;

% (a) x0 = [1.2 ; 1.2] 
x0 = [4.1; 3.9]  ;
[x_a, func_a, ea_a, iter_a] = newtonmulti(f, J, x0, [], 6) ;


format long
disp('roots'), disp(x_a)
disp('error'), disp(ea_a)
disp('func'), disp(func_a)
disp('iteration'), disp(iter_a)  
format default