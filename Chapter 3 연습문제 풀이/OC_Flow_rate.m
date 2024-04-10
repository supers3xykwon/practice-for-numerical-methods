function result_table =OC_Flow_rate(data_mat)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.9 - Calculate the velocity of water flow in open channel.  
    %
    % OC_Flow_rate means flow rate at the Open channel 
    %
    %Input:
    %    data_mat = data matrix inculded n, S, B, and H of open channel.
    %
    %    e.g)   n(Roughness)  S(Slope the channel)  B(Width)  H(depth)
    %   set 1       0.036         0.0001               10        2
    %   set 2       0.020         0.0002                8        1  
    %
    %Output:
    %    result_mat = reuslt matrix inculded n, S, B, and H of open channel.
    %
    %    e.g)   n(Roughness)  S(Slope the channel)  B(Width)  H(Depth) U(Flow rate)
    %   set 1       0.036         0.0001               10        2       0.352
    %   set 2       0.020         0.0002                8        1       0.6094
    % 
    % made by Cho Hyeong Kwon in JBNU at '24.03.17.

    n = data_mat(:, 1) ; S = data_mat(:, 2) ;
    B = data_mat(:, 3) ; H = data_mat(:, 4) ;

    U = ones(length(n), 1) ;

    for i = 1:length(n)
        U(i) = (sqrt(S(i))/n(i))*(B(i)*H(i)/(B(i)+2*H(i)))^(2/3) ;
    end
    
    Roughness = data_mat(:, 1) ; Slope_the_channel = data_mat(:, 2) ;
    Width = data_mat(:, 3) ; Depth = data_mat(:, 4) ; Flow_rate = U ;

    result_table = table(Roughness, Slope_the_channel, Width, Depth, Flow_rate) ;
end