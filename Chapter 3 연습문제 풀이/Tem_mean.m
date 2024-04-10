function m = Tem_mean(T_mean, T_peak, di, df)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.4 - calculate mean temperature between two dates
    %
    %Input:
    %    T_mean = average temperature of a year [℃]
    %    T_peak = Peak temperature of a year    [℃]
    %    di = lower bound day
    %    df = upper bound day
    %
    %Output:
    %    m = mean temperature between two dates
    %
    % made by Cho Hyeong Kwon in JBNU at '24.03.16.
    
    omega = 2*pi/365 ; % frequency of annual variation
    t = di:df        ; % dates

    T = T_mean + (T_peak-T_mean)*cos(omega*(t-T_peak)) ;

    m = mean(T) ;
end