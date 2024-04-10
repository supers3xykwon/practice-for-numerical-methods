function [r, theta] = car2pole2(x, y)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.6 - calculate the r, and theta of the polar coordinate system based on the x, and y of the cartesian coordinate system.  
    %
    %Input:
    %    x = the value of x
    %    y = the value of y
    %
    %Output:
    %    r = the radius calculated by r = sqrt(x^2 + y^2)
    %    theta = the angle between the line starting from origin to point(x, y), and the x-axis.
    %    x_out = x coordinate calculated by r and theta for check
    %    y_out = y coordinate calculated by r and theta for check
    % 
    % made by Cho Hyeong Kwon in JBNU at '24.03.17.

    if x*y == 0
        if x == 0, r = y ; theta = sign(y)*pi/2 ;
        elseif y == 0 & x > 0, r = x ; theta = 0 ;
        else, r = abs(x) ; theta = pi ;
        end
    else 
        r = sqrt(x^2 + y^2) ;
        if x > 0, theta = atan(y/x) ;
        else, theta = atan(y/x) + sign(y)*pi ;
        end
    end

    % Checker
    x_out = r*cos(theta); y_out = r*sin(theta) ;
    
    fprintf('In the polar cooridate, r is %5.3f and theta is %5.3f.\n', r, theta)
    fprintf('It is same x = %5.3f, and y = %5.3f in cartesian coordinate.\n', x_out, y_out)
end