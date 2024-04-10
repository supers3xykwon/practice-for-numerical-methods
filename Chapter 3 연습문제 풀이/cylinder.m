function cylinder(r, L, plot_title)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.11 - calculate and Plot of volume versus depth for horizontal cylinder tank.
    %
    %Input:
    %    R = the radius of the water tank.
    %    L = the length of the water tank.
    %    plot_title = string holding plot title.
    %
    %Output:
    %    Plot of volume versus depth for horizontal cylinder tank.
    
    h = linspace(0, 2*r, 10^4) ;

    V = (r^2 * acos((r-h)/r) - (r-h).*sqrt(2*(r.*h)-(h.^2))) * L ;

    plot(V, h, 'LineWidth', 3)
    title(plot_title)
    xlabel('Volume [m^3]') ; ylabel('depth of the water [m]')
    xlim([-5.0, 145]) ; ylim([-0.2, 6.2]) ;
end