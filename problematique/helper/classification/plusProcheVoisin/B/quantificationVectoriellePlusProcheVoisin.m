% Author: Justin Brulotte, Gabriel Bouchard, Sébastien Pomerleau
% Université de Sherbrooke, APP3 S8GIA, A2020

function [baricentreNP300, baricentreP300] = quantificationVectoriellePlusProcheVoisin(nP300, P300, nombreBaricentreInitial)
    %% Init
    nP300 = resample(nP300, 1, 4);
    
    nouveauNP300 = [];
    nouveauP300 = [];

    %% Prend 2 baricentres aléatoire
    nP300min = 1;
    nP300max = size(nP300, 1);
    nP300rand = ceil(nP300min + rand(1, nombreBaricentreInitial) * (nP300max - nP300min));
    
    P300min = 1;
    P300max = size(P300, 1);
    P300rand = ceil(P300min + rand(1, nombreBaricentreInitial) * (P300max - P300min));
    
    baricentreNP300 = nP300(nP300rand, :);
    baricentreP300 = P300(P300rand, :);
    
    baricentreNP300 = mean(baricentreNP300);
    baricentreP300 = mean(baricentreP300);
    
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
           
           tempP300 = baricentreP300;
           if (size(nouveauP300, 1) ~= 1)
                baricentreP300 = mean(nouveauP300);

                if (tempP300 == baricentreP300)
                    break 
                end
            end
       else
           % C'est un NP300
           nouveauNP300 = [nouveauNP300; point];
           
           tempNP300 = baricentreNP300;
           if (size(nouveauNP300, 1) ~= 1)
                baricentreNP300 = mean(nouveauNP300);

                if (tempNP300 == baricentreNP300)
                    break 
                end
           end
       end
    end
    
    fprintf('=========================== \n');
    fprintf('Nombre de baricentre inital = %.4f \n', nombreBaricentreInitial);
    fprintf('Classification P300         = %.4f \n', size(nouveauP300, 1));
    fprintf('Classification NP300        = %.4f \n', size(nouveauNP300, 1));  
    fprintf('=========================== \n');
end

