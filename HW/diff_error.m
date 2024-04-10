function data = diff_error(func, dfunc, x, n)
    %
    %
    % Textbook : Applied Numerical Method of Chapra
    %  Problem : Practice 4.5 Rounding and truncation errors in numerical derivatives
    %       data = diff_error(func, dfunc, x, n)
    %
    %   It is the function that calculate numerical derivatives at x = x 
    %   by centered difference total n-th cases. h of each case is the isometric sequence.
    %
    % Input :
    %   func = original function
    %  dfunc = derivative function of func
    %      x = a Value whose derivative coefficients is calculated via numerical derivatives
    %      n = total case number
    %
    % Output :
    %   data = It is a matrix that consist of 'a vector of step size', 'a vector of
    %   numerical derivative value', and 'a vector of true Error'.
    %           data = [h d e_t]
    %
    % made by Cho Hyeong Kwon in JBNU at '24.03.22.

    format long
    df_true = dfunc(x) ;

    h = ones(n, 1) ; d = ones(n, 1) ; e_t = ones(n, 1) ;

    for i = 1:n
        if i == 1, h(i) = 1
        else, h(i) = h(i-1)/10 ; end
        d(i) = (func(x + h(i)) - func(x - h(i)))/(2*h(i)) ;
        e_t(i) = abs(df_true - d(i)) ;
    end

    data = [h d e_t] ;    

    fprintf('   step size   finite difference   true error\n')
    fprintf('%14.10f %16.14f %16.13f\n', data)

    loglog(h, e_t), xlabel('Step size'), ylabel('Error')
    title('Plot of Error versus Step Size')
    format short
end