clc ; clear ; close all

f = @(x) [x(1)^2-x(1)+x(2)-0.75 ; x(1)^2-5*x(1)*x(2)-x(2)] ;
J = @(x) [ 2*x(1)-1  1 ; 2*x(1)-5*x(2)  -5*x(2)-1 ] ;
%{
    f = @(x) [x(1)^2-x(1)+x(2)-0.75 ; (x(1)^2)/(5*x(1)+1)-x(2)] ;
    J = @(x) [ 2*x(1)-1  1 ; (5*x(1)^2 +2*x(1))/(25*x(1)^2+10*x(1)+1) -1 ] ;
%}
x0 = [1.37; 0.25] ;

maxit = 50 ; es = 0.001 ; 
iter = 0 ; x = x0 ;
while (1)
    func = f(x); Jmat = J(x) ;
    dx = Jmat\func ;
    x = x-dx ;
    iter = iter + 1;
    ea = abs(dx./x) * 100 ;
    if iter >= maxit || max(ea) <= es, break, end    
end

disp(x), disp(ea)

format long
disp(f(x))

format default