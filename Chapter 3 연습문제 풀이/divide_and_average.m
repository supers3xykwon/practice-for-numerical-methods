function [r, e] = divide_and_average(a, x)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.13 - divide and average method for square root
    %
    %Input:
    %    a = The number I want to find the square root of
    %    x = first Estimate
    %
    %Output:
    %    r = root square vector
    %    e = error vecotr

    j = 1 ; 
    while (1)
        if a > 0
            if j == 1
                r(j) = x ;
                e(j) = 100 ;
            else
                r(j) = 0.5*(r(j-1) + a/(r(j-1))) ;
                e(j) = abs(( r(j) - r(j-1) ) / r(j-1) ) ;
            end

            if e(j) < 10^(-4) || j > 10000, break, end
            j = j + 1 ;
        
        elseif a == 0
            % " a가 0일 때의 statement"
        else
            % " a가 음수일 때의 statement"
        end
    end
end
