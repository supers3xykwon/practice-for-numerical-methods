%{

    '24.03.23
    Textbook: Applied numerical method by Chapra
    Problem 5.4

%}

clc ; clear ; close all

g = 9.81 ; 

v = @(t, H, L) sqrt(2*g.*H) .* tanh(t*sqrt(g*H./L)) ;

% Graph 관찰
H = 0.0 : 0.01 : 5.0 ;
plot(H, v(2.5, H, 4), 'LineWidth', 3), grid on
title('velocity versus height of the tank')
xlabel('Heigth') , ylabel('velocity')

% 이분법
[root_bi, fxr_bi, Ea_bi, ea_bi, iter_bi] = bisect_2(@(H) v(2.5, H, 4)-5, 0, 4, 0.0000001) ;

% 가위치법
[root_fp, fxr_fp, ea_fp, iter_fp] = falposition(@(H) v(2.5, H, 4)-5, 0, 4, 0.0000001, 50) ;

% 결과 비교
format long
data_mat = [root_bi root_fp ; fxr_bi+5 fxr_fp+5 ; ea_bi ea_fp ; iter_bi iter_fp] ;

disp('   bisection method   false position method')
disp(data_mat)