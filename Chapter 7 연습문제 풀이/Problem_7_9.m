clc ; clear ; close all
%{
    Problem 7.13
%}
f = @(x) x^4 + 2*x^3 + 8*x^2 + 5*x ;

% plotting the function from x = -3 to x = 2.
x = -3 : 0.01 : 2 ; y_vec = ones(1, length(x)); j = 1 ;
for i = x, y_vec(j) = f(i) ; j =j+1; end
figure
plot(x, y_vec, 'DisplayName', 'curve', 'LineWidth', 3), grid
annotation('rectangle', [0.515, 0.165, 0.05, 0.05])
title('Curve : f(x) = x^4 + 2x^3 + 8x^2 + 5x (-3 ~ 2)')
xlabel('x') ; ylabel('f(x)')  

figure
y = -0.36 : 0.001 : -0.34 ; y_vec = ones(1, length(y)); j = 1 ;
for i = y, y_vec(j) = f(i) ; j =j+1; end
plot(y, y_vec, 'DisplayName', 'curve', 'LineWidth', 3), grid, hold on

% Golden section search method
xl = -2 ; xu = 1 ;
[x_g, fx_g, ea_g, iter_g] = goldenmin(@(x) f(x), xl ,xu, 1) ;
scatter(x_g, fx_g, '*', 'DisplayName', 'GSS', 'LineWidth', 3) ;

% Parabolic interpolation method
x1 = -2 ; x2 = -1 ; x3 = 1 ; es = [] ; maxit = 15 ;
[x_p, fx_p, ea_p, iter_p] = parainterpol(@(x) f(x), x1 ,x2, x3, es, maxit) ;
scatter(x_p, fx_p, '*', 'DisplayName', 'PIT', 'LineWidth', 3)

% fminbnd
options = optimset('display', 'iter') ;
[xmin, fval] = fminbnd(f, -2, 1, options) ;
scatter(xmin, fval, '*', 'DisplayName', 'fminbnd', 'LineWidth', 3)

xlim([-0.36, -0.34]), ylim([-0.841, -0.840])
legend('boxoff')
title('Curve : f(x) = x^4 + 2x^3 + 8x^2 + 5x (-0.36 ~ -0.34)')
xlabel('x') ; ylabel('f(x)')  

disp('    x_opt    f(x_opt)   error   iteration')
disp([x_g, fx_g, ea_g, iter_g])
disp([x_p, fx_p, ea_p, iter_p])
disp([xmin, fval])


