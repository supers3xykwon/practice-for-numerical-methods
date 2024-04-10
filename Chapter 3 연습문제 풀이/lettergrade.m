function grade = lettergrade(score)

    %Textbook: Applied Numerical Method of Chapra
    %Problem 3.8 - Grade printer.  
    %
    %Input:
    %    score = your score of this test.
    %
    %Output:
    %   grade = your grade of this test.
    %           It is one of the A, B, C, D, and F.  
    % 
    % made by Cho Hyeong Kwon in JBNU at '24.03.17.

    if score > 100, disp('u r my love. come to me.'), grade = 'SSS' ;
    elseif score >= 90 & score <= 100, disp('Grade : A'), grade = 'A' ;
    elseif score >= 80 & score < 90, disp('Grade : B'), grade = 'B' ;
    elseif score >= 70 & score < 80, disp('Grade : C'), grade = 'C' ;
    elseif score >= 60 & score < 70, disp('Grade : D'), grade = 'D' ;
    elseif score >= 0 & score < 60
        disp('Grade : F')
        disp('I thinks we need some talk.')
        grade = 'F' ;
    else, disp("Who are you? I don't know who you are.")
        grade = ' Error' ;
end