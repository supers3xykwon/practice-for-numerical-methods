clc ; clear ; close all

%% Problem 12.8
% Newtom-Raphson method
% 
% made by Cho Hyeong Kwon in JBNU at '24.04.23

f = @(x) [x(1)^2-x(1)+x(2)-0.75 ; (x(1)^2)-5*x(1)*x(2)-x(2)] ;
J = @(x) [ 2*x(1)-1  1 ; 2*x(1)-5*x(2)  -5*x(1)-1 ] ;

% (a) x0 = [1.2 ; 1.2] 
x0 = [1.2 ; 1.2]  ;
[x_a, func_a, ea_a, iter_a] = newtonmulti(f, J, x0) ;

%% Extra
% (b) x0 = [-1 ; -1] 3사분면
x0 = [-0.58 ; -0.18] ;
[x_b, func_b, ea_b, iter_b] = newtonmulti(f, J, x0) ;

% (c) x0 = [-1 ; 1] 2사분면
x0 = [-0.19 ; 0.52] ;
[x_c, func_c, ea_c, iter_c] = newtonmulti(f, J, x0) ;

% (d) x0 = [1 ; -1] 4사분면
x0 = [1.37 ; 0.237] ;
[x_d, func_d, ea_d, iter_d] = newtonmulti(f, J, x0) ;

root_matrix = [x_a x_b x_c x_d] ;
func_matrix = [func_a func_b func_c func_d] ;
error_matrix = [ea_a ea_b ea_c ea_d] ;
iter_vec = [iter_a iter_b iter_c iter_d] ;

disp('roots'), disp(root_matrix)
disp('error'), disp(error_matrix)
disp('func'), disp(func_matrix)
disp('iteration'), disp(iter_vec)  