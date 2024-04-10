function [v, e] = taylor_sin(x, n)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.5 - calculate taylor series of sine at a = 0.
    %
    %Input:
    %    x = the value of domain
    %    n = the numebr of order
    %
    %Output:
    %    v = the output value of taylor series at n-th order
    %    e = the error of taylor series at n-th order
    %
    %
    % Error = |(true value - approximate value)/(true value)| * 100 % 
    %
    % made by Cho Hyeong Kwon in JBNU at '24.03.16.

   v = 0 ;
    for i = 0:n
        v = v + (((-1)^i)*x^(2*i+1))/factorial(2*i+1) ; 
    end
    e = abs((sin(x)-v)/(sin(x)))*100 ;

end