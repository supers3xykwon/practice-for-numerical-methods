clc ; clear ; close all
%{
    사례연구 7.4 : 평형과 치소 포텐셜 에너지
%}

x = linspace(0, 20, 200) ; y = linspace(0, 10, 100) ;
[X, Y] = meshgrid(x, y) ;

ka = 9 ; kb = 2 ; La = 10 ; Lb = 10 ; F1 = 2 ; F2 = 4 ;

PEcurve = 0.5*ka*(sqrt(X.^2 + (La-Y).^2) - La).^2 + 0.5*kb*(sqrt(X.^2 + (Lb+Y).^2) - Lb).^2 - F1*X - F2*Y ;

v = [4.9523 1.2769] ;

figure
hold on
cs = contour(X, Y, PEcurve);clabel(cs) ;
scatter3(v(1), v(2), PE(v, ka, kb, La, Lb, F1, F2), 'magenta') ;
hold off
xlabel('x_1'); ylabel('x_2') ;
title('(a) Contour plot'); grid

figure
hold on
cs = surfc(X, Y, PEcurve) ;
scatter3(v(1), v(2), PE(v, ka, kb, La, Lb, F1, F2), 'magenta') ;
hold off
zmin = floor(min(PEcurve)) ; zmax = ceil(max(PEcurve)) ;
xlabel('x_1'); ylabel('x_2') ; zlabel('PE(x_1, x_2)');
title('(b) Mesh Plot')