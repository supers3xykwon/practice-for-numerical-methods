function deflection_plot(xi, xf, n)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.10 - calculate the ddeflection function to x
    %
    %Input:
    %    xi = the lower bound of x 
    %    xf = the upper bound of x   
    %    n = the number of x-steps
    %
    %Output:
    %    Plot of deflection of the simple supported beam.
    
    x = linspace(xi, xf, n)  ;
    u_y = ones(1, length(x)) ;
    j = 0 ;

    for i = x
        j = j + 1 ;
    u_y(j) = (-5/6)*(singular(i, 0, 4) - singular(i, 5, 4)) + ...
             (15/6)*singular(i, 8, 3) + 75*singular(i,7,2) + ... 
             (57/6)*i^3-238.25*i ;
    end
    figure('Position', [100, 100, 800, 300])
    plot(x, u_y, '--', 'LineWidth', 3)
    title('Beam deflection of fig 3.10')
end

function f = singular(x, a, n)
    if x > a, f = (x-a)^n ;
    else, f = 0; end
end