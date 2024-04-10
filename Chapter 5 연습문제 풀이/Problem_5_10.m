%{
        
    '24.03.23
    Textbook: Applied numerical method by Chapra
    Problem 5.10 Saturation concentration of dissolved oxygen in fresh water
    
%}
clc ; clear ; close all

DOS = @(T, a, b, c, d, e) exp(-a + b/T - c/T^2 + d/T^3 - e/T^4) ;
equ = @(osf, T, a, b, c, d, e) osf - exp(-a + b/T - c/T^2 + d/T^3 - e/T^4) ;

a = 139.34411     ; b = 1.575701*1e5  ; c = 6.642308*1e7 ; 
d = 1.243800*1e10 ; e = 8.621949*1e11 ;

% Graph 관찰
Tem_vec = -1.0 : 0.01 : 36 ; f_vec = ones(1, length(Tem_vec)) ; j = 1 ;
for i = Tem_vec 
    k = i + 273.15 ; f_vec(j) = DOS( k, a, b, c, d, e) ; 
    j = j+1 ; 
end
plot(Tem_vec, f_vec, 'LineWidth', 3, 'DisplayName', 'saturation curve')
hold on, grid on
title('Dissolved oxygen saturation')
xlabel('Temperature [℃]'), ylabel('concentration of oxygen')

% bisection method
osf = 12.3 ; Ead = 0.001;
% (a) Prediction
n = ceil(log2(35/Ead)) ;

% (b) Appling the Algorithm 
format long
[root, fxr, Ea, ea, iter] = bisect_2(@(T) equ(osf, T, a, b, c, d, e), ...
                                    273.15, 308.15, Ead) ;

% Postprocessing
format short
Tem = root -273.15 ; f_check = DOS(root, a, b, c, d, e) ;

% display
plot(Tem, f_check, '*-', 'LineWidth', 3, 'DisplayName', 'Answer point')
legend('boxoff')
fprintf('  Temperature [℃]  DOS [mg/L]\n')
fprintf('     %3.3f           %3.3f\n', Tem, f_check)