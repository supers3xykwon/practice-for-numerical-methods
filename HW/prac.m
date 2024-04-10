clc ; clear ; close all

zero_order = @(x) 1 ; 
first_order = @(x) -x ;
second_order = @(x) (x^2)/2 ;
third_order = @(x) -(x^3)/factorial(3) ;

y = ones(1, 4) ; e_t = ones(1, 4) ; e_a = ones(1, 3) ;

y(1) = zero_order(0.25) ;
y(2) = y(1) + first_order(0.25) ;
y(3) = y(2) + second_order(0.25) ;
y(4) = y(3) + third_order(0.25) ;

y_true = exp(-0.25) ;

e_t = abs((y_true-y)/y_true * 100) ;
for i = 2:4
    e_a(i) = abs((y(i)-y(i-1))/y(i) * 100) ;
end


format short

fprintf('true value of e^-x : %.3f \n\n' , y_true)

fprintf('         zero order | first order | second order | third order \n')
fprintf('value       %1.4f       %1.4f        %1.4f         %1.4f \n' , ...
        y(1), y(2), y(3), y(4))
fprintf('error_t     %1.4f      %1.4f        %1.4f         %1.4f \n' , ...
        e_t(1), e_t(2), e_t(3), e_t(4))
fprintf('error_a                 %1.4f        %1.4f         %1.4f \n' , ...
        e_a(2), e_a(3), e_a(4))