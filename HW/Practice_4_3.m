clc ; clear ; close all

an = @(n) (i^n) * (1+(-1)^(n+2))/2 ; bn = @(n) (i^(n+1)) * (1+(-1)^(n+1))/2 ;

taylor_fun = @(xi, xf, n) (an(n)*cos(xi)+bn(n)*sin(xi))*(xf-xi)^n/factorial(n) ;

xi = pi/4 ; xf = pi/3 ; n = 6 ; 

y_a = ones(1, n) ; e_a = ones(1, n) ; e_t = ones(1, n) ;

for i = 1:n
    if i == 1
        y_a(i) = taylor_fun(xi, xf, i-1) ;
    else
        y_a(i) = y_a(i-1) + taylor_fun(xi, xf, i-1) ;
    end
end

y_t = cos(xf) ;
y_t_vec = y_t * ones(1, n) ;
error_vec = abs(y_t - y_a) ; 


e_t = abs((y_t - y_a)/y_t) * 100;

for i = 1:n
    if i == 1
        e_a(i) = 100 ;
    else
        e_a(i) = abs((y_a(i)-y_a(i-1))/y_a(i)) * 100 ;
    end
end

yyaxis left
hold on
plot(1:n, y_a, 'd-', 'LineWidth', 3) ; plot(1:n, y_t_vec, 's-','LineWidth', 3)
plot(1:n, error_vec, '*-')
yyaxis right
hold on
plot(1:n, e_t, 'LineWidth', 3) ; plot(1:n, e_a, 'LineWidth', 3)
hold off
