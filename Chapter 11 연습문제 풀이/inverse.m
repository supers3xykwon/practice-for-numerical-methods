function Inv = inverse(A)

    % calculate inverse matrix function by LU decomposition
    %   Inv = inverse(A)
    %
    % Input:
    %   A = It must be a square matrix
    % 
    % Output:
    %   Inv = Inverse matrix of A matrix
    % 
    % made by Cho HyeongKwon in JBNU at '24.04.15

    [m, n] = size(A) ;
    if m~=n, error('A matrix must be a square matrix'), end
    L = tril(ones(m, n)) ; P = eye(m, n) ;

    % Algorithm: LU decomposition
    for k = 1 : n-1         % select the pivot row
        % partial pivoting
        [~, i] = max(abs(A(k:m, k))) ;
        ipr = i + (k-1) ; % index calibration
        cnt = 1 ;
        if ipr ~= k 
            A([k, ipr], :) = A([ipr, k], :) ; 
            P([k, ipr], :) = P([ipr, k], :) ;
            L([k, ipr], 1:k-1) = L([ipr, k], 1:k-1) ;
        end

        for i = k+1 : n     % elimination 
            factor = A(i, k)/A(k, k) ;
            A(i, k:n) = A(i, k:n) - factor * A(k, k:n) ;    
            L(i, k) = factor ; U = A ;
        end
    end

    % Algorithm: calculate the Inverse matrix of A
    Inv = ones(m,n) ;
    for i = 1:n
        b = zeros(1, m) ; b(i) = 1 ;
        d = L\b' ; Inv(:, i) = U\d ; % -> Power of the LU decomposition
    end
    Inv = Inv * P ;
end