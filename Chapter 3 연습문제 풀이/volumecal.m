function vol = volumecal(R, d)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.1 - calculate volume of water tank.
    %
    % the water tank's height is 3R. R from bottom is shape as spike, 
    % and 2R to top of the tank is slinder
    %
    %Input:
    %    R = radius of the water tank
    %    d = depth of the water tank
    %
    %Output:
    %    vol = volume of the water tank

    if d > 3*R 
        vol = "Overtop" ;
        disp("Error! depth is larger than heigth. Please check your data.")
    elseif R < d & 3*R >= d 
        v1 = (R^3)*pi/3 ; v2 = (R^2)*pi*(d-R);
        vol = v1 + v2 ;
    elseif R >= d
        vol = (d^3)*pi/3 ;
    end
end