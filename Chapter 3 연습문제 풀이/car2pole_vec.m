function [r, theta, x_out, y_out] = car2pole_vec(x, y)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.7 - calculate the r, and theta of the polar coordinate system based on the x, and y of the cartesian coordinate system.  
    %
    %Input:
    %    x = the vector of x
    %    y = the vector of y
    %
    %Output:
    %    r = the vector of radius calculated by r = sqrt(x^2 + y^2)
    %    theta = the vector of angle between the line starting from origin to point(x, y), and the x-axis.
    %
    % made by Cho Hyeong Kwon in JBNU at '24.03.17.
    
    if length(x) ~= length(y)
        disp('  Error. x and y are different length.\n')
        disp('  Please Check your input.')
        r = 'Can not calculate'; theta = r ;
    
    else
        r = ones(1, length(x)) ; theta = ones(1, length(x)) ;
        x_out = ones(1, length(x)) ; y_out = ones(1, length(x)) ;

        for i = 1:length(x)
            if x(i)*y(i) == 0
                if x(i) == 0, r(i) = abs(y(i)) ; theta(i) = sign(y(i))*(pi/2) ;
                elseif x(i) > 0, r(i) = x(i) ; theta(i) = 0 ;
                else, r(i) = abs(x(i)) ; theta(i) = pi ;
                end
            else, r(i) = sqrt(x(i)^2 + y(i)^2) ;
                if x(i) > 0, theta(i) = atan(y(i)/x(i)) ;
                else, theta(i) = atan(y(i)/x(i)) - sign(y(i))*pi ;
                end
            end

            % Checker
            x_out(i) = r(i)*cos(theta(i)); y_out(i) = r(i)*sin(theta(i)) ;
        end
    end

    %fprintf('In the polar cooridate, r is %5.3f and theta is %5.3f.\n', r, theta)
    %fprintf('It is same x = %5.3f, and y = %5.3f in cartesian coordinate.\n', x_out, y_out)
end