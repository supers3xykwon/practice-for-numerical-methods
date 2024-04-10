function Compound_interest(P, i, n)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.2 - calculate Compound interest
    %
    %Input:
    %    P = initial investment cost   [$]
    %    i = interest rate [dimensionless]
    %    n = the numebr of years    [year]
    %
    %Output:
    %    F = principal and interest
    %    y = year
    %
    % made by Cho Hyeong Kwon in JBNU at '24.03.16.

    F = ones(1, n) ;
    y = ones(1, n) ;

    for j = 1:n
        F(j) = P*(1+i)^j ;
        y(j) = j         ;
    end

    dummy_mat = [y; F]';
    fprintf('year\t principal and interest\n');
    fprintf('%2d \t\t\t %10.3f\n', dummy_mat');
end