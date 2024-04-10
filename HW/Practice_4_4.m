clc ; clear ; close

f = @(x) -0.1*x^4 - 0.15*x^3 -0.5*x^2 - 0.25*x + 1.2 ;
dfdt = @(x) -0.4*x^3 - 0.45*x^2 - 1.0*x - 0.25 ;

e_t = ones(1,3) ;

xi = 0.5 ; h = 0.25 ; % xi+1 = 1.0, xi-1 = 0.0

S_true = dfdt(0.5) ;

FD = (f(xi + h) - f(xi))/h ;
BD = (f(xi) - f(xi - h))/h ;
CD = (f(xi+h) - f(xi-h))/(2*h) ;

e_t(1) = abs((S_true -FD)/S_true) * 100 ;
e_t(2) = abs((S_true -BD)/S_true) * 100 ; 
e_t(3) = abs((S_true -CD)/S_true) * 100 ;

