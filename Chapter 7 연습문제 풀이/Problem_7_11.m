clc ; clear ; close all

%{
    Problem 7.11
%}
% (a)
f = @(x) sin(x)+sin(2*x/3) ;
x = 2:0.01:20 ; f_vec = ones(1, length(x)) ; j = 1 ;
for i = x, f_vec(j) = f(i) ; j = j+1 ; end
plot(x, f_vec), hold on

% (b)
[xmin_1, fval_1] = fminbnd(f, 4, 8) ;
scatter(xmin_1, fval_1) ; hold on

% (c)
[x, fx, ea, iter] = goldenmin(@(x) f(x), 4 ,8, 2) ;
scatter(x, fx) ;