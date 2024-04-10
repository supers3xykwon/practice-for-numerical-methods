clc ; clear ; close all

taylor_fun = @(xi, xf, n) (((xi-xf)^n) * exp(-1*xi))/factorial(n) ;

% taylor series의 차수 + 1 (조절)
n = 4;

y = zeros(1, n) ; e_t = ones(1, n) ; e_a = ones(1, n) ;

y_true = exp(-1) ;

for i = 1:n
    if i == 1
        y(i) = taylor_fun(0.25, 1.0, i-1) ;
    else
        y(i) = y(i-1) + taylor_fun(0.25, 1.0, i-1) ;
    end
end

e_t = abs((y_true - y)/y_true) * 100 ;

for i = 1:n
    if i == 1, e_a(i) = 0 ;
    else, e_a(i) = abs((y(i)- y(i-1))/y(i)) * 100 ;
    end
end

fprintf('true value of e^-x : %.3f \n\n' , y_true)

fprintf('        zero order | first order | second order | third order \n')
fprintf('value      %1.4f       %1.4f        %1.4f         %1.4f \n' , ...
        y(1), y(2), y(3), y(4))
fprintf('error_t  %1.4f      %1.4f       %1.4f         %1.4f \n' , ...
        e_t(1), e_t(2), e_t(3), e_t(4))
fprintf('error_a               %1.4f       %1.4f        %1.4f \n' , ...
        e_a(2), e_a(3), e_a(4))

yyaxis left
plot(0:n-1, y, 'd-', 'LineWidth', 3, 'DisplayName', 'taylor series')
ylabel('taylor series value', 'FontSize', 15)
yyaxis right
hold on
plot(0:n-1, e_t, 's-', 'LineWidth', 1.5, 'DisplayName', '\epsilon_t')
plot(0:n-1, e_a, 'o-', 'LineWidth', 1.5, 'DisplayName', '\epsilon_a')

legend('Boxoff')
legend('Location', 'northeast', 'FontSize', 15)

xlabel('order of taylor series', 'FontSize', 15)
ylabel('Error [%]', 'FontSize', 15)
txt = sprintf('%d-th order of taylor series', n-1) ;
title(txt, 'FontSize', 15)
xlim([-0.5, (n-0.5)])