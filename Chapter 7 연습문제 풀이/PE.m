function p = PE(x, ka, kb, La, Lb, F1, F2)
PEa = 0.5*ka*( sqrt( x(1)^2 + (La-x(2))^2 ) - La)^2 ;
PEb = 0.5*kb*( sqrt( x(1)^2 + (Lb+x(2))^2 ) - Lb)^2 ;
W = x*[F1 ; F2] ;
p = PEa + PEb - W ;
end