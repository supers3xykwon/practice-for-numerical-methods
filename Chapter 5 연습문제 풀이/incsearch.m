function xb = incsearch(func, xl, xu, ns)
    % 
    % Textbook  : Applied numerical method of chapra
    % Incsearch : incremental search (증분탐색법)
    %           xb = incsearch(func, xl, xu, ns)
    %       finds brackets of x that contain sign changes of a function on an interval
    % 
    % Input:
    %         func = name of function or anonymous function
    %       xl, xu = endpoint of interval. 
    %                xl is lower limit of the interval
    %                and xu is upper limit of the interval.
    %           ns = the number of subintervals ( default = 50 )
    % Output:
    %     xb(k, 1) = the lower bound of the k-th sign change 
    %     xb(k, 2) = the upper bound of the k-th sign change 
    %                if no bracket found, xb = []
    % 
    % made by Recktenwald (2000)

    if nargin < 3, error('at least 3 arguments required'), end
    if nargin < 4, ns = 50 ; end % default

    % Incremental search algorithm
    x = linspace(xl, xu, ns) ;
    f = func(x) ;

    nb = 0 ; xb = [] ;

    for k = 1:length(x)-1
        if sign(f(k)) ~= sign(f(k+1)) 
            nb = nb+1 ; xb(nb, 1) = x(k); xb(nb, 2) = x(k+1); 
        end
    end
    if isempty(xb)
        disp('no brakets found')
        disp('check interval or increase ns')
    else
        disp('number of brakets:')
        disp(nb)
    end
end