function [frontiaire, nouveauNP300, nouveauP300] = frontiairePlusProcheVoisin(nP300, P300)
    %% Init
    nP300 = resample(nP300, 1, 4);
    k = 2;
    
    nouveauNP300 = [];
    nouveauP300 = [];
    frontiaire = 0;

    %% Prend 2 baricentres aléatoire
    nP300min = 1;
    nP300max = size(nP300, 1);
    nP300rand = ceil(nP300min + rand(1, 1) * (nP300max - nP300min));
    
    P300min = 1;
    P300max = size(P300, 1);
    P300rand = ceil(P300min + rand(1, 1) * (P300max - P300min));
    
    baricentreNP300 = nP300(nP300rand, :);
    baricentreP300 = P300(P300rand, :);
    
    nouveauNP300 = [nouveauNP300; baricentreNP300];
    nouveauP300 = [nouveauP300; baricentreP300];
    
    nP300(nP300rand, :) = [];
    P300(P300rand, :) = [];
    
    combinaisonDonne = [P300; nP300];
    combinaisonDonneSize = size(combinaisonDonne, 1);
    
    %% Classer les X suivant les représentants les plus proches
    for index = 1:combinaisonDonneSize
       point = combinaisonDonne(index, :);
       
       distance_from_P300 = sum((baricentreP300 - point) .^ 2, 2);
       distance_from_NP300 = sum((baricentreNP300 - point) .^ 2, 2);
       
       if (distance_from_P300 < distance_from_NP300)
           % C'est un P300
           nouveauP300 = [nouveauP300; point];
       else
           % C'est un NP300
           nouveauNP300 = [nouveauNP300; point];
       end
       
       % Recalcule du barricentre       
       baricentreNP300 = mean(nouveauNP300);
       baricentreNP300 = mean(nouveauNP300);
    end
    
    fprintf('=========================== \n');
    fprintf('K                       = %.4f \n', k);
    fprintf('Classification P300     = %.4f \n', size(nouveauP300, 1));
    fprintf('Classification NP300    = %.4f \n', size(nouveauNP300, 1));
    fprintf('=========================== \n');
end

