function f = Bungeejump(t, m, cd, v)
    g = 9.81 ;
    f = sqrt(g*m/cd) * tanh(t*sqrt(g*cd/m)) - v ; 
end