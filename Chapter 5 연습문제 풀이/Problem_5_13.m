%{
        
    '24.03.24
    Textbook: Applied numerical method by Chapra
    Problem 5.13 Michaelis-Menten Model : concentraiton versus time curve
    
%}

clc ; clear ; close all

S0 = 8 ; vm = 0.7 ; ks = 2.5 ;

equ = @(t, S) S - S0 + vm*t - ks * log(S0/S) ;

t = 0.0:0.01:50.0 ; 
S_vec = ones(1, length(t)) ; Error_vec = ones(1, length(t)) ;
ea_vec = ones(1, length(t)) ; iter_vec = ones(1, length(t)) ;
j = 1 ;
for i = t
    [S_vec(j), Error_vec(j), ea_vec(j), iter_vec(j)] = bisect(@(S) equ(i, S), 0, S0, 0.01) ;
    j = j + 1 ;
end

plot(t, S_vec)
xlim([-0.5, 50.5]) , ylim([-0.5, 8.5]), grid on
xlabel('time [s]') , ylabel('Substrate Concentration')
title('Michaelis-Menten Model : concentraiton versus time curve')