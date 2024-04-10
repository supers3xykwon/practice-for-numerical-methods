%{
    
    '24.03.23
    Textbook: Applied numerical method by Chapra
    Problem 5.3 균일한 하중을 받는 보
    
%}
clc ; clear ; close all

w = 4 ; E = 52000 ; I = 32000 ; L = 400 ;

y    = @(x) (-w/(48*E*I)) * (2*x^4 -3*L*x^3 + (L^3)*x) ;
dydx = @(x) (-w/(48*E*I)) * (8*x^3 -9*L*x^2 + (L^3))   ; 

w = 4 ; E = 52000 ; I = 32000 ; L = 400 ;

x = 0:0.01:L ; j = 1;
y_vec = ones(1, length(x)) ; dydx_vec = ones(1, length(x)) ;
for i = x
    y_vec(j) = y(i) ; dydx_vec(j) = dydx(i) ;
    j = j + 1 ;
end

% graph 관찰
hold on
plot(x, y_vec, 'LineWidth', 3, 'DisplayName', 'deflection') ; 
plot(x, dydx_vec, 'LineWidth', 3, 'DisplayName', 'dydx') ;
grid on
hold off

legend('boxoff')

% 
format long
[root, fxr, Ea, ea, iter] = bisect_2(@(x) dydx(x), 0.0, 360, 0.0000001)