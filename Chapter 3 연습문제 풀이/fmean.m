function m = fmean(func, a, b, n)

    %Textbook: Applied Numerical Method of Chapra
    %Practice 3.9 - Make a function functions and Run it (page 88)
    %
    %Input:
    %    func = Functions to average
    %    a = lower bound of range
    %    b = upper bound of range
    %    n = the number of steps
    %
    %Output:
    %    m = the average value of a function
    %
    % made by Cho Hyeong Kwon in JBNU at '24.03.16.

    x = linspace(a, b, n) ;
    y = func(x);
    Sum = sum(y, "all") ;
    m = Sum/n ;
end
