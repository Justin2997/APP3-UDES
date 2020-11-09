function [inconnuNP300, inconnuP300] = inconnuTestPlusProcheVoisin(inconnus, baricentreNP300, baricentreP300, k)
    %% Initialisation
    inconnuNP300 = [];
    inconnuP300 = [];
    
    test_inconnuSize = size(inconnus, 1);
    
    for index = 1:test_inconnuSize  
        %% Calcule de la distance
        A = inconnus(index, :);
        A = [A(:, 3), A(:, 4)]; % TODO Changer sa quand decoraltion va être fini
        
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
    end
    
    test_inconnuNP300Size = size(inconnuNP300, 1);
    test_inconnuP300Size = size(inconnuP300, 1);
    
    fprintf('=========================== \n');
    fprintf('Inconnus              \n', k);
    fprintf('K                = %.4f \n', k);
    fprintf('Inconnu P300     = %.4f \n', test_inconnuP300Size);
    fprintf('Inconnu NP300    = %.4f \n', test_inconnuNP300Size);
    fprintf('Inconnu Total    = %.4f \n', test_inconnuSize);
    fprintf('=========================== \n');
end

