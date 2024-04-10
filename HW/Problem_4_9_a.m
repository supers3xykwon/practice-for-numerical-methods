clc ; clear ; close all

% define anonymous functions
fun1 = @(x) x^3 -7*x^2 + 8*x - 0.35 ;
fun2 = @(x) ((x-7)*x + 8)*x - 0.35 ;

% 4.9 (a)
vta = fun1(1.37) ;

a1 = eVD(1.37^3, 3) ;
a2 = eVD(7*(1.37^2), 3) ;
a3 = eVD(8*1.37, 3) ;

va1  = eVD(eVD(eVD(a1 - a2, 3) + a3, 3) - 0.350, 3) ;
va2 = eVD(eVD(eVD(a1 - 0.350, 3) + a3, 3) - a2, 3) ; % 작은 수에서 큰 수로

percent_error_a1 = abs((vta - va1)/(vta)) * 100 ;
percent_error_a2 = abs((vta - va2)/(vta)) * 100 ;

% 4.9 (b)
vtb = fun2(1.37) ;

b1 = eVD(1.37 -7, 3) ;
b2 = eVD(b1*1.37, 3) ;
b3 = eVD(b2 + 8 , 3) ;
b4 = eVD(b3*1.37, 3) ;

vb = eVD(b4 - 0.35, 3);

percent_error_b = abs((vtb - vb)/(vtb)) * 100 ;

% print
fprintf('문제 4.9(a) ')
fprintf('y_a = %.3f, epslion_t = %3.1f', va1, percent_error_a1)
disp('%')

fprintf('문제 4.9(b) ')
fprintf('y_a = %.3f, epslion_t = %3.1f', vb, percent_error_b)
disp('%')


