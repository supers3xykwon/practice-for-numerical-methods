clc ; clear ; close all

%{
    Problem 7.14 
%}

x = linspace(-5.0, 5.0, 500) ; y = linspace(-5.0, 5.0, 500) ; 

[X, Y] = meshgrid(x, y) ;

H = (1+X.^2 + Y.^2 + X + X.*Y).^(-1) ;

h = @(x) -(1+x(1)^2 +x(2)^2 +x(1)+x(1)*x(2))^(-1) ;
[x, fval] = fminsearch(h, [-0.5, 0.5]);

figure
cs = contour(X, Y, H) ; clabel(cs) ;
hold on
scatter3(x(1), x(2), -h(x))

figure
cs = surfc(X, Y, H) ;
hold on 
scatter3(x(1), x(2), -h(x))

