function annual_repayment(P, i, n)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.3 - calculate annual repayment cost in $
    %
    %Input:
    %    P = totla lend cost   [$]
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
        F(j) = P*(i*(1+i)^j)/((1+i)^j -1) ;
        y(j) = j         ;
    end

    dummy_mat = [y; F]';
    fprintf('the number of years \t Annual Repayment\n');
    fprintf('\t\t %2d \t\t\t %10.3f $\n', dummy_mat');
end