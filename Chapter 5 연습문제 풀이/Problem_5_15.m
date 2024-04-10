%{
            
    '24.03.24
    Textbook: Applied numerical method by Chapra
    Problem 5.15 Uniform beam that is acted linear force
    
%}
clc ; clear ; close all

y    = @(x, w, E, I, L) (w/(120*E*I*L))*(-x^5 + 2*(L^2)*x^3 - (L^4)*x) ;
dydx = @(x, w, E, I, L) (w/(120*E*I*L))*(-5*x^4 + 6*(L^2)*x^2 - (L^4)) ;

w = 2.25 ; E = 50000 ; I = 30000 ; L = 600 ;

[root, fx, ea, iter] = bisect(@(x) dydx(x, w, E, I, L), 0.0, 600*0.9) ;
d = y(root, w, E, I, L)

x = 0.0:0.01:600 ; dydx_vec = ones(1, length(x)) ; y_vec = ones(1, length(x)) ;
j = 1 ;
for i = x
    dydx_vec(j) = dydx(i, w, E, I, L) ; y_vec(j) = y(i, w, E, I, L) ;
    j = j+1 ;
end

hold on
plot(x, dydx_vec, 'LineWidth', 3, 'DisplayName', 'dy/dx')
plot(x, y_vec,    'LineWidth', 3, 'DisplayName', 'deflection')
plot(root, dydx(root, w, E, I, L), '*-', 'LineWidth', 3, 'DisplayName', 'dydx = 0')
plot(root, y(root, w, E, I, L),    '*-', 'LineWidth', 3, 'DisplayName', 'Max deflection')
hold off, grid on, legend('boxoff'), legend('Location', 'southeast')
xlabel('displacement from left end (pin joint)')
ylabel('deflection [m] and slope [m/m] of the beam')