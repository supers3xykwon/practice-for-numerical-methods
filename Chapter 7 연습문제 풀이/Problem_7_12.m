clc ; clear ; close all

%{
    Problem 7.12
%}

% (a)
f = @(x) -1*(-0.8*x^4 + 2.2*x^2 + 0.6) ;
x = 0.7:0.01:1.4 ; f_vec = ones(1, length(x)) ; j = 1 ;
for i = x, f_vec(j) = f(i) ; j = j+1 ; end
plot(x, -f_vec, 'DisplayName', 'curve'), hold on, grid on

% (b)
[xmin_1, fval_1] = fminbnd(f, 0.7, 1.4) ;
scatter(xmin_1, -fval_1, 'DisplayName', 'fminbnd') ;

% (c)
[x, fx, ea, iter] = goldenmin(@(x) f(x), 0.7 ,1.4, 10) ;
scatter(x, -fx, 'DisplayName', 'goldeemin') ; hold off, legend('boxoff')