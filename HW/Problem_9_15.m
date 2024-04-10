clc , clear , close all

A = zeros(10, 10) ;
A(1, 1) = -1 ; A(1, 5) = 1 ; 
A(2, 2) = -1 ; A(2, 4) = 1 ;
A(3, 6) = 1 ; A(3, 7) = 3/5 ; 
A(4, 4) = -1 ; A(4, 7) = 4/5 ;
A(5, 6) = 1 ; A(5, 9) = -3/5 ; 
A(6, 8) = -1 ; A(6, 9) = 4/5 ;
A(7, 5) = -1 ; A(7, 7) = 3/5 ; A(7, 10) = 1 ;
A(8, 7) = -4/5 ; A(8, 8) = 1 ; 
A(9, 9) = 3/5 ; A(9, 10) = -1 ;
A(10, 3) = 1 ; A(10, 9) = -4/5 ;

b = [0 0 74 0 0 24 0 0 0 0]' ;

[x, D] = GaussPivot(A, b) ;

fprintf(' Ax = %2.1f N \n Ay = %2.1f N \n Ey = %2.1f N \n ', x(1:3))
fprintf(['F_AB = %2.1f N (Com)\n F_AD = %2.1f N (Com)\n ' ...
         'F_BC = %2.1f N (Ten)\n F_BD = %2.1f N (Ten)\n ' ...
         'F_CD = %2.1f N (Com)\n F_CE = %2.1f N (Ten)\n ' ...
         'F_DE = %2.1f N (Com)\n'], x(4:10) ) ;