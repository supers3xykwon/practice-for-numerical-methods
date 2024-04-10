clc ; clear ; close all
%{
    예제 7.4 : 2차원 함수의 시각화
%}

x = linspace(-2, 0 , 40) ; y = linspace(0, 3, 40) ;
[X, Y] = meshgrid(x, y) ;
Z = 2 + X - Y + 2*X.^2 + 2*X.*Y + Y.^2 ;
figure
cs = contour(X, Y, Z);clabel(cs);
xlabel('x_1'); ylabel('x_2');
title('(a) Contour plot'); grid

figure
cs = surfc(X, Y, Z);
zmin = floor(min(Z)) ; zmax = ceil(max(Z)) ;
xlabel('x_1'); ylabel('x_2') ; zlabel('f(x_1, x_2)');
title('(b) Mesh Plot')