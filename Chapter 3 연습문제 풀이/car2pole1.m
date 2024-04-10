function [r, theta] = car2pole1(x, y)

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
    %
    % made by Cho Hyeong Kwon in JBNU at '24.03.16.

    if x*y == 0
        if x == 0 & y > 0, r = y ; theta = pi/2 ;
        elseif x == 0 & y < 0, r = abs(y) ; theta = -pi/2 ;
        elseif y == 0 & x > 0, r = x ; theta = 0 ;
        else, r = abs(x) ; theta = pi ;
        end
    else 
        r = sqrt(x^2 + y^2) ;

        if x > 0, theta = atan(y/x) ;
        elseif y > 0, theta = atan(y/x) + pi ;
        else, theta = atan(y/x) - pi ;
        end
    end

    fprintf('In the polar cooridate, r is %5.3f and theta is %5.3f.\n', r, theta)
end