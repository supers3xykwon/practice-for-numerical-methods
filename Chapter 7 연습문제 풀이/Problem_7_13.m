clc ; clear ; close all
%{
    Problem 7.13
%}
t = @(x) 2*x(1)^2 + 3*x(2)^2 - 4*x(1)*x(2) - x(2) - 3*x(1) ;

% (b)
[x_min, fval] = fminsearch(t, [-10, 10]) ;

% (a)
x = linspace(-10.0, 10.0, 100) ; y = linspace(-10.0, 10.0, 100) ;
[X, Y] = meshgrid(x, y) ;
T = 2*X.^2 + 3*Y.^2 - 4*X.*Y - Y - 3*X ;

figure
co = contour(X, Y, T) ; clabel(co) ; hold on
xlabel('x') ; ylabel('y') ; zlabel('Temperature')
scatter3(x_min(1), x_min(2), fval) ;

figure
su = surfc(X, Y, T) ; hold on
xlabel('x') ; ylabel('y') ; zlabel('Temperature')
scatter3(x_min(1), x_min(2), fval) ;