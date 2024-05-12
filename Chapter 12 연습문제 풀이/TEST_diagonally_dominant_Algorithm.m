clc ; clear ; close all

A = [ 3 0.2 0.3 .2 ; .4 .7 .8 .10 ; -.3 -1 0 0 ; .10 .15 .10 12 ] ;

[m, n] = size(A) ;
for i = 1:m % Row indexing
    [big, j] = max(abs(A(i,:))) ;   
    if j~=i 
        if abs(big) > sum(abs(A(i,:))) - abs(big) 
            dump = A(j, :) ; 
            A(j, :) = A(i, :) ; 
            A(i, :) = dump ; 
        end 
    end
end