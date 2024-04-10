function f = fpH(pH, pCO2)
    %
    % Textbbook : Applied numerical method by chapra
    % Case study - 5.6 
    %       f = fpH(pH, pCO2)
    %       It calculates the pH at pCO2
    %
    % Input:
    %   pH = independent and dependent variable (implicit form)
    %   pCO2 = partial pressure of CO2
    % 
    % Output:
    %   f = dependent variable 
    %


    K1 = 10^(-6.3) ; K2 = 10^(-10.3) ; Kh = 10^(-1.46) ; Kw = 10^(-14) ;
    H = 10^-pH ;

    f = (K1*Kh)/(H*1e6) * pCO2 + 2* (K1*K2*Kh)/((H^2)*(1e6)) * pCO2 + Kw/H - H ;

end 