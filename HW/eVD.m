function v = eVD(n, vD)

% eVD = extractValidDigits : 원하는 자릿수 만큼의 유효숫자를 추출해주는 함수.
%   v = eVD(n, vD)
%
% Input:
%   n = number
%   vD = 유효숫자의 자릿수
%
% Output:
%   v = 유효숫자
    
    if n > 1.0
        a = num2str(n) ;
        b = a(1:vD+1) ;
        v = str2double(b) ;
    elseif n < -1.0
        a = num2str(n) ;
        b = a(1:vD+2) ;
        v = str2double(b) ;        
    else
        v = round(n, vD) ;
    end
end
