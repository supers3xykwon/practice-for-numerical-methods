function y = vec_cos(ti, tf, ntf)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.12 - Vectorization
    %
    %Input:
    %    ti = the lower bound of time.
    %    tf = the upper bound of time.
    %    nft = the number of timestep.
    %
    %Output:
    %    y = 12 + 6*cos(2*pi*t)

    t = linspace(ti, tf, ntf) ;
    y = 12 + 6*cos(2*pi.*(t./(tf-ti))) ;

    plot(t, y, '-d', 'LineWidth', 3)
    xlim([-0.5, 20.5]) ; ylim([5.5, 19]) ;
    
end