function [frontiaire] = frontiairePlusProcheVoisin(nP300, P300)
    %% Prend 2 baricentres aléatoire
    nP300min = 1;
    nP300max = size(nP300, 1);
    nP300rand = nP300min + rand(1, 1) * (nP300max - nP300min);
    
    P300min = 1;
    P300max = size(P300, 1);
    P300rand = P300min + rand(1, 1) * (P300max - P300min);
    
    baricentreNP300 = nP300(nP300rand, :);
    baricentreP300 = P300(P300rand, :);
    
    %% Classer les X suivant les représentants les plus proches
    for index = 1:nP300max
       
    end
end

