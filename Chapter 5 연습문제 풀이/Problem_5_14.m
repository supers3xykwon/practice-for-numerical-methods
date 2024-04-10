%{
        
    '24.03.24
    Textbook: Applied numerical method by Chapra
    Problem 5.14 Chemical equilibrium constants
    
%}

clc ; clear ; close all

Ca0 = 42 ; Cb0 = 28 ; Cc0 = 4 ; k = 0.016 ;

func = @(x) k - (Cc0 + x)/((Cb0 - x)*(Ca0 - 2*x)^2) ;
equ = @(x, k) k - (Cc0 + x)/((Cb0 - x)*(Ca0 - 2*x)^2) ;

x = 0.0:0.001:20; 
K_vec = ones(1, length(x)) ; Error_vec = ones(1, length(x)) ;
ea_vec = ones(1, length(x)) ; iter_vec = ones(1, length(x)) ;

j = 1 ;
for i = x, K_vec(j) = func(i) ; j = j + 1 ; end

format long
[root_bi, fx_bi, ea_bi, iter_bi] = bisect(@(x) equ(x, k), 0.0, 20.0, 0.5)
[root_fp, fx_fp, ea_fp, iter_fp] = falposition(@(x) equ(x, k), 0.0, 20.0, 0.5)

figure
plot(x, K_vec, 'LineWidth', 3), grid on, hold on
xlabel('Number of moles generated C [mole]') , ylabel('Equilibrium constant')
title('Chemical Reaction equilibrium constant')
plot(root_bi,fx_bi, '*-', 'DisplayName', 'Bisection method', 'LineWidth', 3)
plot(root_fp,fx_fp, '*-', 'DisplayName', 'False Position', 'LineWidth', 3)
legend('boxoff'), legend('Location','southwest'), hold off

figure
plot(x, K_vec, 'LineWidth', 3), grid on, ylim([-3*1e-3, 3*1e-3]), hold on
xlabel('Number of moles generated C [mole]') , ylabel('Equilibrium constant')
title('Chemical Reaction equilibrium constant, (Enlarged)')
plot(root_bi,fx_bi, '*-', 'DisplayName', 'Bisection method', 'LineWidth', 3)
plot(root_fp,fx_fp, '*-', 'DisplayName', 'False Position', 'LineWidth', 3)
legend('boxoff'), legend('Location','southwest'), hold off