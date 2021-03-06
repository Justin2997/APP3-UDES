% Author: Justin Brulotte, Gabriel Bouchard, Sébastien Pomerleau
% Université de Sherbrooke, APP3 S8GIA, A2020

function [inconnuNP300, inconnuP300] = inconnuTestPlusProcheVoisin(inconnus, baricentreNP300, baricentreP300, k)
    %% Initialisation
    inconnuNP300 = [];
    inconnuP300 = [];
    
    test_inconnuSize = size(inconnus, 1);
    inconnuP300Size = 0;
    inconnuNP300Size = 0;
    
    for index = 1:test_inconnuSize  
        %% Calcule de la distance
        A = inconnus(index, :);

        temp_nP300 = baricentreNP300;
        temp_P300  = baricentreP300;
        
        for kIndex = 1:k
            distance_from_P300 = sum((temp_P300 - A) .^ 2, 2);
            distance_from_NP300 = sum((temp_nP300 - A) .^ 2, 2);
        
            min_distance_from_P300 = min(distance_from_P300);
            min_distance_from_NP300 = min(distance_from_NP300);
            
            if (min_distance_from_P300 < min_distance_from_NP300)
                inconnuP300 = [inconnuP300; temp_P300(distance_from_P300 == min(distance_from_P300),:)];
                temp_P300(distance_from_P300 == min(distance_from_P300),:) = [];
            else
                inconnuNP300 = [inconnuNP300; temp_nP300(distance_from_NP300 == min(distance_from_NP300),:)];
                temp_nP300(distance_from_NP300 == min(distance_from_NP300),:) = [];
            end
        end
        
        if (size(inconnuP300, 1) >= size(inconnuNP300, 1))
            inconnuP300Size = inconnuP300Size + 1;
        else
            inconnuNP300Size = inconnuNP300Size + 1;
        end
    end
    
    fprintf('=========================== \n');
    fprintf('Inconnus              \n');
    fprintf('K                = %.4f \n', k);
    fprintf('Inconnu P300     = %.4f \n', inconnuP300Size);
    fprintf('Inconnu NP300    = %.4f \n', inconnuNP300Size);
    fprintf('Inconnu Total    = %.4f \n', test_inconnuSize);
    fprintf('=========================== \n');
end

